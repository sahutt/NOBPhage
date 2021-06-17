#!/bin/sh
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 2:00:00
#SBATCH --mem=5GB
#SBATCH --job-name="tb_vibrant_parse"
#SBATCH --mail-user=stefaniehuttelmaier2024@u.northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/vibrant_results/genome_quality_results/vibrant_parse.out
#SBATCH --error=/projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/vibrant_results/genome_quality_results/vibrant_parse.err

