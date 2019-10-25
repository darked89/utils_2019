#!/opt/conda/bin/python3.7

import sys, os
import glob

## constant params
reference_fasta = "/opt/genome/hg38/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna"
num_of_threads = 8


shell_file_header = f"""#!/bin/bash

#SBATCH --partition batch
#SBATCH  --cpus-per-task {num_of_threads}
#SBATCH --time 24:00:00
"""


platypus_py = '/opt/soft/platypus_chapman20190724/bin/Platypus.py'
pattern         = "cbrako-fix*.dna_tg1.r12.bwa_hg38p13.bam_mrgd.bam"

for bam_fn in glob.glob(pattern):
    output_vcf = bam_fn.replace('bam_mrgd.bam', 'bam_mrgd.plat.vcf')
    log_txt    = bam_fn.replace('bam_mrgd.bam', 'bam_mrgd.platypus.log')
    shell_fn   = bam_fn.replace('bam_mrgd.bam', 'bam_mrgd.platy.sh')

    command_1 = f"""python {platypus_py} callVariants \\
    --bamFiles={bam_fn} \\
    --output={output_vcf} \\
    --refFile={reference_fasta} \\
    --regions=chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX,chrY,chrM \\
    --nCPU={num_of_threads} --minReads=5 --minMapQual=30 \\
    --minBaseQual=30 --mergeClusteredVariants=0 \\
    --filterDuplicates=1 \\
    --logFileName={log_txt} 
    
    
    """
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
