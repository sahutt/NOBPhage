#awk command
BEGIN {FS="\t"}
{print "fasterq-dump " $1}


#
#Line 2: we are telling awk to begin our document and that we want tabs as our field separators
#Line 3: the print command will be executed line by line, extracting the information from the first column of our accession list until there are no lines left

#next: exit your text editor if you've made this in nano and call the following command on the command line

#awk -f file.awk list.txt > fasterqdump.sh
#the command takes the awk script you just made, and the accession list text file then creates the bash script document you want
