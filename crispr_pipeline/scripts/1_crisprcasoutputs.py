'''
NOB Phage CRISPR Analysis
Automates parsing of CRISPRCasFinder outputs.
Imports CRISPRCasFinder tsv outputs and saves a summary output file
'''

### edit these lines for each new batch ###

# path to reports - saved to one folder via awk scripts
reports_in_path = "/projects/p31378/comammox/results/crispr_reports/"
# parent folder of sequences path
reports_out_path = "/projects/p31378/comammox/results/crisprcasfinder/"
###

import glob
import os
import csv
import pandas as pd

in_reports = glob.glob(os.path.join(reports_in_path, "*_REPORT.tsv")) # file path to reports
in_sequences = glob.glob(os.path.join(reports_out_path, "crisprcasfinder_summary.csv"))
out_summary = os.path.join(reports_out_path, "crisprcasfinder_summary.csv") # file path to output summary


# summarizing reports
data = [] # empty list to append dfs to

for i in in_reports:
    in_data = pd.read_csv(i, header=0, sep="\t")
    in_data["filename"] = os.path.basename(i)
    data.append(in_data)

big_data = pd.concat(data, ignore_index=True) # concat all tsvs
big_data.to_csv(out_summary, index=False) # save to csv
