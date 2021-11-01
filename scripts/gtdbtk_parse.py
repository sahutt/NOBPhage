'''
Parsing GTDB-Tk output tables into one folder
6/8/21
'''


def gtdbtk_parse(in_path, suffix, out_path):
    '''
    imports individual GTDB-Tk output summary tsv
    inputs:
        file_path - path to folder where GTDB outputs are saved - string
        suffix - gtdbtk file suffix, like "*.summary.tsv" - string
            you can also search subdirectories like this "/*/*.summary.tsv"
            make sure that you have slashes in the right locations
        out_path - path and name of output file
    '''
    import glob
    import pandas as pd

    full_path = in_path + suffix

    files = glob.glob(full_path)

    data_list = [] # all data will be imported from csv to df, then appended to this list
    column_names = [] # where column names will be stored
    
    first = True # used to save the column names from the first tsv read
    
    for i in files:
        if first: # if first loop, save the column names as a list and append to list
            first = False
            df = pd.read_csv(i, sep = "\t", header = 0)
            df.insert(0, "file", i) # add a new column to 0 index with the file name
            column_names = df.columns.tolist() # saving column names as a list
            data_list.extend(df.values.tolist()) # appending data to master list
        else: # otherwise just append the data
            df = pd.read_csv(i, sep = "\t", header = 0)
            df.insert(0, "file", i) # add a new column to 0 index with the file name
            data_list.extend(df.values.tolist())

    data_df = pd.DataFrame(data_list, columns=column_names)
    data_df.to_csv(out_path, index=False)

gtdbtk_parse(".","/*/*summary.tsv","./test.csv")
