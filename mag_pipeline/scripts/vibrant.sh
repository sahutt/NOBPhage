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

VIBRANT_run.py -i /projects/b1052/Wells_b1042/Stefanie/NOB/CMX/metaspades/SG_01_11_2017/scaffolds.fasta -t 10 -d /projects/p31378/conda_envs/vibrant/databases -folder /projects/b1052/Wells_b1042/Stefanie/NOB/CMX/vibrant/SG_01_11_2017
VIBRANT_run.py -i /projects/b1052/Wells_b1042/Stefanie/NOB/CMX/metaspades/SG_07_05_2017/scaffolds.fasta -t 10 -d /projects/p31378/conda_envs/vibrant/databases -folder /projects/b1052/Wells_b1042/Stefanie/NOB/CMX/vibrant/SG_07_05_2017
VIBRANT_run.py -i /projects/b1052/Wells_b1042/Stefanie/NOB/CMX/metaspades/SG_05_27_2016/scaffolds.fasta -t 10 -d /projects/p31378/conda_envs/vibrant/databases -folder /projects/b1052/Wells_b1042/Stefanie/NOB/CMX/vibrant/SG_05_27_2016
 
