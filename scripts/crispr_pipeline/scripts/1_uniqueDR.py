'''
NOB Phage CRISPR Analysis
Automates parsing of CRISPRCasFinder outputs.
Preps direct repeats for BLAST.
'''

### edit these lines for each new batch ###

# path to dr - consensus repeat file
in_path = "/projects/p31378/comammox/results/crisprcasfinder/uniqueDR.csv"
# parent folder of sequences path
out_path = "/projects/p31378/comammox/results/crisprcasfinder/uniqueDR_sequences.fa"
###

import os
import csv
import pandas as pd

# adding sequences to fa file for blasting
df = pd.read_csv(in_path, header=0, sep=",")

seq_id = df["DR_num"].tolist()
seq_dr = df["Consensus_Repeat"].tolist()

with open(out_sequences, "w") as outfile:
    for i in range(len(seq_id)):
        outfile.write(">" + seq_id[i] + "\n" + seq_dr[i] + "\n")
