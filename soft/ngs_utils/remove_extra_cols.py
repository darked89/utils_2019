#!/opt/conda/bin/python3.7

import sys

fn = sys.argv[1]

with open(fn) as f:
    for line in f:
        fixed_list = []
        sl = line.split()
        num_cols = len(sl)
        
        fixed_list.append(sl[0])
        for index in range(1,num_cols, 2):
            fixed_list.append(sl[index])
        #print(fixed_list)
        out_str = '\t'.join(fixed_list)
        print(out_str)
