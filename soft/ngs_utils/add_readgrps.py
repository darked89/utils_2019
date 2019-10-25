#!/opt/conda/bin/python3.7

import glob, os
from subprocess import check_output, STDOUT


pattern   = '*um.bam'

for um_bam_fn in glob.glob(pattern):

    bwa_bam_fn = um_bam_fn.replace('um.bam', 'bwa_ens94.bam')
    out_bam_fn = bwa_bam_fn.replace('.bam', '.rg.bam')
    
    print("##", um_bam_fn, bwa_bam_fn, out_bam_fn )
 
 

    
    command = 'samtools view -H  %s | grep RG' % (um_bam_fn)
    output  = check_output(command,  stderr=STDOUT, shell=True)
    sl = output.split()
    sl = [ i.decode('UTF-8') for i in sl[1:]]
    #sl = sl[1:]
    #sl = sl.decode('UTF-8')
    #print(sl)
    rg_values = [i.split(":")[1] for i in sl]
    print ("#rg_values", rg_values)


    
    read_group_name, sample_name, library_name, platform, platform_unit = rg_values
    
    
    
    out_command = f"""java -Xmx8G -jar /mnt/vdb1/soft/picard_2.20.2/picard.jar AddOrReplaceReadGroups \\
    I={bwa_bam_fn}  \\
    O={out_bam_fn}  \\
    RGID={read_group_name}  \\
    RGSM={sample_name} \\
    RGLB={library_name}  \\
    RGPL=illumina     \\
    RGPU={platform_unit}  \\
    ## VALIDATION_STRINGENCY=LENIENT 
    ## CREATE_INDEX=TRUE SO=coordinate
    
    """
    
    
    print (out_command) 


