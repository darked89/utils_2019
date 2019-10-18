#!/opt/conda/bin/python3.7

"""
globs r1.fq names
gets r2
for clumipify.sh from BBMap to shrink 
creates shell scripts for SLURM


/opt/soft/bbmap_38.63/clumpify.sh \
in=idsc-13p_merged_r1.fq \
in2=idsc-13p_merged_r2.fq \
out=idsc-13p_merged_r1.fq.gz \
out2=idsc-13p_merged_r2.fq.gz \
reorder=a \
shortname=shrink \
lowcomplexity=t \
markduplicates=t \

 
"""

import sys, os, glob

num_of_threads = 12

clumpify_exe = '/opt/soft/bbmap_current/clumpify.sh'

options = '''reorder=a \\
shortname=shrink \\
lowcomplexity=t '''

###markduplicates=t '''


shell_file_header = f"""#!/bin/bash

#SBATCH --partition batch
#SBATCH  --cpus-per-task {num_of_threads}
#SBATCH --time 24:00:00

export PATH=/opt/soft//opt/soft/graalvm-ee_19.2.0/bin:$PATH

"""

fastq_r1_pattern = '*.r1.fq.gz'


for in_r1_fq in glob.glob(fastq_r1_pattern):
    in2_r2_fq  = in_r1_fq.replace('.r1.fq.gz', '.r2.fq.gz')
    out_r1_fq  = in_r1_fq.replace('.r1.fq.gz', '.clump.r1.fq.bz2')
    out2_r2_fq = in_r1_fq.replace('.r1.fq.gz', '.clump.r2.fq.bz2')
    
    shell_fn       = in_r1_fq.replace('.r1.fq.gz', '.clump_r12.sh')
    
    
    command_1 = f"""{clumpify_exe} \\
    in={in_r1_fq}     \\
    in2={in2_r2_fq}   \\
    out={out_r1_fq}   \\
    out2={out2_r2_fq} \\
    {options}
    
    """
    
    saveout = sys.stdout
    output_fh = open(shell_fn, 'w')
    sys.stdout = output_fh
    
    print(shell_file_header)
    #print()
    print(command_1)
    print('\n\n')
    
    sys.stdout = saveout
    output_fh.close()
    os.system("chmod +x %s" % (shell_fn))



