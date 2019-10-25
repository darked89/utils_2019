#!/opt/conda/bin/python3.7

"""
takes an input file with bam name 

md5sum R014141_1_S9.frombam.clump.r12.bwa_hg38p13_vir11.bam \
 >  R014141_1_S9.frombam.clump.r12.bwa_hg38p13_vir11.bam.md5.mab


"""

import sys, os, glob

num_of_threads = 1


shell_file_header = f"""#!/bin/bash

#SBATCH --partition batch
#SBATCH  --cpus-per-task {num_of_threads}
#SBATCH --time 24:00:00

"""

bam_pattern = 'cbrako-*.bam'


for bam_fn in glob.glob(bam_pattern):
    shell_fn   = bam_fn.replace('mrgd.bam', 'mrgd.bam.md5.sh')
    md5_out_fn = bam_fn.replace('mrgd.bam', 'mrgd.bam.md5')
    
    command_1 = f'''md5sum {bam_fn} > {md5_out_fn}'''

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
    #os.system('sbatch %s' % (shell_fn))


