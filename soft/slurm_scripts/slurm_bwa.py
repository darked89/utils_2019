#!/opt/conda/bin/python3.7

"""
#takes an input file with bam names
#creates shell scripts for SLURM
# the commands:

bwa mem -M -t 16 /mnt/vdb1/gen/bwa_idx/hg38p13_vir11.fa \
R014141_1_S9.frombam.clump.r1.fq.gz \
R014141_1_S9.frombam.clump.r2.fq.gz \
| samtools sort -@8 -o R014141_1_S9.frombam.clump.r12.bwa_hg38p13_vir11.bam -

sambamba index R014141_1_S9.frombam.clump.r12.bwa_hg38p13_vir11.bam

"""

import sys, os, glob

num_of_threads = 12

sambamba_exe     = '/opt/soft/bin/sambamba'

shell_file_header = f"""#!/bin/bash

#SBATCH --partition batch
#SBATCH  --cpus-per-task {num_of_threads}
#SBATCH --time 24:00:00

"""

genome_idx_fn = '/opt/genome/hg38/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna'
fastq_r1_pattern = 'cbrako-*.r1.fq.gz'


for fq_r1_input_fn in glob.glob(fastq_r1_pattern):
    fq_r2_input_fn = fq_r1_input_fn.replace('.r1.fq.gz', '.r2.fq.gz')
    shell_fn       = fq_r1_input_fn.replace('.r1.fq.gz', '.bwa_hg38p13.sh')
    bam_out_fn     = fq_r1_input_fn.replace('.r1.fq.gz', '.r12.bwa_hg38p13.bam')
    
    comment = '# bwa mapping: {fq_r1_input_fn}\t{fq_r2_input_fn} \n'
    command_1 = f"""bwa mem -M \\
    -t {num_of_threads} \\
    {genome_idx_fn} \\
    {fq_r1_input_fn} \\
    {fq_r2_input_fn} | \\
    samtools sort \\
    -@4 \\
    -o {bam_out_fn} \\
    -
    """
    
    command_2 = f"""{sambamba_exe} index \\
    --nthreads={num_of_threads} \\
    {bam_out_fn}
    """
    saveout = sys.stdout
    output_fh = open(shell_fn, 'w')
    sys.stdout = output_fh
    
    print(shell_file_header)
    print(comment)
    print(command_1)
    print('\n\n')
    print(command_2)
    sys.stdout = saveout
    output_fh.close()
    os.system("chmod +x %s" % (shell_fn))



