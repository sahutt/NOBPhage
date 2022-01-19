#!/bin/sh
#SBATCH -A p31378
#SBATCH -p short
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 4:00:00
#SBATCH --mem=10gb
#SBATCH --job-name="fasterq_dump"
#SBATCH --mail-user=@u.northwestern.edu
#SBATCH --mail-type=BEGIN,END,FAIL


#Each line will import both of your paired end reads, 
#if there is an error and one doesn't import for some reason, 
#you can execute the same script and it will skip lines if the file is already present and complete

fasterq-dump SRR6800320
fasterq-dump SRR6800323
fasterq-dump SRR6800324
fasterq-dump SRR6800325
fasterq-dump SRR6800326
fasterq-dump SRR6800332
fasterq-dump SRR6800333
fasterq-dump SRR6800334
fasterq-dump SRR6800321
fasterq-dump SRR6800322
fasterq-dump SRR6800327
fasterq-dump SRR6800328
fasterq-dump SRR6800329
fasterq-dump SRR6800330
fasterq-dump SRR6800331

#fasterq-dump does not zip files like fastq-dump, so you can build it in to your bash script to do this for you. 
#This command will zip all files with the .fastq flag in the working directory
#this will be the most time consuming part of the script, if you have more than 10 files, you likely want to increase your walltime
gzip *.fastq
