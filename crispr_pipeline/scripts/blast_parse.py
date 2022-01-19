# parsing blast outputs from comammox bin against DRs

import pandas as pd

def blast_concat(file_end, out_name):
    '''
    imports multiple blast files, such as individual files from blasting MAGs
    returns all the data in one csv with a new column for the file name
    assumes files are in the same folder as the script
    inputs:
        folder - folder where the blast files are
        file_end - common file ending to search for such as "*_blast_cphA.txt"
            ideally file names should a similar structure to this: seqname_searchtype_genequery.txt
        out_name - output name, will save to current working directory unless another is specified
    example:
        blast_concat("*_blast_cphA.txt","all_blast.csv")
    '''
    import glob
    import csv

    alldata_list = []

    filenames = glob.glob(file_end)

    for name in filenames:
        with open(name) as read_file:
            reader = csv.reader(read_file, delimiter="\t")
            file_list = list(reader)
            temp_end = file_end.replace("*","") # string with file ending to remove
            seqid = name.replace(temp_end,"")
        for l in file_list:
            l.append(seqid)
            alldata_list.append(l)
    with open(out_name, "w", newline="") as write_file:
        writer = csv.writer(write_file)
        writer.writerows(alldata_list)


main_dir = "/projects/p31378/comammox/results/blast_dr_cmx/"
blast_concat(main_dir + "01/*.fa.txt", main_dir + "SG_01.csv")
blast_concat(main_dir + "05/*.fa.txt", main_dir + "SG_05.csv")
blast_concat(main_dir + "07/*.fa.txt", main_dir + "SG_07.csv")
