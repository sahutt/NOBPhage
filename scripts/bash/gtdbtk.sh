#!/bin/bash
#SBATCH --job-name="gtdbtk-1.4.1_test"
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -t 36:00:00
#SBATCH -N 1
#SBATCH -n 10
#SBATCH --mem=160G
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=stefaniehuttelmaier2024@u.northwestern.edu
#SBATCH --output=/projects/p31378/comammox/results/gtdbtk/gtdb.out
#SBATCH --error=/projects/p31378/comammox/results/gtdbtk/gtdb.err

module purge all
module load python/anaconda3.6

# export PATH=”$PATH：/projects/b1052/pythonenvs/python3.6/gtdb/site-packages/gtdbtk/“
# pip install scipy
# pip install matplotlib
# pip install numpy

source activate /projects/b1052/pythonenvs/python3.6/gtdbtk-1.4.1

gtdbtk classify_wf --genome_dir /projects/b1052/Wells_b1042/Stefanie/NOB/CMX/metawrap/bin_refine/SG_07_05_2017/metawrap_80_10_bins /
--out_dir /projects/Wells_b1042/Stefanie/NOB/CMX/gtdbtk/SG_07_05_2017 -x fa --cpus 10 --pplacer_cpus 1 /
--scratch_dir /projects/b1042/HartmannLab/stefanie/gtdbtk --debug
