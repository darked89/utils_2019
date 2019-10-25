#!/usr/bin/env python

import glob

db_fn = "dkhg38_annot_filter.list"

db_list = []

for line in open(db_fn).readlines():
    db_name = line.strip()
    #print db_name
    db_list.append(db_name)
    
#print db_list

for avinput_fn in glob.glob("idsc-*avinput"):
    for db_name in db_list:	
        out_fn = avinput_fn.replace('vcf.avinput', db_name)
        #print out_fn
        command = '''../annovar_20190611/annotate_variation.pl --filter -dbtype %s -build hg38 --outfile %s %s ../annovar_20190611/humandb/ ''' % (db_name, out_fn, avinput_fn)
        print command
        print

''' 
#% (db_name, )

../annovar_20190611/annotate_variation.pl -dbtype refGene -build hg38 --outfile (basename $fn .avinput).refGene $fn ../annovar_20190611/humandb/ 

'''
