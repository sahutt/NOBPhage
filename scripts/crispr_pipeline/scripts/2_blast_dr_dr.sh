#!/bin/bash
#SBATCH --job-name="blast_dr_dr"
#SBATCH -A p31378
#SBATCH -p short
#SBATCH -t 00:30:00
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=out_blast.txt
#SBATCH --error=err_blast.txt

module purge all
module load blast/2.12.0

cd /projects/p31378/comammox/blast_dbs

blastn -query /projects/p31378/comammox/results/crisprcasfinder/crisprcasfinder_sequences.fa \
-db nob_dr -task blastn -max_target_seqs 2 \
-out /projects/p31378/comammox/results/crisprcasfinder/blast/blast_dr_dr_1hit.txt -outfmt 6
