#!/opt/conda/bin/python3.7

"""

takes an input bam files 
creates shell scripts for SLURM


java -Xmx96G -jar /opt/soft/qorts_1.3.6/QoRTs.jar  QC \
--prefilterImproperPairs  \
--maxReadLength 76   
--outfilePrefix cbrako-fix001_PT_0.run33. \
--addFunctions FPKM \
--skipFunctions NVC,GCDistribution,readLengthDistro,QualityScoreDistribution,writeJunctionSeqCounts,writeKnownSplices,writeNovelSplices,writeClippedNVC,CigarOpDistribution,cigarLocusCounts,InsertSize,chromCounts,writeSpliceExon,writeGenewiseGeneBody,JunctionCalcs \
cbrako-fix001_PT_0.rna.r12.star_hg38p12alt.bam_mrgd.bam \
/opt/genome/hg38p12/gencode.v31.chr_patch_hapl_scaff.annotation.name_fix.gtf \
./qual_out/



"""

import sys, os, glob

num_of_threads = 2

qorts_jar  = '/opt/soft/qorts_1.3.6/QoRTs.jar'
gtf_fn     = "/opt/genome/hg38p12/gencode.v31.chr_patch_hapl_scaff.annotation.name_fix.gtf"

funcs_2_skip = """NVC,GCDistribution,readLengthDistro,\\
QualityScoreDistribution,writeJunctionSeqCounts,\\
writeKnownSplices,writeNovelSplices,writeClippedNVC,\\
CigarOpDistribution,cigarLocusCounts,InsertSize,chromCounts,\\
writeSpliceExon,writeGenewiseGeneBody,JunctionCalcs """


pattern         = "cbrako-fix*.star_hg38p12alt.bam_mrgd.bam"


shell_file_header = f"""#!/bin/bash

#SBATCH --partition batch
#SBATCH  --cpus-per-task {num_of_threads}
#SBATCH --time 24:00:00

"""


for bam_fn in glob.glob(pattern):
    shell_fn   = bam_fn.replace('.bam_mrgd.bam', '.bam_mrgd.qorts.sh')
    out_prefix = bam_fn.replace('.bam_mrgd.bam', '.bam_mrgd.qorts.')
    
    command_1 = f"""java -Xmx96G -jar {qorts_jar} QC		\\
    --prefilterImproperPairs 		\\
    --maxReadLength 76 				\\
    --outfilePrefix {out_prefix} 	\\
    --addFunctions FPKM 			\\
    --skipFunctions  {funcs_2_skip}\\
    {bam_fn} {gtf_fn } ./qual_out/ 
    
    """
    
    saveout = sys.stdout
    output_fh = open(shell_fn, 'w')
    sys.stdout = output_fh
    
    print(shell_file_header)
    #print()
    print(command_1)
    
    sys.stdout = saveout
    output_fh.close()
    os.system("chmod +x %s" % (shell_fn))
