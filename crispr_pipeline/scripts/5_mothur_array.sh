#!/bin/bash
#SBATCH -J mothur_array
#SBATCH -A p31378
#SBATCH --mail-type=ALL
#SBATCH --mail-user=stefaniehuttelmaier2024@u.northwestern.edu
#SBATCH -N 1
#SBATCH -n 5
#SBATCH --mem=50MB
#SBATCH -t 1:00:00
#SBATCH --output=/projects/p31378/comammox/results/crispr2/pooled/mothur_%A_%a.out
#SBATCH --error=/projects/p31378/comammox/results/crispr2/pooled/mothur_%A_%a.err
#SBATCH -p short
#SBATCH --array=1-96%5

module purge all
module load python/anaconda

param_store=./pooled.txt
param_a=$(cat $param_store | awk -v var=$SLURM_ARRAY_TASK_ID 'NR==var {print $0}')

##mothur was downloaded directly into the project folder, navigate to the folder to execute the following commands
cd /projects/p31378/comammox/results/crispr2/pooled/mothur

##ALL OF THE FOLLOWING COMMAND SHOULD BE ON ONE LINE
## ./mothur activates the program, the entire following commands need to be enclosed in "" and begin with a # inside the ""
## there are four sequential commands here, the output file from each is fed into the next command. These can be run
## as single commands from the command line if you would like to test on one file. In that case, the "" and # are not needed
./mothur "#summary.seqs(fasta=/projects/p31378/comammox/results/crispr2/pooled/$param_a.fasta);
screen.seqs(fasta=/projects/p31378/comammox/results/crispr2/pooled/$param_a.fasta, maxlength=200);
unique.seqs(fasta=/projects/p31378/comammox/results/crispr2/pooled/$param_a.good.fasta);
pre.cluster(fasta=/projects/p31378/comammox/results/crispr2/pooled/$param_a.good.unique.fasta, name=/projects/p31378/comammox/results/crispr2/pooled/$param_a.good.names,diffs=3);
cluster.fragments(fasta=/projects/p31378/comammox/results/crispr2/pooled/$param_a.good.unique.precluster.fasta,name=/projects/p31378/comammox/results/crispr2/pooled/$param_a.good.names, diffs=3)"
