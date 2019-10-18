#!/usr/bin/env python3


import os, sys


level_0 = ['raw','results']
level_1 = ['mab','far']
level_2_mab = ['canc', 'alzh', 'cntr', 'othr']
level_2_far = ['idsc', 'dod']
level_3_canc = ['bladr', 'brest', 'colon', 'prost' ]
level_4_canc = ['seqs', 'gtyp','micr', 'facs', 'imgs', 'nums', 'vari']
level_5_canc = ['wgs', 'rna', 'met', 'exo', 'tgt','oth'] 
level_6_canc = ['tum', 'mar', 'bld', 'ctr']

prefix_1 = '/data/mab/raw/canc'

for cancer_type in level_3_canc:
    for data_type in level_4_canc:
        out_string = f'mkdir -p {prefix_1}/{cancer_type}/{data_type}/'
        print (out_string)
        #for level_5_canc
    for seq_type in level_5_canc:
        for tissue_type in level_6_canc:
            out_string = f'mkdir -p {prefix_1}/{cancer_type}/seqs/{seq_type}/{tissue_type}'
            print (out_string)

prefix_2 = 'far/raw/cabr/seqs'
for seq_type in level_5_canc:
    for tissue_type in level_6_canc:
        out_string = f'mkdir -p {prefix_2}/{seq_type}/{tissue_type}'
        print (out_string)


       
'''
dir_dict = {}
for key in level_0:
    dir_dict[key] = {}
    for val_1 in level_1:
        dir_dict[key].update({val_1:{}})
    for val_2mab in level_2_mab:
        dir_dict[key]['mab'].update({val_2mab: {}})
        for val_3canc in level_3_canc:
            
    for val_2far in level_2_far:
        dir_dict[key]['far'].update({val_2far: {}})
        
print (dir_dict)
'''
#foo = 'a b c %s + \t %s ' % (var1, var2)
