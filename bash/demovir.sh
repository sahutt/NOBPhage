

module purge all
module load prodigal

#move to folder with compiled vibrant nucleotide files '_scaffolds.phages_combined.faa'
#use vibrant_parse.sh to move these files
cd /projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/vibrant_results
#copy all .faa files to the folder containing the demovir scripts
cp *.faa /projects/b1052/shared/Demovir


