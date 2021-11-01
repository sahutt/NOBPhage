#!/bin/bash
#SBATCH -J findRepeatsCRISPR_array
#SBATCH -A p31378
#SBATCH --mail-type=ALL
#SBATCH --mail-user=stefaniehuttelmaier2024@u.northwestern.edu
#SBATCH -N 1
#SBATCH -n 5
#SBATCH --mem=20GB
#SBATCH -t 3:00:00
#SBATCH --output=/projects/p31378/comammox/results/crispr2/pooled/findRepeats_%A_%a.out
#SBATCH --error=/projects/p31378/comammox/results/crispr2/pooled/findRepeats_%A_%a.err
#SBATCH -p short
#SBATCH --array=1-97%5

module purge all
module load python/anaconda

IFS=$'\n' read -r input_args < python_commands2.txt

echo $input_args

python /projects/p31378/comammox/scripts/findRepeatCRISPR.py $input_args



#while IFS= read -r line; do
#	${line[$SLURM_ARRAY_TASK_ID]}	
#    	echo "$line"
#done < "python_commands.txt"

