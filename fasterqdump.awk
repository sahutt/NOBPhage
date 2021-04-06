#awk command
#awk -f file.awk list.txt

BEGIN {FS="\t"}
{print "fasterq-dump " $1}
