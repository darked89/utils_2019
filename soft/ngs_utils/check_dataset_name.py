#!/usr/bin/env python2


import os, sys

dataset_db = sys.argv[1]

##analysis
#dataset_db =  'dataset_id__filename.txt'
#galaxy_dir = '/opt/galaxy/database/files/000/'

#synthesis
galaxy_dir = '/DANE_SYNOLOGY/galaxy_ftp/021/'

with open(dataset_db) as db:
    for line in db:
        sl = line.split()
        dataset_num = sl[0]
        orig_name   = sl[1]
        
        if orig_name[-3:] == '.gz':
            out_name = orig_name
        else:
            out_name = orig_name +  '.gz'
        dataset_fn = 'dataset_%s.dat' % (dataset_num)
        my_path = galaxy_dir + dataset_fn
        if os.path.exists(my_path) and os.path.getsize(my_path) > 0:
            command = 'pigz -c %s > ./%s' % (my_path, out_name)
            print command
            os.system(command)
        else:
            print 'problem with %s' % (my_path)
