#!/bin/sh
#SBATCH -A p30712
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 12
#SBATCH -t 04:00:00
#SBATCH --mem=8gb
#SBATCH --job-name="run_fastp"
#SBATCH --mail-user=@u.northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/p30712/phage/results/fastp/fastp.out
#SBATCH --error=/projects/p30712/phage/results/fastp/fastp.err


module load python-anaconda3/2019.10

source activate fastp

cd /projects/p30712/phage/raw_reads


fastp -i SRR10744092_1.fastq.gz -I SRR10744092_2.fastq.gz -o SRR10744092_trimmed_1.fastq.gz -O SRR10744092_trimmed_2.fastq.gz
fastp -i SRR10744093_1.fastq.gz -I SRR10744093_2.fastq.gz -o SRR10744093_trimmed_1.fastq.gz -O SRR10744093_trimmed_2.fastq.gz
fastp -i SRR10744094_1.fastq.gz -I SRR10744094_2.fastq.gz -o SRR10744094_trimmed_1.fastq.gz -O SRR10744094_trimmed_2.fastq.gz
fastp -i SRR10744095_1.fastq.gz -I SRR10744095_2.fastq.gz -o SRR10744095_trimmed_1.fastq.gz -O SRR10744095_trimmed_2.fastq.gz
fastp -i SRR10744096_1.fastq.gz -I SRR10744096_2.fastq.gz -o SRR10744096_trimmed_1.fastq.gz -O SRR10744096_trimmed_2.fastq.gz
fastp -i SRR10744097_1.fastq.gz -I SRR10744097_2.fastq.gz -o SRR10744097_trimmed_1.fastq.gz -O SRR10744097_trimmed_2.fastq.gz
fastp -i SRR10744098_1.fastq.gz -I SRR10744098_2.fastq.gz -o SRR10744098_trimmed_1.fastq.gz -O SRR10744098_trimmed_2.fastq.gz
fastp -i SRR10744099_1.fastq.gz -I SRR10744099_2.fastq.gz -o SRR10744099_trimmed_1.fastq.gz -O SRR10744099_trimmed_2.fastq.gz
fastp -i SRR10744100_1.fastq.gz -I SRR10744100_2.fastq.gz -o SRR10744100_trimmed_1.fastq.gz -O SRR10744100_trimmed_2.fastq.gz
fastp -i SRR10744101_1.fastq.gz -I SRR10744101_2.fastq.gz -o SRR10744101_trimmed_1.fastq.gz -O SRR10744101_trimmed_2.fastq.gz
fastp -i SRR10744102_1.fastq.gz -I SRR10744102_2.fastq.gz -o SRR10744102_trimmed_1.fastq.gz -O SRR10744102_trimmed_2.fastq.gz
fastp -i SRR10744103_1.fastq.gz -I SRR10744103_2.fastq.gz -o SRR10744103_trimmed_1.fastq.gz -O SRR10744103_trimmed_2.fastq.gz
fastp -i SRR10744104_1.fastq.gz -I SRR10744104_2.fastq.gz -o SRR10744104_trimmed_1.fastq.gz -O SRR10744104_trimmed_2.fastq.gz
fastp -i SRR10744105_1.fastq.gz -I SRR10744105_2.fastq.gz -o SRR10744105_trimmed_1.fastq.gz -O SRR10744105_trimmed_2.fastq.gz
fastp -i SRR10744106_1.fastq.gz -I SRR10744106_2.fastq.gz -o SRR10744106_trimmed_1.fastq.gz -O SRR10744106_trimmed_2.fastq.gz
fastp -i SRR10744107_1.fastq.gz -I SRR10744107_2.fastq.gz -o SRR10744107_trimmed_1.fastq.gz -O SRR10744107_trimmed_2.fastq.gz
fastp -i SRR10744108_1.fastq.gz -I SRR10744108_2.fastq.gz -o SRR10744108_trimmed_1.fastq.gz -O SRR10744108_trimmed_2.fastq.gz
fastp -i SRR10744109_1.fastq.gz -I SRR10744109_2.fastq.gz -o SRR10744109_trimmed_1.fastq.gz -O SRR10744109_trimmed_2.fastq.gz
fastp -i SRR10744110_1.fastq.gz -I SRR10744110_2.fastq.gz -o SRR10744110_trimmed_1.fastq.gz -O SRR10744110_trimmed_2.fastq.gz

