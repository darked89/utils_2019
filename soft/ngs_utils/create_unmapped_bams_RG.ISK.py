#!/opt/conda/bin/python3.7

import glob, os, sys
from subprocess import check_output, STDOUT

platform_model = sys.argv[1] 
run_date       = sys.argv[2]
#run_date       = run_date + 'T00:00:00+0200'

tissue_id      = 'bl'
library_number = 2
pattern   = '07*ISK*r1.fq.gz'

for r1_fn in glob.glob(pattern):

    r2_fn       = r1_fn.replace('r1.fq.gz', 'r2.fq.gz')
    out_r12_bam = r1_fn.replace('r1.fq.gz', 'r12.um.bam')
    subject_id  = r1_fn.split('_')[0]
    print("##", r1_fn, r2_fn, out_r12_bam, subject_id)
    #print r1_fn, r2_fn, out_r12_bam
    
    command = 'zcat %s | head -1' % (r1_fn)
    output=check_output(command,  stderr=STDOUT, shell=True)
    sl = output.split()[0]
    sl = sl[1:]
    sl = sl.decode('UTF-8')
    instrument, run_number, flowcell_ID, lane_number = sl.split(':')[:4]
    print("##", sl)
    print("##", instrument, run_number, flowcell_ID, lane_number )
    
    read_group_name = f"{flowcell_ID}.{lane_number}"
    sample_name     = f"{subject_id}_{tissue_id}"
    library_name    = f"{sample_name}.{library_number}"
    platform_unit   = f"{instrument}.{flowcell_ID}.{lane_number}"
    
    
    out_command = f"""java -Xmx8G -jar /opt/soft/picard_current/picard.jar  FastqToSam \\
    FASTQ={r1_fn}    \\
    FASTQ2={r2_fn}  \\
    OUTPUT={out_r12_bam} \\
    READ_GROUP_NAME={read_group_name} \\
    SAMPLE_NAME={sample_name} \\
    LIBRARY_NAME={library_name} \\
    PLATFORM_UNIT={platform_unit} \\
    PLATFORM=ILLUMINA \\
    PLATFORM_MODEL={platform_model} \\
    RUN_DATE={run_date}
    
    """
    print (out_command) 

