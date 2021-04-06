#awk command
#awk -f file.awk list.txt > fasterqdump.sh

BEGIN {FS="\t"}
{print "fasterq-dump " $1}
