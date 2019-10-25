#!/opt/conda/bin/python3.7

"""
calculating quality values and raw gene counts/FPKMs from qorts gz files


"""

import sys, os, glob, gzip

num_of_threads = 1




pattern = "qual_out/cbrako-fix*FPKM.txt.gz"
#pattern = 'qual_out/cbrako-fix001*geneCounts.formatted.for.DESeq.txt.gz'


aims_names_fn         = 'aims_ensemb.155.ids'
aims_ensembl2entr_fn  = 'ensemblids2entrezids.tsv'

aims_names    = []

with open(aims_names_fn) as f:
    for line in f:
        aims_names.append(line.strip())

aims_ensembl2entr_dict = {}


with open(aims_ensembl2entr_fn) as fa:
    for line in fa:
        sl                    = line.split()
        ensembl_id, entrez_id = sl[:2]
        aims_ensembl2entr_dict[ensembl_id] = entrez_id


def get_aims_dict(fpkm_gz_fn):
    aims_dict   = {}
    with gzip.open(fpkm_gz_fn, mode='r') as f:
        for line in f:
            sl = line.split()
            #print(sl)
            gene_id, fpkm = sl[0].decode('utf-8') , sl[1].decode('utf-8')
            if gene_id[0] == 'E':
                fpkm    = float(fpkm)
                gene_id  = gene_id.split('.')[0]
                if gene_id in aims_names:
                    #entrez_id = aims_ensembl2entr_dict[gene_id]
                    aims_dict[gene_id] = fpkm
            else:
                pass

    return aims_dict


dict_of_fpkm_dicts = {}

for fpkm_count_fn in glob.glob(pattern):
    sample_name = fpkm_count_fn.split('/')[1]
    sample_name = sample_name.split('.')[0]
    print(sample_name)
    out_aims_fn = f'{sample_name}.aims.fpkm'
    saveout = sys.stdout
    output_fh = open(out_aims_fn, 'w')
    sys.stdout = output_fh

    header = f'EntrezID\t{sample_name}'
    aims_dict = get_aims_dict(fpkm_count_fn)
    print(header)
    for gene_id in aims_names:
        entrez_id = aims_ensembl2entr_dict[gene_id]
        fpkm      =  aims_dict[gene_id]
        out_str   = f'{entrez_id}\t{fpkm}'
        print(out_str)
    
    sys.stdout = saveout
    output_fh.close()
    
    print('#######################')

