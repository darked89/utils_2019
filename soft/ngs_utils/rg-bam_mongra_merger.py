#!/opt/conda/bin/python3.7

import glob, sys

persons_list = []

suffix = 'r12.bwa_ens94.rg.bam'

for fn in glob.glob('*' + suffix):
    spl_fn = fn.split('_')
    #spl_fn = [ i.decode('UTF-8') for i in spl_fn]
    person_id =  spl_fn[0]
    #print (fn, person_id)
    if person_id not in persons_list:
        persons_list.append(person_id)
#print(persons_list)   

for person_id in persons_list:
    out_merged_bam_fn = 'idsc-' + person_id + '_merged20190606_' + suffix
    pattern = person_id + '*' + suffix
    #print(pattern)
    bam_inputs = ''
    for input_bam_fn in glob.glob(pattern):
        bam_inputs = f"{bam_inputs} I={input_bam_fn}"
    print ('## ', bam_inputs )
    print ('## ', out_merged_bam_fn)
    
    out_command = f"""java -Xmx8G -jar /mnt/vdb1/soft/picard_2.20.2/picard.jar MergeSamFiles \\
    {bam_inputs} \\
    O={out_merged_bam_fn} \\
    AS=true  USE_THREADING=true
    
    """
    print (out_command)
'''    
    for fn in 
    merged_fn = '%s_merged_r%s.fq' % (person_id, read_num)
    command = 'zcat %s*r%s.fq.gz > %s' % (person_id, read_num, merged_fn)
    print command
'''
