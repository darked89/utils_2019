#!/opt/conda/bin/python3.7

"""
merging of bam files from the same sample with sambamba

takes an input bam files 
creates shell scripts for SLURM

 /opt/soft/bin/sambamba merge --nthreads=12 output.bam input1.bam input2.bam [more bams as needed...]

"""

import sys, os, glob

num_of_threads = 12


shell_file_header = f"""#!/bin/bash

#SBATCH --partition batch
#SBATCH  --cpus-per-task {num_of_threads}
#SBATCH --time 24:00:00

"""

sambamba_exe    = '/opt/soft/bin/sambamba'
out_name_label  = 'rna.r12.star_hg38p13.bam_mrgd.bam'
pattern         = "cbrako-fix*clump.r12.star_hg38p13.bam"


merge_dict = {}

for bam_fn in glob.glob(pattern):
    name_prefix =  bam_fn.split('.')[0]
    sample_name = name_prefix[:-2]
    if sample_name not in merge_dict.keys():
        merge_dict[sample_name] = []
    merge_dict[sample_name].append(bam_fn)
    

for sample_name in merge_dict.keys():
    shell_fn      =  sample_name + '.merging.sh'
    out_bam_fn    =  f'{sample_name}.{out_name_label}'
    input_bams    = " ".join(merge_dict[sample_name])
    
    command_1 = f"""{sambamba_exe} merge	\\
    --nthreads={num_of_threads}			\\
    {out_bam_fn} 		\\
    {input_bams} 
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
