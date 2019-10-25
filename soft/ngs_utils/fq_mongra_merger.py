#!/usr/bin/env python2

import glob, sys

persons_list = []
for fn in glob.glob('*r1.fq.gz'):
	
    spl_fn = fn.split('_')
    person_id =  spl_fn[0]
    #print fn, person_id
    if person_id not in persons_list:
	    persons_list.append(person_id)
	    
for person_id in persons_list:
	for read_num in [1,2]:
	    merged_fn = '%s_merged_r%s.fq' % (person_id, read_num)
	    command = 'zcat %s*r%s.fq.gz > %s' % (person_id, read_num, merged_fn)
	    print command
