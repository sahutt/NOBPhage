##transfer and rename results filesd from vibrant outputs to single folder
#need .fna for Demovir 

BEGIN {FS="\t"}

{print "cd /projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/" $1 "/VIBRANT_scaffolds/VIBRANT_phages_scaffolds" }
{print "cp scaffolds.phages_combined.fna " $1 "_scaffolds.phages_combined.fna" }
{print "mv " $1 "_scaffolds.phages_combined.fna /projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/vibrant_results "}
{print "cd /projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/" $1 "/VIBRANT_scaffolds/VIBRANT_results_scaffolds" }
{print "cp VIBRANT_genome_quality_scaffolds.tsv " $1 "_VIBRANT_genome_quality_scaffolds.tsv" }
{print "mv " $1 "_genome_quality_scaffolds.tsv /projects/b1052/Wells_b1042/Stefanie/toothbrushes/VIBRANT/metaspades/vibrant_results" }
{print ""}
