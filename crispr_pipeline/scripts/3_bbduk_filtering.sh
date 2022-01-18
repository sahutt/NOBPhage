#!/bin/bash
#SBATCH --job-name="bbduk"
#SBATCH -A p31378
#SBATCH -p short
#SBATCH -t 02:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=20G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=out_bbduk.txt
#SBATCH --error=err_bbduk.txt

module purge all

cd /projects/p31378/bbmap_38.94

# before running bbduk, make sure that the k-mer length (k=#) is equal to the length of the shortest direct repeat
# this is a column in the crisprreports.tsv files and the summary.csv


#BBDuk flags:
# - Xmx18g - disables cap on memory, BBDuk automatically limits memory usage to half of availabe
# the 18g in this flag tells BBDuk to use 18gb, or just under the 20gb alloted
# -eoom - no clue what this is
# in,in2 - fastq files that will be searched for the target sequences
#outm, outm2 - fastq outputs that contain the reads that matched to you query
# Note: if you want the unmatched files, use flags out, out2
# k=23 - the kmer length that must match  
# mm=f - this disables 'maskmiddle' which inores the middle base of a kmer. This only allows for exact matches
# hdist=1 - hamming number? stores more kmers the higher this gets? 
#rcomp-T - this matches forward and and reverse complements, set to f if you only want matches in the forward orientation

# s16
./bbduk.sh -Xmx18g -eoom \
in=/projects/p31378/comammox/raw_reads/SG_05_27_2016_S16_trimmed_1.fastq.gz \
in2=/projects/p31378/comammox/raw_reads/SG_05_27_2016_S16_trimmed_2.fastq.gz \
outm=/projects/p31378/comammox/results/crispr2/S16/pooled_S16_matched_1.fastq.gz \
outm2=/projects/p31378/comammox/results/crispr2/S16/pooled_S16_matched_2.fastq.gz \
k=23 mm=f \
ref=/projects/p31378/comammox/results/crisprcasfinder/uniqueDR_sequences.fa \
hdist=1 rcomp=T

# s17
./bbduk.sh -Xmx18g -eoom \
in=/projects/p31378/comammox/raw_reads/SG_01_11_2017_S17_trimmed_1.fastq.gz \
in2=/projects/p31378/comammox/raw_reads/SG_01_11_2017_S17_trimmed_2.fastq.gz \
outm=/projects/p31378/comammox/results/crispr2/S17/pooled_S17_matched_1.fastq.gz \
outm2=/projects/p31378/comammox/results/crispr2/S17/pooled_S17_matched_2.fastq.gz \
k=23 mm=f \
ref=/projects/p31378/comammox/results/crisprcasfinder/uniqueDR_sequences.fa \
hdist=1 rcomp=T

# s18
./bbduk.sh -Xmx18g -eoom \
in=/projects/p31378/comammox/raw_reads/SG_07_05_2017_S18_trimmed_1.fastq.gz \
in2=/projects/p31378/comammox/raw_reads/SG_07_05_2017_S18_trimmed_2.fastq.gz \
outm=/projects/p31378/comammox/results/crispr2/S18/pooled_S18_matched_1.fastq.gz \
outm2=/projects/p31378/comammox/results/crispr2/S18/pooled_S18_matched_2.fastq.gz \
k=23 mm=f \
ref=/projects/p31378/comammox/results/crisprcasfinder/uniqueDR_sequences.fa \
hdist=1 rcomp=T
