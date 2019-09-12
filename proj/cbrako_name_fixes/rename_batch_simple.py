#!/usr/bin/env python3

'''
renames cbrako batches of files using 2 column dictionary supplied on the command line
one sequencing directory at the time
always use "mv -i " when moving the files to work directory


001.fn.dict
'''

import glob, os, sys

db_fn = sys.argv[1]

names_dict = {}
with open(db_fn) as f:
    for line in f:
        if line[0] != '#':
            sl =  line.split()
            old_name, new_name = sl[:2]
            if old_name not in names_dict.keys():
                names_dict[old_name] = new_name
        #print(old_name,new_name)

#print(names_dict)


pattern = "1*fastq.gz"
for old_fn in glob.glob(pattern):
    name_raw = old_fn.split("_")[0]
    old_patient = name_raw[:-2]
    tissue      = name_raw[-2:]
    #print(old_patient, tissue, old_fn)
    if old_patient in names_dict.keys():
        new_patient = names_dict[old_patient]
        name_new = f'''{new_patient}_{tissue}_0_3.'''
        new_fn   = old_fn.replace(name_raw + "_", name_new)
        command = f"mv -i  {old_fn} {new_fn}"
        print(command)
        #os.system(command)
    else:
        print("#XXX", old_patient, old_fn)