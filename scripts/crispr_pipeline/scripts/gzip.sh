#!/bin/bash
#SBATCH --job-name="gzip"
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -t 10:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mem=10G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=out_zip.txt
#SBATCH --error=err_zip.txt

cd /projects/p31378/comammox/results/crispr2

gzip -d ./*/*.fastq.gz
