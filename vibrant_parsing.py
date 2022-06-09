'''
NOB Phage project
McKenna 5/31/22
Filtering VIBRANT phage genomes/contigs by quality
This script requires biopython conda environment
'''

### edit these lines for each new batch ###

# parent vibrant folder
vibrant_in_path = "/projects/b1052/Stefanie/NOB/results/vibrant/SG_07_05_2017"
out_seq_name = "VIBRANT_phages_scaffold_filtered.fna"
out_report_name = "VIBRANT_scaffolds_summary.csv"

filt_level = "low" # the level you want to remove
# pick between low, medium, high, and circular
# if you pick medium or high, the script will also remove the levels below that
# if you pick high, you only keep circular
###



### these lines stay the same ###

import os
import pandas as pd
from Bio import SeqIO

quality_dict = {"low": "low quality draft",
                "medium": "medium quality draft",
                "high": "high quality draft",
                "circular": "complete circular"}

in_quality = os.path.join(vibrant_in_path, "VIBRANT_scaffolds/VIBRANT_results_scaffolds", "VIBRANT_genome_quality_scaffolds.tsv") # file path to reports
in_sequences = os.path.join(vibrant_in_path, "VIBRANT_scaffolds/VIBRANT_phages_scaffolds", "scaffolds.phages_combined.fna")
in_summary = os.path.join(vibrant_in_path, "VIBRANT_scaffolds/VIBRANT_results_scaffolds", "VIBRANT_summary_results_scaffolds.tsv")

out_seq_file = os.path.join(vibrant_in_path, out_seq_name) # saved in vibrant parent folder specified above
out_report_file = os.path.join(vibrant_in_path, out_report_name) # saved in vibrant parent folder specified above

# summarizing reports
quality = pd.read_csv(in_quality, sep="\t")
summary = pd.read_csv(in_summary, sep="\t")

report = quality.merge(summary,on="scaffold")
report.to_csv(out_report_file,index=False)

# filtering sequences
if filt_level=="low":
    filter_quality = [quality_dict["low"]]
elif filt_level=="medium":
    filter_quality = [quality_dict["low"], quality_dict["medium"]]
elif filt_level=="high":
    filter_quality = [quality_dict["low"], quality_dict["medium"], quality_dict["high"]]

# picking which ones to exclude
exclude_df = quality.loc[quality["Quality"].isin(filter_quality)]
exclude = exclude_df["scaffold"].tolist()

fasta_sequences = SeqIO.parse(open(in_sequences), "fasta")
with open(out_seq_file, "w") as output_handle:
   for fasta in fasta_sequences:
        if fasta.id not in exclude:
            SeqIO.write([fasta], output_handle, "fasta")
