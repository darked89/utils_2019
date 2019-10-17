#!/opt/conda/bin/python3.7

"""
takes an input file with bam names
creates shell scripts for SLURM

for fn in *bam
    ./gridss_20190626_arpi.sh --output (basename $fn .bam).gridss240.vcf --assembly (basename $fn .bam)asmbly_grids.bam $fn
end



"""

import sys, os

shell_file_header = """#!/bin/bash

#SBATCH --partition batch
#SBATCH  --cpus-per-task 4
#SBATCH --time 24:00:00

"""

gridss_script_exe = 'gridss_20190626_arpi.sh'

bam_fof_fn = '24_bams_02batch.fof'

for line in open(bam_fof_fn).readlines():
    bam_input_fn       = line.strip()
    shell_fn = bam_input_fn.replace('.bam', '.gridss.sh')
    
    
    vcf_out_fn         = bam_input_fn.replace('.bam', '.gridss240.vcf')
    assembl_bam_out_fn = bam_input_fn.replace('.bam', '.asmbly_grids.bam')
    command = f"""./{gridss_script_exe} \\
    --output {vcf_out_fn} \\
    --assembly {assembl_bam_out_fn} \\
    {bam_input_fn}
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



