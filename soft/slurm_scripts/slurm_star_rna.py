#!/opt/conda/bin/python3.7

"""
globs fq.r1.bz2 filenames
creates shell scripts for SLURM
maps paired reads with STAR
sorts pipe output with samtools

/opt/soft/star_2.7.2a/bin/Linux_x86_64_static/STARlong \
--runThreadN 12 \
--genomeDir /opt/genome/hg38/ \
--runMode alignReads \
--readFilesCommand pbzip2 -dc \
--outStd SAM \
--outFileNamePrefix cbrako-fix089_PT_0_7.rna.mrgd_4.clump.star_hg38.r12
--readFilesIn cbrako-fix089_PT_0_7.rna.mrgd_4.clump.r1.fq.bz2 cbrako-fix089_PT_0_7.rna.mrgd_4.clump.r2.fq.bz2 | \
samtools sort -@12 -o cbrako-fix089_PT_0_7.rna.mrgd_4.clump.star_hg38.r12.bam


"""

import sys, os, glob

num_of_threads = 12


shell_file_header = f"""#!/bin/bash

#SBATCH --partition batch
#SBATCH  --cpus-per-task {num_of_threads}
#SBATCH --time 24:00:00

"""
genomeDir        = '/opt/genome/hg38/'
star_exe         = '/opt/soft/star_2.7.2a/bin/Linux_x86_64_static/STARlong'
sambamba_exe     = '/opt/soft/bin/sambamba'

fastq_r1_pattern = 'cbrako-*.r1.fq.bz2'


for fq_r1_input_fn in glob.glob(fastq_r1_pattern):
    fq_r2_input_fn = fq_r1_input_fn.replace('.r1.fq.bz2', '.r2.fq.bz2')
    out_prefix     = fq_r1_input_fn.replace('.r1.fq.bz2', '.r12.star_hg38p13')
    shell_fn       = out_prefix + '.sh'
    bam_out_fn     = out_prefix + '.bam'
    #bam_out_fn     = fq_r1_input_fn.replace('.r1.fq.bz2', '.r12.star_hg38p13.bam')
    
    command_1 = f"""{star_exe}		\\
    --runMode alignReads			\\
    --runThreadN {num_of_threads}	\\
    --genomeDir {genomeDir}			\\
    --readFilesCommand pbzip2 -dc	\\
    --outStd SAM					\\
    --outFileNamePrefix {out_prefix}	\\
    --readFilesIn {fq_r1_input_fn} {fq_r2_input_fn} |  \\
    samtools sort -@{num_of_threads/2} -o {bam_out_fn}

    """
    
    command_2 = f"""{sambamba_exe} index \\
    --nthreads={num_of_threads} \\
    {bam_out_fn}
    """
    saveout = sys.stdout
    output_fh = open(shell_fn, 'w')
    sys.stdout = output_fh
    
    print(shell_file_header)
    #print()
    print(command_1)
    print('\n\n')
    print(command_2)
    sys.stdout = saveout
    output_fh.close()
    os.system("chmod +x %s" % (shell_fn))



