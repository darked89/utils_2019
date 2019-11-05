#!/usr/bin/env python3

import glob, sys,  collections

positions_fn = 'GSAMD-24v2-0_20024620_A1-b38.strand'

positions_dict = {}

#position_tuple = namedtuple(('position_tuple', ['chrom', 'position'])

with open(positions_fn) as f:
    for line in f:
        sl = line.split()
        probe,chrom,position = sl[0],sl[1],sl[2]
        #print(probe,chrom,position)
        if probe not in positions_dict.keys():
            positions_dict[probe] = [chrom, position]

#print( positions_dict)

'''
SNP_Name,        Sample_Name,     Chr,     Position,        Log_R_Ratio,     B_Allele_Freq,   GC_Score
'''


input_fn_pattern = './data2/ital*.txt'
exclude_chrom    = ['X', 'Y', 'MT', '18'] 

for input_fn in glob.glob(input_fn_pattern):

    with open(input_fn) as in_f:
        saveout = sys.stdout
        out_hg38_fn = input_fn.replace('.txt', 'hg38.noXYMT_18.txt')
        output_fh = open(out_hg38_fn, 'w')
        sys.stdout = output_fh
    
        counter = 0
        for line in in_f:
            if counter < 10:
                print(line.strip())
                counter +=1
            else:
                sl = line.split()
                SNP_Name, Sample_Name, Chr, \
                Position, Log_R_Ratio, \
                B_Allele_Freq, GC_Score = sl
                #probe = sl[0]
                if SNP_Name in positions_dict.keys():
                    new_chrom,  new_position = positions_dict[SNP_Name]
                    #print('old', SNP_Name, sl[2],sl[3], sl )
                    new_line = f'{SNP_Name}\t{Sample_Name}\t{new_chrom}\t{new_position}\t'       
                    new_line = new_line +  f'{Log_R_Ratio}\t{B_Allele_Freq}\t{GC_Score}'
                    #print(sl)
                    if new_chrom not in exclude_chrom:
                        print(new_line)
                    else:
                        pass
                else:
                    pass
                counter +=1     
            
        sys.stdout = saveout
        output_fh.close()
        
