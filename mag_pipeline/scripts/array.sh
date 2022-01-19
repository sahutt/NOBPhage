#!/bin/bash

#SBATCH -J kneaddata
#SBATCH -A e31333
#SBATCH --mail-type=ALL
#SBATCH --mail-user=stefaniehuttelmaier2024@u.northwestern.edu
#SBATCH -N 1
#SBATCH -n 4
#SBATCH --mem=48G
#SBATCH -t 24:00:00
#SBATCH --output=/projects/e31333/shh2623/humann/kneaddata/kneaddata_array_%A_%a.out
#SBATCH --error=/projects/e31333/shh2623/humann/kneaddata/kneaddata_array_%A_%a.err
#SBATCH -p normal
#SBATCH --array=1-15%4

module purge all

module load singularity

sleep $(echo "$RANDOM / 36000 * 60" | bc -l | xargs printf "%.0f")

echo "Starting kneaddata job"

file=$(ls /projects/e31333/shh2623/humann/*.fq.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)

singularity exec -B /projects/e31333 -B /projects/e31333/shh2623/humann -B /projects/e31333/humann2_ref_data /
/projects/e31333/biobakery_diamondv0822.sif kneaddata --input ${file} --reference-db /projects/e31333/humann2_ref_data/Homo_sapiens /
--output /projects/e31333/shh2623/humann/kneaddata

echo "Finishing kneaddata job"
