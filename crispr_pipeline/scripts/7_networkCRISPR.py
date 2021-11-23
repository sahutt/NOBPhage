#!/usr/bin/env python2.7

## python script retrieved from: https://github.com/GuerreroCRISPR/Gordonia-CRISPR 

import csv
import numpy as np
from Bio import pairwise2, SeqIO
from Bio.pairwise2 import format_alignment
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('dr', help='repetitive sequence')
parser.add_argument('spacers', help='Name of spacer-DR-spacer file [fasta]')    # file fasta from mothur
parser.add_argument('names', help='file names')                                 # file names from mothur
parser.add_argument('outnetwork', help='Name of file for output network')
parser.add_argument('-m', type=int, default=2, help='number of mismatches [default=2]')
parser.add_argument('-s', type=float, default=20, help='min score to filter result [default=20]')
parser.add_argument('-r', type=int, default=0, help='min coverage to filter result [default=0]')
parser.add_argument('-p', type=float, default=0, help='max penalty value to filter result [default=0]')
args = parser.parse_args()

spacerData2 = []
spacerData3 = []
countPositAlign = 0
resultAlignList = []
spacer_dict = dict()
spacer_len_list = []

DR = (args.dr).upper()

# Read fasta file of sp-DR-sp
with open(args.spacers,"rt") as spacersFile:
    spacerData = spacersFile.read().split('>')[1:]

for n in spacerData:
    spacerData2.append(n.split('\n')[:2])

## Open file of reads
with open(args.names,"rt") as namesFile:
    namesData = namesFile.read().split('\n')[:-1]

for j in namesData:
    j_spacer = j.split('\t')[0]
    j_reads = j.split('\t')[1]
    j_readsClean = [r.replace('Rev', 'For').split('For')[0] for r in j_reads.split(',')]
    j_readsSet = set(j_readsClean)
    spacer_dict[j_spacer] = j_readsSet

print 'nr of sequences: ', len(spacerData)
print 'nr of names: ', len(spacer_dict)

## search for DR in each sequence
for seq in spacerData2:
    alignments = pairwise2.align.localms(seq[1],DR,2,-.1,-1.5,-1)
    spacerData3.append([seq[0],str(len(spacer_dict[seq[0]])),str(seq[1][:alignments[0][3]]\
    +' '+(seq[1][alignments[0][3]:alignments[0][4]]).lower()\
    +' '+seq[1][alignments[0][4]:])])

for m in spacerData3:
     spacer_len_list.append(len(m[2].split(' ')[0]))

print "Average spacer length:",round(np.mean(spacer_len_list),0)

for seq in spacerData3:
    for seq2 in spacerData3:
        if seq[0] != seq2[0] and len(seq[2].split(' ')[0]) > 15 and len(seq2[2].split(' ')[2]) > 15:
            alignments = pairwise2.align.localms(seq[2].split(' ')[0],seq2[2].split(' ')[2],2,-.1,-2,-1.5)
            if alignments[0][2] >= ((alignments[0][4]-alignments[0][3])*2)-(args.m*2.1):
                if alignments[0][2] >= float(args.s):
                    if len(spacer_dict[seq[0]] & spacer_dict[seq2[0]]) >= args.r:
                        if ((alignments[0][4]-alignments[0][3])*2)-(alignments[0][2]) <= float(args.p):
                            if alignments[0][2] <= 30:  # only print low score alignments
                                print seq[:3], seq2[:3], ((alignments[0][4]-alignments[0][3])*2)-(args.m*2.1)    # allow 2 mismatches (valor: 4.2)
                                print(format_alignment(*alignments[0]))
                            countPositAlign += 1
                            alignment_len = (alignments[0][4]-alignments[0][3])
                            penalties_value = ((alignments[0][4]-alignments[0][3])*2)-(alignments[0][2])
                            reads_cov = len(spacer_dict[seq[0]] & spacer_dict[seq2[0]])
                            print reads_cov
                            resultAlignList.append([str(seq[0]), str(seq2[0]), 'Directed', str(countPositAlign),str(alignments[0][2]),str(len(alignments[0][0])),\
                             str(alignment_len), str(penalties_value), str(reads_cov)])

print 'Positive alignments:',countPositAlign

with open (args.outnetwork+".edges.csv", 'wt') as file_result:
    Tablewriter = csv.writer(file_result, delimiter='\t')
    Tablewriter.writerow(['Source','Target','Type','id', 'Score', 'spacer_len', 'alig_len', 'penalty', 'read_cov'])
    for n in resultAlignList:
        Tablewriter.writerow (n)

with open (args.outnetwork+".nodes.csv", 'wt') as file_result2:
    Tablewriter = csv.writer(file_result2, delimiter='\t')
    Tablewriter.writerow(['id', 'cov', 'seq'])
    for n in spacerData3:
        Tablewriter.writerow (n)
