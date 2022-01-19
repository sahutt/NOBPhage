#!/bin/bash
#SBATCH --job-name="blast_05"
#SBATCH -A p31378
#SBATCH -p short
#SBATCH -t 02:00:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --output=blast_05.out
#SBATCH --error=blast_05.err

module purge all
module load blast/2.12.0

cd /projects/b1052/Stefanie/NOB/CMX/metawrap/bin_refine/SG_05_27_2016/metawrap_80_10_bins/

for F in *.fa
do
  echo blasting $F
  blastn -query $F -db /projects/p31378/comammox/blast_dbs/nob_dr -task blastn -max_target_seqs 2 \
  -outfmt 6 -out /projects/p31378/comammox/results/blast_dr_cmx/05/$F.txt
done
