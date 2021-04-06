# Viral Bioinformatics Pipeline

The purpose of the git repository is to act as a guide through a bioinformatics pipeline meant for finding bacteriophage and prophage in metagenomic datasets. All bash scripts are meant for use on the Northwestern HPCC Quest. 

## Getting your Data Onto Quest

### Directly from your computer: 

If you have data on your computer and need to get it onto Quest, you will need to download an FTP solution like Filezilla or Cyberduck. These GUI's will connect you to Quest and allow you to browse through directories like you would on your PC. You can also upload or download files directly from the Quest server using this software, which becomes useful for viewing results and writing bash scripts from your computer rather than the nano  

https://filezilla-project.org/ 
https://cyberduck.io/

Both are free and will make browsing Quest much simpler, especially if you aren't used to moving around the directory system from the command line. I preferred Filezilla. I felt the set-up was more intuitive than Cyberduck, but Filezilla stopped working on my computer and I couldn't figure out what the problem was so I switched to Cyberduck. YMMV

From the internet:

When conducting a meta-analysis where you are retrieving data processed by someone else, there are several ways you can get the data files of interest onto Quest without downloading them directly to your computer. Here, I used  


# QC - Quality Control 
Program: FastQC
Module available on Quest

First, we need to check the quality of our metagenomic reads and determine what type of quality control steps are necessary. 


Add - creating a conda environment 

# Read Trimming 
Fastp - environment created in p31378 

To use:
Module load python/anaconda
Source activate fastp

# Assembly

Next we will assemble our cleaned reads into contigs, or contiguous pieces of DNA. There are several options for this, but the assemblers that are most prevalent in the literature are megahit and metaspades, both programs are available on quest as modules. We are going to use both in this pipeline for different purposes. 

[MEGAHIT](https://github.com/voutcn/megahit)
[metaSPAdes](https://github.com/ablab/spades)

Megahit - bacterial genome 

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
