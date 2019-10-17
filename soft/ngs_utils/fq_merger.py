#!/opt/conda/bin/python

import glob, os

pattern = "cbrako-fix*.r1.fq.gz"

filenames_dict = {}

for fn in glob.glob(pattern):
    spl_name = fn.split(".")
    sample_name = spl_name[0]
    #print(sample_name, spl_name)
    if sample_name not in filenames_dict.keys():
        filenames_dict[sample_name] = 1
    else:
        filenames_dict[sample_name] += 1
        

r_numbers = (1,2)
for key, value in filenames_dict.items():
    sample_name = key
    file_count  = value
    print(sample_name, file_count )
    for r_num in r_numbers:
        r_suffix = f'rna.r{r_num}.fq.gz'
        input_pattern = f'{sample_name}.*.{r_suffix}'
        merged_fn = f'{sample_name}.mrgd_{file_count}.{r_suffix}'
        command = f'cat {input_pattern} > {merged_fn}' 
        print(command)
        os.system(command)
    #print(glob.glob(r1_pattern) )
