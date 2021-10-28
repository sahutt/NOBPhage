#!/bin/bash
#SBATCH --job-name="bbduk"
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -t 10:00:00
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

# s16
./bbduk.sh -Xmx18g -eoom \
in=/projects/p31378/comammox/raw_reads/SG_05_27_2016_S16_trimmed_1.fastq.gz \
in2=/projects/p31378/comammox/raw_reads/SG_05_27_2016_S16_trimmed_2.fastq.gz \
outm=/projects/p31378/comammox/results/crispr2/S16/pooled_S16_matched_1.fastq.gz \
outm2=/projects/p31378/comammox/results/crispr2/S16/pooled_S16_matched_2.fastq.gz \
k=23 mm=f \
ref=/projects/p31378/comammox/results/crisprcasfinder/crisprcasfinder_sequences.fa \
hdist=1 rcomp=T

# s17
./bbduk.sh -Xmx18g -eoom \
in=/projects/p31378/comammox/raw_reads/SG_01_11_2017_S17_trimmed_1.fastq.gz \
in2=/projects/p31378/comammox/raw_reads/SG_01_11_2017_S17_trimmed_2.fastq.gz \
outm=/projects/p31378/comammox/results/crispr2/S17/pooled_S17_matched_1.fastq.gz \
outm2=/projects/p31378/comammox/results/crispr2/S17/pooled_S17_matched_2.fastq.gz \
k=23 mm=f \
ref=/projects/p31378/comammox/results/crisprcasfinder/crisprcasfinder_sequences.fa \
hdist=1 rcomp=T

# s18
./bbduk.sh -Xmx18g -eoom \
in=/projects/p31378/comammox/raw_reads/SG_07_05_2017_S18_trimmed_1.fastq.gz \
in2=/projects/p31378/comammox/raw_reads/SG_07_05_2017_S18_trimmed_2.fastq.gz \
outm=/projects/p31378/comammox/results/crispr2/S18/pooled_S18_matched_1.fastq.gz \
outm2=/projects/p31378/comammox/results/crispr2/S18/pooled_S18_matched_2.fastq.gz \
k=23 mm=f \
ref=/projects/p31378/comammox/results/crisprcasfinder/crisprcasfinder_sequences.fa \
hdist=1 rcomp=T
