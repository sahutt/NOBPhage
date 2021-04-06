# Viral Bioinformatics Pipeline

The purpose of the git repository is to act as a guide through a bioinformatics pipeline meant for finding bacteriophage and prophage in metagenomic datasets. All bash scripts are meant for use on the Northwestern HPCC Quest. Pipeline was developed by McKenna Farmer, Stefanie Huttelmaier, Alexander McFarland and Siam Racharaks.

Pipeline and Program Installation in Quest

# Getting your Data Onto Quest

To get



# QC - Quality Control 
Program: FastQC
Module available on Quest

First, we need to check the quality of our metagenomic reads and determine what type of quality control steps are necessary. 


Add - creating a conda environment 

Trimming 
Fastp - environment created in p31378 

To use:
Module load python/anaconda
Source activate fastp

Assembly
Megahit - on Quest

Spades 3.15 - new version not on quest, can install onto quest but error during installation test need to take limit off threads
Spades 3.15 GitHub - https://cab.spbu.ru/files/release3.15.0/manual.html
MetaViralSpades pub: https://academic.oup.com/bioinformatics/article-abstract/36/14/4126/5837667

Read Alignment
Bowtie 2 http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml

MAG Binning  
[Metawrap](https://github.com/bxlab/metaWRAP)

Check Binning Quality
[CheckV](https://bitbucket.org/berkeleylab/checkv/src/master/) - installed in conda-envs/checkv in p31378 (source activate checkv)  

CheckM (on Quest)  

Phage identification and annotation  
[VIBRANT](https://github.com/AnantharamanLab/VIBRANT)  
[Virsorter2](https://github.com/jiarong/VirSorter2)    

Phage annotation only   
[Demovir](https://github.com/feargalr/Demovir) - not actively developed  
Prokka?
…

CRISPR programs:
External?


Add .awk instructions

Datasets used in our analysis
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6212598/#SM3
