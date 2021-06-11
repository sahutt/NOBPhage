
module load BBMap

bbduk.sh in=CMX_cat_trimmed_1.fastq.gz in2=CMX_cat_trimmed_2.fastq.gz out=/projects/b1052/Wells_b1042/Stefanie/NOB/CMX/crisprcasfinder/matched_1.fq /
out2=/projects/b1052/Wells_b1042/Stefanie/NOB/CMX/crisprcasfinder/matched_2.fq k=28 mm=f literal=GTTTCAATCCTCGCCCGGCCCGAAGGACGGGCGCTAC hdist=1 rcomp=T
