#!/bin/bash
#SBATCH -J findRepeatsCRISPR_array
#SBATCH -A p31378
#SBATCH --mail-type=ALL
#SBATCH --mail-user=@u.northwestern.edu
#SBATCH -N 1
#SBATCH -n 5
#SBATCH --mem=2GB
#SBATCH -t 6:00:00
#SBATCH --output=/projects/p31378/comammox/results/crispr2/pooled/findRepeats_%A_%a.out
#SBATCH --error=/projects/p31378/comammox/results/crispr2/pooled/findRepeats_%A_%a.err
#SBATCH -p short
#SBATCH --array=1-97%5

##note: Several jobs timed out with a lower initial starting time, and about 8 of the 97 still timed out at 6 hours. The array was run a second time
## for the timed out jobs for 12 hours and all jobs completed. You could start with a higher run time to avoid time outs, but it might increase your
## wait time before the job starts. 

##to submit an array, you need to add the --array flag to your header. Submit with the exact number of jobs you have to run
## in this case, we had 97. The %5 tells the job assigner to submit 5 jobs at a time. The numbers of nodes requested must match
##the number of jobs submitted at once. 

module purge all
module load python/anaconda

#create tab delimited test file containing the DRs in one column and the output pathway in the second column. Store this text file 
#as a variable.
param_store=/projects/p31378/comammox/results/crispr2/pooled/python_commands.txt

#link each line in your stored text document to a slurm array task ID.
param_a=$(cat $param_store | awk -v var=$SLURM_ARRAY_TASK_ID 'NR==var {print $0}')

python /projects/p31378/comammox/scripts/findRepeatCRISPR.py $param_a


