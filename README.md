# NOBPhage
NOB Phage Bioinformatics Pipeline


A bioinformatics pipeline meant for finding bacteriophage and prophage in metagenomic datasets. All bash scripts are meant for use on the Northwestern HPCC Quest. Pipeline was developed with McKenna Farmer, Alexander McFarland, Siam Racharaks, and Ryan Blaustein.

Pipeline and Program Installation in Quest

QC
FastQC - on Quest


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
