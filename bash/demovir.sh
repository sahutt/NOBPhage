#!/bin/sh
#SBATCH -A p31378
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 5
#SBATCH -t 8:00:00
#SBATCH --mem=5GB
#SBATCH --job-name="tb_demovir"
#SBATCH --mail-user=stefaniehuttelmaier2024@u.northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1052/Wells_b1042/Stefanie/toothbrushes/demovir/demovir.out
#SBATCH --error=/projects/b1052/Wells_b1042/Stefanie/toothbrushes/demovir/demovir.err

#load dependencies required per the demovir git
module purge all
module load prodigal
module load R
module load bzip2

#move to folder with compiled vibrant nucleotide files '_scaffolds.phages_combined.faa'
#use vibrant_parse.sh to move these files
cd /projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/vibrant_results
#copy all .faa files to the folder containing the demovir scripts
cp *.faa /projects/b1052/shared/Demovir
#move to the folder where all your files and demovir are
cd /projects/b1052/shared/Demovir

 for F in *.faa do
        N=$(basename $F) ;
        prodigal -a AA.fasta -i $F -p meta 
        ./usearch -ublast AA.fasta -db ./uniprot_trembl.viral.udb -evalue 1e-5 -blast6out trembl_ublast.viral.txt -threads 5 &> /dev/null
        sort -u -k1,1 trembl_ublast.viral.txt > trembl_ublast.viral.u.txt
        rm AA.fasta
        cut -f 1,2 trembl_ublast.viral.u.txt | sed 's/_[0-9]\+\t/\t/' | cut -f 1 | paste trembl_ublast.viral.u.txt - > trembl_ublast.viral.u.contigID.txt
        rm trembl_ublast.viral.u.txt trembl_ublast.viral.txt
        Rscript ./demovir_edit.R
        rm trembl_ublast.viral.u.contigID.txt
        cp DemoVir_assignments.txt $N_DemoVir_assignments.txt
        mv $N_DemoVir_assignments.txt /projects/b1052/Wells_b1042/Stefanie/toothbrushes/demovir
done




