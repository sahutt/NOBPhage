#!/bin/sh
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 12:00:00
#SBATCH --mem=0
#SBATCH --job-name="run_metaviralspades"
#SBATCH --mail-user=@u.northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/p31378/comammox/results/metaviralspades/metaviralspades.out
#SBATCH --error=/projects/p31378/comammox/results/metaviralspades/metaviralspades.err

module purge all
module load python/anaconda

cd /projects/p31378/SPAdes-3.15.0-Linux/bin

#python metaspades.py --pe1-1 /projects/p31378/comammox/SG_01_11_2017_S17_R1_trimmed.fq.gz --pe1-2 /projects/p31378/comammox/SG_01_11_2017_S17_R2_trimmed.fq.gz /
-o /projects/p31378/comammox/results/metaspades

python metaviralspades.py --pe1-1 /projects/p31378/comammox/SG_01_11_2017_S17_R1_trimmed.fq.gz --pe1-2 /projects/p31378/comammox/SG_01_11_2017_S17_R2_trimmed.fq.gz /
-o /projects/p31378/comammox/results/metaviralspades


##note metaspades failed with mem=0, n=16 with timeout at 8 hours for single metagenome, extend runtime

