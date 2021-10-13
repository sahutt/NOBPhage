#!/bin/bash
#SBATCH --job-name="virsorter2"
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -t 12:00:00
#SBATCH -N 1
#SBATCH -n 10
#SBATCH --mem=20G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=@u.northwestern.edu
#SBATCH --output=/projects/p31378/comammox/results/virsorter2/virsorter2_test.out
#SBATCH --error=/projects/p31378/comammox/results/virsorter2/virsorter2_test.err

module purge all
module load python/anaconda3.6

source activate /projects/p31378/conda_envs/virsorter2

virsorter run -w /projects/p31378/comammox/results/virsorter2/SG_01_11_2017/SG_01_11_2017.out -i /projects/b1052/Wells_b1042/Stefanie/NOB/CMX/metaspades/SG_01_11_2017/scaffolds.fasta -j 10

virsorter run -w /projects/p31378/comammox/results/virsorter2/SG_05_27_2016/SG_05_27_2016.out -i /projects/b1052/Wells_b1042/Stefanie/NOB/CMX/metaspades/SG_05_27_2016/scaffolds.fasta -j 10

virsorter run -w /projects/p31378/comammox/results/virsorter2/SG_07_05_2017/SG_07_05_2017.out -i /projects/b1052/Wells_b1042/Stefanie/NOB/CMX/metaspades/SG_07_05_2017/scaffolds.fasta -j 10
