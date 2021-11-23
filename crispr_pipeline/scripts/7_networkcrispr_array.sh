#!/bin/bash
#SBATCH -J networkcrispr_test_array
#SBATCH -A p31378
#SBATCH --mail-type=ALL
#SBATCH --mail-user=stefaniehuttelmaier2024@u.northwestern.edu
#SBATCH -N 1
#SBATCH -n 5
#SBATCH --mem=5GB
#SBATCH -t 4:00:00
#SBATCH --output=/projects/p31378/comammox/results/crispr2/pooled/out_err_files/networkcrispr_%A_%a.out
#SBATCH --error=/projects/p31378/comammox/results/crispr2/pooled/out_err_files/networkcrispr_%A_%a.err
#SBATCH -p short
#SBATCH --array=1-97%5

module purge all
module load python/anaconda

param_store=./networkcrispr_commands.txt
param_a=$(cat $param_store | awk -v var=$SLURM_ARRAY_TASK_ID 'NR==var {print $2}')
param_b=$(cat $param_store | awk -v var=$SLURM_ARRAY_TASK_ID 'NR==var {print $1}')

python /projects/p31378/comammox/scripts/networkCRISPR.py $param_a /projects/p31378/comammox/results/crispr2/pooled/$param_b.mergeLC.fasta /projects/p31378/comammox/results/crispr2/pooled/$param_b.mergeLC.names $param_b.network
