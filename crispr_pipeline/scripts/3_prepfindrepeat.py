'''
NOB Phage CRISPR Analysis
Automates parsing of CRISPRCasFinder outputs.
Produces text file with commands for findRepeatCRISPR.py script from Gordonia CRISPR workflow
'''


# dr-consensus repeat file
in_path = "/projects/p31378/comammox/results/crisprcasfinder/uniqueDR.csv"
# text file output
out_path = "/projects/p31378/comammox/results/crispr2/python_commands.txt"


# path where findRepeatCRISPR.py is saved
# script_path = "/projects/p31378/comammox/scripts/findRepeatCRISPR.py"
# source file for findrepeatCRISPR.py
source_path = "/projects/p31378/comammox/results/crispr2/sourcefile.txt"

# out path template for findRepeatCRISPR
out_template = "/projects/p31378/comammox/results/crispr2/pooled/"

###

import os
import csv
import pandas as pd

# adding sequences to fa file for blasting
df = pd.read_csv(in_path, header=0, sep=",")

seq_id = df["DR_num"].tolist()
seq_dr = df["Consensus_Repeat"].tolist()

commands = [] # empty list where each command will go

for i in range(len(seq_dr)):
    out_name = seq_id[i] + ".txt"
    out = os.path.join(out_template, out_name)
    line = " ".join([seq_dr[i],source_path,out])
    commands.append(line)

with open(out_path, "w") as outfile:
    for i in range(len(commands)):
        outfile.write(commands[i] + "\n")
