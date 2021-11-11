#!/usr/bin/env python2.7


from Bio import pairwise2, SeqIO
from Bio.Seq import reverse_complement
from Bio.pairwise2 import format_alignment
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('CR', help='CRISPR repeat sequence')
parser.add_argument('source_file', help='Name of file with information of sample, fastq1 and fastq2') # file in list TAB format only
parser.add_argument('outfile', help='Comon name for output files')
#parser.add_argument('-m', type=, default=0, action='store_true', help='number of mismatches')
args = parser.parse_args()

records = []
samplesList = []

## Parse of source_file
with open(args.source_file,'rt') as source_file_list:
    sourceData = source_file_list.read().split('\n')[:-1]

for n in sourceData:
    if n.split('\t')[0] not in samplesList:
        samplesList.append(n.split('\t')[0])
    if len(n.split('\t')) == 3: ## Two fastq files
        records1 = list(SeqIO.parse(n.split('\t')[1], "fastq"))
        for n1 in records1:
            n1.id = str(n.split('\t')[0]) + '\t' + n1.name
        records2 = list(SeqIO.parse(n.split('\t')[2], "fastq"))
        for n2 in records2:
            n2.id = str(n.split('\t')[0]) + '\t' + n2.name
        ## Combines two fastq files into one interlive data list
        for n in range(0,len(records1)):
            records.append(records1[n])
            records.append(records2[n])
    elif len(n.split('\t')) == 2: ## One fasta file
        records3 = list(SeqIO.parse(n.split('\t')[1], "fastq"))
        print n, len(records3)
        for n3 in records3:
            n3.id = str(n.split('\t')[0]) + '\t' + n3.name
        for n in range(0,len(records3)):
            records.append(records3[n])
records1 = []
records2 = []
records3 = []

#############################

#             spacer                        DR                          spacer
#    ---------------------------------____________________________---------------------------------
DR = (args.CR).upper()

allReadsResult = []
DRresult = []
wind = 5
startPos = 0
endPos = len(args.CR)+7
last_inc = endPos-wind
DRcount = 0 # Count DR sequences
SDRScount = 0 # Count spacerDRspacer sequences
outSequences = []

def search_dr (DR,x,startPos,endPos,wind,last_inc):
    DRtrim = DR[1:-1]
    DRresult = []
    while startPos < len(x)-last_inc: # last increment
        if endPos > len(x):
            endPos = len(x)
        alignments = pairwise2.align.localms(x[startPos:endPos],DRtrim,2,-.1,-1.1,-1.1)
        ## Check if alignment is a DR match
        if alignments[0][2]/(alignments[0][4]-alignments[0][3]) >= float(len(DRtrim))/(len(DRtrim)-2.1):
            if alignments[0][2] == len(DRtrim)*2:
                DRmatch = '100% match'
                if [1 + startPos + alignments[0][3], startPos + alignments[0][4]] in DRresult:
                    pass
                else:
                    DRresult.append([1 + startPos + alignments[0][3], startPos + alignments[0][4]])
                    print alignments[0][3:5],startPos,endPos, DRmatch, str(alignments[0][2]/(alignments[0][4]-alignments[0][3])), \
                    str(float(len(DRtrim))/(len(DRtrim)-2.1)) , startPos + alignments[0][3], startPos + alignments[0][4]
                    print(format_alignment(*alignments[0]))

            elif alignments[0][2] == (len(DRtrim)*2)-2.1:
                DRmatch = 'DR whith 1 mismatch'
                if [1 + startPos + alignments[0][3], startPos + alignments[0][4]] in DRresult:
                    pass
                else:
                    DRresult.append([1 + startPos + alignments[0][3], startPos + alignments[0][4]])
                    print alignments[0][3:5],startPos,endPos, DRmatch, str(alignments[0][2]/(alignments[0][4]-alignments[0][3])), \
                    str(float(len(DRtrim))/(len(DRtrim)-2.1)) , startPos + alignments[0][3], startPos + alignments[0][4]
                    print(format_alignment(*alignments[0]))

            elif alignments[0][2] == (len(DRtrim)*2)-4.2:
                DRmatch = 'DR whith 2 mismatches'
                if [1 + startPos + alignments[0][3], startPos + alignments[0][4]] in DRresult:
                    pass
                else:
                    DRresult.append([1 + startPos + alignments[0][3], startPos + alignments[0][4]])
                    print alignments[0][3:5],startPos,endPos, DRmatch, str(alignments[0][2]/(alignments[0][4]-alignments[0][3])), \
                    str(float(len(DRtrim))/(len(DRtrim)-2.1)) , startPos + alignments[0][3], startPos + alignments[0][4]
                    print(format_alignment(*alignments[0]))
            else:
                DRmatch = 'Partial match'
        startPos += wind
        endPos += wind
    return DRresult # DRcount

readNr = 0.5
for n in records:
    xF = (n.seq) # read sequence
    xR = reverse_complement(n.seq)
    y = (n.id)  # read id
    readNr += 0.5
