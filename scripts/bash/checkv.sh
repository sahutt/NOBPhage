#!/bin/sh
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 6
#SBATCH -t 12:00:00
#SBATCH --mem=5G
#SBATCH --job-name="checkv"
#SBATCH --mail-user=mckennafarmer2023@u.northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/p31378/comammox/results/checkv/checkv.out
#SBATCH --error=/projects/p31378/comammox/results/checkv/checkv.err

module purge all
module load python/anaconda3.6

source activate /projects/p31378/conda_envs/checkv
export CHECKVDB=/projects/p31378/conda_envs/checkv/checkv-db-v1.0

checkv end_to_end /projects/p31378/comammox/results/metaviralspades/contigs/contigs_SG_05_27_2016.fasta /projects/p31378/comammox/results/checkv/SG_05_27_2016 -t 6

checkv end_to_end /projects/p31378/comammox/results/metaviralspades/contigs/contigs_SG_01_11_2017.fasta /projects/p31378/comammox/results/checkv/SG_01_11_2017 -t 6

checkv end_to_end /projects/p31378/comammox/results/metaviralspades/contigs/contigs_SG_07_05_2017.fasta /projects/p31378/comammox/results/checkv/SG_07_05_2017 -t 6
