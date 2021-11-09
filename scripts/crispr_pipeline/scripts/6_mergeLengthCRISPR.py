#!/usr/bin/env python2.7


from Bio import pairwise2, SeqIO
from Bio.pairwise2 import format_alignment
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('spacers', help='spacers file [.fa]')
parser.add_argument('names', help='nemas file [.names]') #
parser.add_argument('outname', help='Comon name for output files')
#parser.add_argument('-m', type=, default=0, action='store_true', help='number of mismatches')
args = parser.parse_args()

spacerData2 = dict()
namesDict = dict()
JoinSeq = 0
seqConsDict = dict()


# Read fasta file of sp-DR-sp
with open(args.spacers,"rt") as spacersFile:
    spacerData = spacersFile.read().split('>')[1:]

for n in spacerData:
    spacerData2[n.split('\n')[0]] = n.split('\n')[1]

with open(args.names,"rt") as namesFile:
    namesData = namesFile.read().split('\n')[:-1]

for m in namesData:
    namesItem = m.split('\t')
    namesDict[namesItem[0]] = namesItem[1]

print "Total sequences:", len(spacerData)
print "Main names:", len(namesData)


def ConsenSeq (mainName,mainSeq,compSeq,startPos,endPos):
    seqStart = ''
    seqEnd = ''
    seqCons = ''
    if "-" in set(mainSeq[:startPos]):
        if "-" in set(compSeq[:startPos]):
            print "error seqStart"
        else:
            seqStart = compSeq[:startPos]
    else:
        seqStart = mainSeq[:startPos]

    if "-" in set(mainSeq[endPos:]):
        if "-" in set(compSeq[endPos:]):
            print "error endPos"
        else:
            seqEnd = compSeq[endPos:]
    else:
        seqEnd = mainSeq[endPos:]

    seqCons = seqStart + mainSeq[startPos:endPos] + seqEnd
    return str(mainName)+'\t'+str(seqCons)


## Align each par of outSequences
for seq in spacerData2:
    for seq2 in spacerData2:
        if seq != seq2 and spacerData2[seq] != "" and spacerData2[seq2] != "" :
            if namesDict[seq] != "" and namesDict[seq2] != "":
                alignment = pairwise2.align.localms(spacerData2[seq],spacerData2[seq2],2,-1,-5,-1)
                alignment2 = pairwise2.align.globalmx(spacerData2[seq],spacerData2[seq2],2,-1)
                ## Check if join sequences
                if alignment[0][2] >= ((alignment[0][4]-alignment[0][3])*2)-6 and alignment[0][2] >= (alignment2[0][2])-6: ## allow 2 mismatches (-6 score)
                    print seq, seq2, alignment[0][3], alignment[0][4],((alignment[0][4]-alignment[0][3])*2), ((alignment[0][4]-alignment[0][3])*2)-6    # allow 2 mismatches
                    print(format_alignment(*alignment[0]))
                    print(format_alignment(*alignment2[0]))
                    print "Positivo"
                    JoinSeq += 1
                    if len(namesDict[seq].split(',')) >= len(namesDict[seq2].split(',')):
                        print seq, namesDict[seq] ,"LEN1:", len(namesDict[seq].split(','))
                        print seq2, namesDict[seq2] ,"LEN2:", len(namesDict[seq2].split(','))
                        namesDict[seq] = str(namesDict[seq])+','+str(namesDict[seq2])
                        print seq, namesDict[seq],"newLEN1:", len(namesDict[seq].split(','))
                        namesDict[seq2] = ""
                        FinalSequence = ConsenSeq(seq,alignment[0][0],alignment[0][1],alignment[0][3],alignment[0][4])
                    else:
                        print seq, namesDict[seq] ,"LEN1:", len(namesDict[seq].split(','))
                        print seq2, namesDict[seq2], "LEN2:", len(namesDict[seq2].split(','))
                        namesDict[seq2] = str(namesDict[seq2])+','+str(namesDict[seq])
                        print seq2, namesDict[seq2], "newLEN2:", len(namesDict[seq2].split(','))
                        namesDict[seq] = ""
                        FinalSequence = ConsenSeq(seq2,alignment[0][1],alignment[0][0],alignment[0][3],alignment[0][4])
                    print ">>>\n",FinalSequence
                    seqConsDict[FinalSequence.split('\t')[0]] = FinalSequence.split('\t')[1]

spacerData2.update(seqConsDict)
for j in spacerData2:
    if namesDict[j] == '':
        spacerData2[j] = ''
print "\nTotal sequences:", len(spacerData), "| Main names:", len(namesData), "| Joined sequences:",JoinSeq

with open(args.outname+'.fasta',"wt") as outSeqFasta:
    for nSeq in spacerData2:
        if spacerData2[nSeq] != '':
            outSeqFasta.write('>'+str(nSeq)+'\n')
            outSeqFasta.write(str(spacerData2[nSeq])+'\n')

with open(args.outname+'.names',"wt") as outSeqNames:
    for rSeq in namesDict:
        if namesDict[rSeq] != '':
            outSeqNames.write(str(rSeq)+'\t')
            outSeqNames.write(str(namesDict[rSeq])+'\n')
