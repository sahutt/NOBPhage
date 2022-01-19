#!/bin/sh
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -t 12:00:00
#SBATCH --mem=0
#SBATCH --job-name="run_megahit"
#SBATCH --mail-user=@u.northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/p31378/BNRmeta/results/megahit/megahit.out
#SBATCH --error=/projects/p31378/BNRmeta/results/megahit/megahit.err

module purge all

cd /projects/p31378/BNRmeta/results/fastp/

module load megahit

megahit -1 SRR10744092_trimmed_1.fastq.gz -2 SRR10744092_trimmed_2.fastq.gz --continue -o SRR10744092
megahit -1 SRR10744093_trimmed_1.fastq.gz -2 SRR10744093_trimmed_2.fastq.gz --continue -o SRR10744093
megahit -1 SRR10744094_trimmed_1.fastq.gz -2 SRR10744094_trimmed_2.fastq.gz --continue -o SRR10744094
megahit -1 SRR10744095_trimmed_1.fastq.gz -2 SRR10744095_trimmed_2.fastq.gz --continue -o SRR10744095
megahit -1 SRR10744096_trimmed_1.fastq.gz -2 SRR10744096_trimmed_2.fastq.gz --continue -o SRR10744096
megahit -1 SRR10744097_trimmed_1.fastq.gz -2 SRR10744097_trimmed_2.fastq.gz --continue -o SRR10744097
megahit -1 SRR10744098_trimmed_1.fastq.gz -2 SRR10744098_trimmed_2.fastq.gz --continue -o SRR10744098
megahit -1 SRR10744099_trimmed_1.fastq.gz -2 SRR10744099_trimmed_2.fastq.gz --continue -o SRR10744099

