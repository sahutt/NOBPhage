'''
NOB Phage CRISPR Analysis
Automates parsing of CRISPRCasFinder outputs.
Imports CRISPRCasFinder tsv outputs, saves a summary output file, and preps direct repeats for BLAST.
'''
### edit these lines for each new batch ###

# path to reports - saved to one folder via awk scripts
reports_path = "/projects/p31378/comammox/results/crispr_reports/"
# parent folder of sequences path
sequences_path = "/projects/p31378/comammox/results/crisprcasfinder/"
# path to output folder - produces a summary file and sequence file
out_path = "/projects/p31378/comammox/results/crisprcasfinder/"

###

import glob
import os
import csv

in_reports = glob.glob(os.path.join(reports_path, "*_REPORT.tsv")) # file path to reports
in_sequences = glob.glob(os.path.join(sequences_path, "**/rawCRISPRs.fna"), recursive=True) # file path to sequences
out_summary = os.path.join(out_path, "crisprcasfinder_summary.csv") # file path to output summary
out_sequences = os.path.join(out_path, "crisprcasfinder_sequences.fa")  # file path to output sequence file

first = True
# saving sequence file
with open(out_summary, "w") as outfile: # prep output file
    wr = csv.writer(outfile, delimiter=",")
    for fname in in_reports: # loop through each crispr report
        with open(fname) as infile:
            report = csv.reader(infile, delimiter="\t")
            if first: # if first, save top row for header
                first = False
                for lines in report: # ignore blank rows
                    if any(x.strip() for x in lines):
                        wr.writerow(lines)
            else:
                next(report)
                for lines in report: # ignore blank rows
                    if any(x.strip() for x in lines):
                        wr.writerow(lines)

# saving sequence file
with open(out_sequences, "w") as outfile:
    for fname in in_sequences:
        with open(fname) as infile:
            for line in infile:
                outfile.write(line)
