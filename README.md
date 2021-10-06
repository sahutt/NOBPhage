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

## Installing a conda environment

Many of the programs in this pipeline can be installed with Conda, a common package manager. Packages can be installed by loading in Anaconda, then creating a new environment. Programs can be run by anyone by activating the environment.

```
module load  python/anaconda3.6
conda create -y --prefix ./vcontact2 python=3
source activate vcontact2
source deactivate vcontact2
```


## QC - Quality Control

Now that you have your reads safely imported and compressed on quest, we can run quality control to see what type of pre-processing our reads need.

### Raw Read QC Check

Program: FastQC and multiQC (Both available on Quest)

FastQC is a program that we can use to check the quality of raw reads that have been output by high throughput sequencing. 



### Read Trimming

Program: [fastp](https://github.com/OpenGene/fastp)
fastp is not available on Quest, but can be installed through bioconda and accessed through a conda environment

Other common programs for read trimming: Trimmomatic, cutadapt, fastxtoolkit

To use:
```
module load python/anaconda
source activate fastp
```

## Assembly

Next we will assemble our cleaned reads into contigs, or contiguous pieces of DNA. There are several options for this, but the assemblers that are most prevalent in the literature are megahit and metaspades. Both programs are available on quest as modules. We are going to use both in this pipeline for different purposes.

[MEGAHIT](https://github.com/voutcn/megahit)
[SPAdes](https://github.com/ablab/spades)

### Megahit - bacterial genome assembly



### SPAdes v3.15 - metaviralSPAdes - extrachromosomal assembly
Spades 3.15 - new version not on quest, can install onto quest but error during installation test need to take limit off threads
Spades 3.15 GitHub - https://cab.spbu.ru/files/release3.15.0/manual.html
MetaViralSpades pub: https://academic.oup.com/bioinformatics/article-abstract/36/14/4126/5837667

## Check Assembly Quality 

Once you have your assembly outputs from your preferred assembler, you can check the quality of your assembly using QUAST.

[QUAST](http://quast.sourceforge.net/install.html) 

QUAST stands for Quality Assessment Tool for Genome Assemblies. It outputs assembling metrics that allow you to determine the overall quality of your assembly, like contig length and distributions. QUAST is not available on Quest, you will need to 


## MAG Binning  
[Metawrap](https://github.com/bxlab/metaWRAP)

Metawrap includes read alignment in the module.

## Check Binning Quality

### CheckM - bacterial MAG completion and contamination check


## Phage/Virus identification and annotation  

### [VIBRANT](https://github.com/AnantharamanLab/VIBRANT)  


### [Virsorter2](https://github.com/jiarong/VirSorter2)


### [metaviralSPADes](https://academic.oup.com/bioinformatics/article/36/14/4126/5837667)

Metaviralspades uses a variation of the spades assembly algorithm to detect potential viral sequences within metagenomic data. The viralComplete package that is suggested for use to verify and check for completeness of viral contigs has not been updated in 2 years and is not compatible with current blast and prodigal dependencies. We have used checkv to verify viral contigs instead.


### [CheckV](https://bitbucket.org/berkeleylab/checkv/src/master/)
CheckV is used to check the completeness of viral genomes. It is installed in conda-envs/checkv in p31378.
```
source activate /projects/p31378/conda_envs/checkv
```
CheckV was installed using conda:
```
conda create --prefix /projects/p31378/conda_envs/checkv -c conda-forge -c bioconda checkv
source activate checkv
checkv download_database ./
export CHECKVDB=/projects/p31378/conda_envs/checkv/checkv-db-v1.0
```

### [Demovir](https://github.com/feargalr/Demovir)

Demovir is used taxonomically classify viral contigs to the family and order level. Installation is a little convoluted. A working installation is currently available here:
/projects/b1052/shared/Demovir

If you want to install your own version you will need to follow these steps (instructions are available at the demovir github, these are just more granular):

1. git clone https://github.com/feargalr/Demovir
2. download the database to the demovir directory: https://figshare.com/articles/NR_Viral_TrEMBL/5822166
3. install [usearch](http://www.drive5.com/usearch/download.html) in the demovir directory
4. give yourself permission using the command 'chmod +x ./usearch'
5. make the appropriate changes and execute the format_db.sh (this does not have to be submitted as a bash script. Just copy and past the commands to the command line)

Other dependencies available on Quest: R, Prodigal and bzip2

```
prodigal -a AA.fasta -i /projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/SRR10744092/VIBRANT_scaffolds/VIBRANT_phages_scaffolds/scaffolds.phages_combined.fna -p meta &> /dev/null
./usearch -ublast AA.fasta -db uniprot_trembl.viral.udb -evalue 1e-5 -blast6out trembl_ublast.viral.txt -threads 1
sort -u -k1,1 trembl_ublast.viral.txt > trembl_ublast.viral.u.txt
rm AA.fasta
cut -f 1,2 trembl_ublast.viral.u.txt | sed 's/_[0-9]\+\t/\t/' | cut -f 1 | paste trembl_ublast.viral.u.txt - > trembl_ublast.viral.u.contigID.txt
rm trembl_ublast.viral.u.txt trembl_ublast.viral.txt
Rscript $DIR/demovir.R
rm trembl_ublast.viral.u.contigID.txt
```

### vConTACT2


### PHASTER

wget --post-file="contigs.fna" "http://phaster.ca/phaster_api?contigs=1" -O Output_filename


## CRISPR identification and analysis

Collect Reference Genomes for all known NOB, as well MAGs identified in previous steps as NOB


### CRISPRCasFinder

[Crisprcasfinder](https://crisprcas.i2bc.paris-saclay.fr/CrisprCasFinder/Index) detects crispr arrays and cas genes within fasta files. You can upload single fasta files to their website for analysis, or version 4.2.20 is available as a module on Quest.

Note: If you can avoid it, do not use underscores in fasta names as crisprcasfinder extract only to the first underscore for the name of the output file. Does not appear to be a way to fix this. You need some way to identify your outputs.



Other programs:
Phage annotation only   
Prokka?
…
