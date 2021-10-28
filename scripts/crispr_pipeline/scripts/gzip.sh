#!/bin/bash
#SBATCH --job-name="gzip"
#SBATCH -A p31378
#SBATCH -p short
#SBATCH -t 04:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=10G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=out_bbduk.txt
#SBATCH --error=err_bbduk.txt

cd /projects/p31378/comammox/raw_reads

gzip SG_05_27_2016_S16_trimmed_1.fastq
gzip SG_07_05_2017_S18_trimmed_1.fastq
