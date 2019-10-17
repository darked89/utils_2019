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

htseq_exe  = '/opt/conda/bin/htseq-count'
gtf_fn     = '/opt/genome/hg38/gencode.v31.annotation.gtf'

pattern    = "cbrako-fix*star_hg38p13.bam_mrgd.bam"




for bam_fn in glob.glob(pattern):
    shell_fn      =  f'{bam_fn[:-4]}.sh'
    out_htseq_fn  =  f'{bam_fn[:-4]}.htseq_raw'
       
    command_1 = f"""{htseq_exe} 	\\
    --format bam 			\\
    {bam_fn} 		\\
    {gtf_fn} >  {out_htseq_fn}
    """
    #print(sample_name, shell_fn, out_bam_fn, input_bams)
    #print(sample_name, command_1)
    
    saveout = sys.stdout
    output_fh = open(shell_fn, 'w')
    sys.stdout = output_fh
    
    print(shell_file_header)
    #print()
    print(command_1)
    print('\n')
    sys.stdout = saveout
    output_fh.close()
    os.system("chmod +x %s" % (shell_fn))
