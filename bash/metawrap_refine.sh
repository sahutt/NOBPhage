#!/bin/sh
#SBATCH -A p30712
#SBATCH -p normal
#SBATCH -N 1
#SBATCH -n 20
#SBATCH -t 24:00:00
#SBATCH --mem=80gb
#SBATCH --job-name="metawrap_refine"
#SBATCH --mail-user=stefaniehuttelmaier2024@u.northwestern.edu
#SBATCH --mail-type=ALL
#SBATCH --output=/projects/b1052/Wells_b1042/Stefanie/toothbrushes/metawrap/bin_refine/bin_ref$
#SBATCH --error=/projects/b1052/Wells_b1042/Stefanie/toothbrushes/metawrap/bin_refine/bin_refi$


module purge all
module load python/anaconda3.6
source activate /projects/p31378/conda_envs/metawrap-env


#metawrap bin refiner is the second step in the three step metawrap binning process. Bin refine takes output from up to three different 
#binning programs, determines which bins are the same and then selects the most complete bin with the least contamination based on a threshold
#set by you. -o is the out directory, final final does not need to exist, -t is the number of threads, you can the path to up to three different
#binners using the flags -A -B and -C, I only used metabat and maxbin so I only have two flags here, -c is the completeness threshold and
#-x is the 
metawrap bin_refinement -o /projects/b1052/Wells_b1042/Stefanie/toothbrushes/metawrap/bin_refine/SRR10744092 -t 20 /
-A /projects/b1052/Wells_b1042/Stefanie/toothbrushes/metawrap/SRR10744092/metabat2_bins /
-B /projects/b1052/Wells_b1042/Stefanie/toothbrushes/metawrap/SRR10744092/maxbin2_bins -c 80 -x 10
