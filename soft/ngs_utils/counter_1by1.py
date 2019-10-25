#!/opt/conda/bin/python3.7

"""
getting raw gene counts from bam files using htseq

takes an input bam files 
creates shell scripts for SLURM

 /opt/conda/bin/htseq-count --format bam \
 cbrako-fix001_PT_0.rna.r12.star_hg38p13.bam_mrgd.bam \
 /opt/genome/hg38/gencode.v31.annotation.gtf \
 > cbrako-fix001_PT_0.rna.r12.star_hg38p13.bam_mrgd.counts 

"""

import sys, os, glob

num_of_threads = 1


shell_file_header = f"""#!/bin/bash

#SBATCH --partition batch
#SBATCH  --cpus-per-task {num_of_threads}
#SBATCH --time 24:00:00

export PATH=/opt/conda/bin:$PATH
"""


pattern    = "cbrako-fix12*PT*star_hg38p13.bam_mrgd.htseq_raw"

aims_names_fn = 'aims_ensembl.20190910.ids'

aims_names    = []
with open(aims_names_fn) as fa:
    for line in fa:
        aims_names.append(line.strip())

aims_ensembl2entr_dict = {}
aims_ensembl2entr_fn   = 'aims_ensembl_entrez.20190911.ids'

with open(aims_ensembl2entr_fn) as fa:
    for line in fa:
        ensembl_id, entrez_id = line.split()
        aims_ensembl2entr_dict[ensembl_id] = entrez_id

def total_count(raw_count_fn):
    count_total = 0
    aims_dict   = {}
    with open(raw_count_fn) as f:
        for line in f:
            gene_id, count = line.split()
            count    = int(count)
            gene_id  = gene_id.split('.')[0]
            
            count_total += count
            if gene_id in aims_names:
                aims_dict[gene_id] = count
    return count_total, aims_dict
    #for gene_id in aims_dict.keys():
    #    print(gene_id, aims_dict[gene_id]/count_total)


for pt_raw_count_fn in glob.glob(pattern):
    um_raw_count_fn = pt_raw_count_fn.replace('_PT_','_UM_')
    #pre_aims_fn = raw_count_fn.replace('.htseq_raw','pre_aims')
    
    pt_count_total, pt_aims_dict = total_count(pt_raw_count_fn)
    um_count_total, um_aims_dict = total_count(um_raw_count_fn)
    #debug
    print(pt_raw_count_fn, pt_count_total)
    print(um_raw_count_fn, um_count_total)
    print('#######################')
    
    for ensembl_id in aims_names:
        entrez_id = aims_ensembl2entr_dict[ensembl_id] 
        
        pt_count = pt_aims_dict[ensembl_id]
        um_count  = um_aims_dict[ensembl_id]
        pt_rpkm   = pt_count * 1000000/pt_count_total
        um_rpkm   = um_count * 1000000/um_count_total
        
        out_str = f'{entrez_id}\t{pt_rpkm}\t{um_rpkm}'
        print(out_str)
    
    '''
    for ensembl_id in aims_names:
        entrez_id = aims_ensembl2entr_dict[ensembl_id] 
        pt_count = pt_aims_dict[ensembl_id]
        um_count = um_aims_dict[ensembl_id]
        if um_count != 0:
            pt_um_norm_ratio = (pt_count*um_count_total)/(pt_count_total*um_count)
        else:
            pt_um_norm_ratio = 'NA'
        out_str = f'{entrez_id}\t{pt_um_norm_ratio}'
        print(out_str)
    '''
    '''
    print(pt_raw_count_fn, pt_count_total)
    print(um_raw_count_fn, um_count_total)
    print('#######################')
    '''
