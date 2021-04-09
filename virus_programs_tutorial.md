# Quick installation and use guide to virus identification and annotation software
The purpose of this document is to provide a brief overview of the installation steps and usage of virus identification and annotation software used in the NOB phage pipeline. For more specific guidance, refer to the github and documentation for each individual tool. Many packages and dependencies can be installed with conda. See [this conda guide](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) for tips on making and managing conda environments.  

Jump to:  
[VirSorter2](#virsorter2)  
[VIBRANT](#vibrant)  
[CheckV](#checkv)  
[vConTACT](#vcontact)

## VirSorter2
[Github](https://github.com/jiarong/VirSorter2)  

VirSorter2 identifies viral sequences from input contigs and MAGs. The easiest way to install it is using conda. Since we're working in a computing cluster, specify the location where you want the environment installed.  

load in the anaconda module  
```module load python-anaconda3/2019.10```  

the above version can occasionally toss up errors, you can use this version as well  
```module load python/anaconda3.6```  

install with conda   
```conda create --prefix /path/to/env/virsorter -c bioconda virsorter=2```

start up the VirSorter conda environment (make sure to activate anaconda if you're starting a new session or writing this in a bash script)  
```source activate /projects/p31378/conda_envs/virsorter2```

run VirSorter
```virsorter run -w test.out -i test.fa all```  
-w directory  
-i input contigs/genome  
all - runs entire pipeline  
you can replace "all" with classify, which only runs classification step if you want to test different cutoff scores

exit VirSorter  
```source deactivate```


---

## VIBRANT
[Github](https://github.com/AnantharamanLab/VIBRANT)  

VIBRANT identifies and annotates viral sequences from input contigs and MAGs. The easiest way to install it is using conda. Since we're working in a computing cluster, specify the location where you want the environment installed.

load in the anaconda module  
```module load python-anaconda3/2019.10```  

the above version can occasionally toss up errors, you can use this version as well  
```module load python/anaconda3.6```  

install with conda  
```conda create --prefix /path/to/env/vibrant -c bioconda vibrant```

download databases
- I had a few issues with this using the conda install, I think because we are in a computing cluster. The recommended database install from the developer is to use a download_db.sh script, but this didn't work for me since we don't have root access in the computing cluster. If you have issues, I suggest the following steps:  
  - download the github repo to a location of your choosing  
  ```git clone https://github.com/AnantharamanLab/VIBRANT```
  - run the VIBRANT_setup.py script   
  ```python3 /path/to/repo/VIBRANT_setup.py```  
  - create a databases folder in your conda env for VIBRANT and move the database files you just downloaded  
  ```mv /path/to/repo/databases /path/to/env/vibrant/databases```  
  - once you've moved the databases, you can move, archive, or delete the rest of the github repo

start up the VIBRANT conda environment  
```source activate /projects/p31378/conda_envs/vibrant```

run VIBRANT - specify the databases with the -d flag, I still had to do this after I ran ```VIBRANT_setup.py --test``` :shrug:    

```
VIBRANT_run.py -i /projects/p31378/comammox/results/metaviralspades/SG_01_11_2017/contigs.fasta \
-d /projects/p31378/conda_envs/vibrant/databases \
-folder /projects/p31378/comammox/results/vibrant/SG_01_11_2017/ \
-virome
```  

-i input contigs  
-d where databases are saved  
-folder specify output folder  
-virome assumes the contigs are mostly viral sequences, use with metaviralspades output  

exit VIBRANT   
```source deactivate```

---


## CheckV  
[BitBucket](https://bitbucket.org/berkeleylab/checkv/src/master/)  

CheckV is used to assess the quality and completeness of viral contigs.   
--how to use it--  

load in the anaconda module  
```module load python-anaconda3/2019.10```  

the above version can occasionally toss up errors, you can use this version as well  
```module load python/anaconda3.6```  

install with conda   
```conda create --prefix /path/to/env/checkv -c conda-forge -c bioconda checkv```

start up the CheckV conda environment  
```source activate /projects/p31378/conda_envs/checkv```

run CheckV  
```code here```
-flag info here  

---

## vConTACT  
[Bitbucket](https://bitbucket.org/MAVERICLab/vcontact2/src/master/)  
commands and info here
