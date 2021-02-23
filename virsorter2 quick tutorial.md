# Virsorter quick tutorial

https://github.com/jiarong/VirSorter2

load in python via anaconda
```
module load python-anaconda3/2019.10
```

start up virsorter
```
source activate /projects/p31378/conda_envs/virsorter2
```

run virsorter
```
virsorter run -w test.out -i test.fa all
```
-w directory  
-i input contigs/genome  
all - runs entire pipeline  
you can replace "all" with classify, which only runs classification step if you want to test different cutoff scores

exit virsorter
```
source deactivate
```
