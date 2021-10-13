#!/bin/sh
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 5
#SBATCH -t 12:00:00
#SBATCH --mem=25GB 
#SBATCH --job-name="metawrap__metaspades_binning_firstbatch"
#SBATCH --mail-user=stefaniehuttelmaier2024@u.northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1052/Wells_b1042/Stefanie/toothbrushes/metawrap_metaspades/binning1.out
#SBATCH --error=/projects/b1052/Wells_b1042/Stefanie/toothbrushes/metawrap_metaspades/binning1.err

module purge all
module load python/anaconda3.6
source activate /projects/p31378/conda_envs/metawrap-env

cd /projects/p30712/phage/results/fastp


gunzip SRR10744092*.fastq.gz
metawrap binning -o /projects/b1052/Wells_b1042/Stefanie/toothbrushes/metawrap_metaspades/SRR10744092 -t 24 /
-a /projects/b1052/Wells_b1042/Stefanie/toothbrushes/metaspades/SRR10744092/scaffolds.fasta /
--metabat2 --maxbin2 /projects/p30712/phage/results/fastp/SRR10744092*.fastq 
gzip SRR10744092*.fastq