## 1.1 search DR in forward read sequence
    print '\n',y, DR
    readResult = search_dr(DR,xF,startPos,endPos,wind,last_inc)
    DRcount += len(readResult)
    allReadsResult.append(readResult)
    print 'read_result:',readResult, len(readResult)
    if readResult != []:
        coorList = [0]
        for coor in readResult:
            coorList.append(coor[0])
            coorList.append(coor[1])
        if coorList[1] > 30:            ## Limit the 5' side to 30 (approx. spacer length)
            coorList[0] = coorList[1]-30
        if len(xF) < coorList[-1]+30:   ## Limit the 3' side to 30 (approx. spacer length)
            coorList.append(len(xF))
        else:
            coorList.append(coorList[-1]+30)
        print coorList, 'len:',len(xF)
## 1.2 search for the spacer-DR-spacer
        coorStart = 0
        coorDRstart = 1
        coorDRend = 2
        coorEnd = 3
        DRNr = 0
        for q in readResult:
            if coorList[coorDRstart] < 10:   ## Discard the sequence if 5' < 10bp
                pass
            elif coorList[coorDRend] > len(xF)-11:   ## Discard the sequence if 3' < 10bp
                pass
            else:
                DRNr += 1
                seq_sDRsLow = str(xF[coorList[coorStart]:coorList[coorDRstart]-2])+' '+\
                str(xF[coorList[coorDRstart]-2:coorList[coorDRend]+1]).lower()+' '+\
                str(xF[coorList[coorDRend]+1:coorList[coorEnd]-1])
                outSequences.append(y.rsplit('\t',1)[1] + "F_" + str(readNr) + "_" + str(DRNr) + "\t" + \
                str(y) + "\t" + seq_sDRsLow + '\n') ## Atention: parse the read name

            coorStart += 2
            coorEnd += 2
            coorDRstart += 2
            coorDRend += 2
## 2.1 search DR in reverse-complement read sequence
    print '\n', y, 'Reverse-complement'
    readResult = search_dr(DR,xR,startPos,endPos,wind,last_inc)
    allReadsResult.append(readResult)
    DRcount += len(readResult)
    print "read_result:",readResult , len(readResult)
    if readResult != []:
        coorList = [0]
        for coor in readResult:
            coorList.append(coor[0])
            coorList.append(coor[1])
        if coorList[1] > 30:            ## Limit the 5' side to 30 (approx. spacer length)
            coorList[0] = coorList[1]-30
        if len(xR) < coorList[-1]+30:   ## Limit the 3' side to 30 (approx. spacer length)
            coorList.append(len(xR))
        else:
            coorList.append(coorList[-1]+30)
        print coorList, 'len:', len(xR)
## 2.2 search for the spacer-DR-spacer
        coorStart = 0
        coorDRstart = 1
        coorDRend = 2
        coorEnd = 3
        DRNr = 0
        for q in readResult:
            if coorList[coorDRstart] < 10:   ## Discard the sequence if 5' < 10bp
                pass
            elif coorList[coorDRend] > len(xF)-11:   ## Discard the sequence if 3' < 10bp
                pass
            else:
                DRNr += 1
                seq_sDRsLow = str(xR[coorList[coorStart]:coorList[coorDRstart]-2])+' '+\
                str(xR[coorList[coorDRstart]-2:coorList[coorDRend]+1]).lower()+' '+\
                str(xR[coorList[coorDRend]+1:coorList[coorEnd]-1])
                outSequences.append(y.rsplit('\t',1)[1] + "R_" + str(readNr) + "_" + str(DRNr) + "\t" + \
                str(y) + "\t" + seq_sDRsLow + '\n')
            coorStart += 2
            coorEnd += 2
            coorDRstart += 2
            coorDRend += 2

with open(args.outfile,"wt") as outSeqFile:
    outSeqFile.write('\t'.join(samplesList)+'\n')
    for outsDRs in outSequences:
        outSeqFile.write(outsDRs)

# Make fasta file:
with open(args.outfile+'.fasta',"wt") as outSeqFasta:
    for outsDRs in outSequences:
        outSeqFasta.write('>'+str(outsDRs.split('\t')[0])+'\n')
        outSeqFasta.write(str(outsDRs.split('\t')[3]).replace(' ','').upper())

# Make group file:
with open(args.outfile+'.group',"wt") as outSeqGroup:
    for outsDRs in outSequences:
        outSeqGroup.write(str(outsDRs.split('\t')[0])+'\t'+str(outsDRs.split('\t')[1])+'\n')

print "\nNumber of samples:", len(samplesList)
print "Number of reads:", int(readNr//1)
print "Number of detected CR:", DRcount
print "Number of spacer-CR-spacer sequences (in files):", len(outSequences)
print "Output files:" , args.outfile, args.outfile+'.fasta', args.outfile+'.group'
