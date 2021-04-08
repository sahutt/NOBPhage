# Viral Bioinformatics Pipeline

The purpose of the git repository is to act as a guide through a bioinformatics pipeline meant for finding bacteriophage and prophage in metagenomic datasets. All bash scripts are meant for use on the Northwestern HPCC Quest. 

## Getting your Data Onto Quest

### Directly from your computer: 

If you have data on your computer and need to get it onto Quest, you will need to download an FTP solution like Filezilla or Cyberduck. These GUI's will connect you to Quest and allow you to browse through directories like you would on your PC. You can also upload or download files directly from the Quest server using this software, which becomes useful for viewing results and writing bash scripts from your computer rather than usin 

[Filezilla](https://filezilla-project.org/) 

[CyberDuck](https://cyberduck.io/)

Both are free and will make browsing Quest much simpler, especially if you aren't used to moving around the directory system from the command line. I preferred Filezilla. I felt the set-up was more intuitive than Cyberduck, but Filezilla stopped working on my computer and I couldn't figure out what the problem was so I switched to Cyberduck. YMMV

### From NCBI:
Program: [SRAtoolkit](https://github.com/ncbi/sra-tools) (available on Quest)

When conducting a meta-analysis where you have identified data that needs to be retrieved from the sequencing read archive (SRA) on NCBI, you can directly download those data files to Quest from NCBI using the SRA toolkit:

```
module load sratoolkit 
fasterqdump SRR########
```

In this manner you can import single and paired end reads into the working directory one at a time. For studies with a large number of samples to import, we can use an awk command to create a bash script to do the work for us. First, download the accession list from the project site on NCBI. This should take the form of a list of SRA accession numbers like this:

```
SRR10744092
SRR10744093 
SRR10744094
etc.
```

#### awk 

An awk command can create a bash script for large sample sets by repeating the same command on a list of items line by line. So, we can use the accession list we retrieved from SRA to download the desired files. You can see an example of a simple awk created to import a list of files [here](https://github.com/sahutt/NOBPhage/blob/main/bash/fasterqdump.awk). Once the awk is created, you can create your bash script using the following awk command on the command line:
```
awk -f file.awk list.txt > fasterqdump.sh
```
the command takes the awk script you just made, and the accession list text file then creates the bash script document you want

Now we should have a document in your working directory that looks like this:
```
fasterq-dump SRR6800320 
fasterq-dump SRR6800323
fasterq-dump SRR6800324
etc.
```
Add your header to the [bash script](https://github.com/sahutt/NOBPhage/blob/main/bash/fasterqdump.sh), and a command to gzip all the downloaded .fastq files and submit. 

# QC - Quality Control

Now that you have your reads safely imported and compressed on quest, we can run quality control to see what type of pre-processing our reads need. 

## Raw Read QC Check 

Program: FastQC and multiQC (Both available on Quest)

FastQC is a program that we can use to check the quality of raw reads output by high throughput sequencing.


Add - creating a conda environment 

# Read Trimming 


Program: [fastp](https://github.com/OpenGene/fastp) 
fastp is not available on Quest, but can be installed through bioconda and accessed through a conda environment

Other common programs for read trimming: Trimmomatic, cutadapt, fastxtoolkit



To use:
Module load python/anaconda
Source activate fastp

# Assembly

Next we will assemble our cleaned reads into contigs, or contiguous pieces of DNA. There are several options for this, but the assemblers that are most prevalent in the literature are megahit and metaspades, both programs are available on quest as modules. We are going to use both in this pipeline for different purposes. 

[MEGAHIT](https://github.com/voutcn/megahit)
[SPAdes](https://github.com/ablab/spades)

### Megahit - bacterial genome assembly

Spades 3.15 - new version not on quest, can install onto quest but error during installation test need to take limit off threads
Spades 3.15 GitHub - https://cab.spbu.ru/files/release3.15.0/manual.html
MetaViralSpades pub: https://academic.oup.com/bioinformatics/article-abstract/36/14/4126/5837667

### SPAdes v3.15 - metaviralSPAdes - extrachromosomal assembly 

# MAG Binning  
[Metawrap](https://github.com/bxlab/metaWRAP)

Metawrap includes read alignment in the module. 

# Check Binning Quality

## CheckM - bacterial MAG completion and contamination check

## CheckV 
[CheckV](https://bitbucket.org/berkeleylab/checkv/src/master/) - installed in conda-envs/checkv in p31378 (source activate checkv)  

  

# Phage identification and annotation  

[VIBRANT](https://github.com/AnantharamanLab/VIBRANT)  
[Virsorter2](https://github.com/jiarong/VirSorter2)    

## vConTACT2 

vibrant and demovir
virsorter and vcontact

# CRISPRCasFinder and CRISPR Target


Other programs:
Phage annotation only   
[Demovir](https://github.com/feargalr/Demovir) - not actively developed  
Prokka?
…






