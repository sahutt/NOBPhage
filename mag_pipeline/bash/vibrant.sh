#!/bin/sh
#SBATCH -A p30712
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 10
#SBATCH -t 12:00:00
#SBATCH --mem=32GB
#SBATCH --job-name="tb_vibrant_metaspades"
#SBATCH --mail-user=stefaniehuttelmaier2024@u.northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/vibrant.out
#SBATCH --error=/projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/vibrant.err

module purge all
module load python

source activate /projects/p31378/conda_envs/vibrant
