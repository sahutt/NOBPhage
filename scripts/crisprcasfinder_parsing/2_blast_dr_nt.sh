#!/bin/bash
#SBATCH --job-name="blast_dr_nt"
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -t 24:00:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=out_blast.txt
#SBATCH --error=err_blast.txt

module purge all
module load blast/2.12.0

cd /projects/genomicsshare/blast/nt

blastn -query /projects/p31378/comammox/results/crisprcasfinder/crisprcasfinder_sequences.fa \
-db nt -task blastn -evalue 0.01 \
-out /projects/p31378/comammox/results/crisprcasfinder/blast_dr_nob.txt -outfmt 6
