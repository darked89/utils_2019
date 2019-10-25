#!/opt/conda/bin/python3.7

"""
takes an input file with bam names
creates shell scripts for SLURM

for fn in *bam
    sambamba markdup $fn  (basename $fn .bam)md_sambamba.bam
end



"""

import sys, os, glob

shell_file_header = """#!/bin/bash

#SBATCH --partition batch
#SBATCH  --cpus-per-task 6
#SBATCH --time 24:00:00

"""

gridss_script_exe = 'gridss_20190626_arpi.sh'

bam_fof_fn = '24_bams_02batch.fof'

for bam_input_fn in glob.glob('R*.bam'):
    shell_fn = bam_input_fn.replace('.bam', '.markdup.sh')
    md_bam_out_fn = bam_input_fn.replace('.bam', '.md_sambamba.bam')
    
    command = f"""sambamba markdup \\
    {bam_input_fn} \\
    {md_bam_out_fn}
    """
    saveout = sys.stdout
    output_fh = open(shell_fn, 'w')
    sys.stdout = output_fh
    
    print(shell_file_header)
    #print()
    print(command)
    
    sys.stdout = saveout
    output_fh.close()
    os.system("chmod +x %s" % (shell_fn))



