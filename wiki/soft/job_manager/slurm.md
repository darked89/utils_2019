# SLURM on foo-server


## testing the install

### fastqc
```
#!/bin/bash

#SBATCH --partition batch
#SBATCH -N 1
#SBATCH  --cpus-per-task 12
#SBATCH --time 24:00:00


module load java

twd=~/work/mongra_20190506/FQ_CLU/
odir=./fastq_results20190605 
nth=12
runlbl=p1

[ -d $twd ] || mkdir -p $twd
cd $twd || exit

[ -d $odir ] || mkdir -p $odir


time (/opt/soft/fastqc_0.11.8/fastqc --threads $nth \
	--dir /dev/shm/bart  \
	--outdir $odir /mnt/vdb1/darked89/proj/mongra_20190506/FQ_CLU/*.fq.gz \
	>& fastqc-$runlbl.out ) >& time-$runlbl

```


## GRIDSS using SLURM / sbatch

### create bash scripts for sbatch (caveat: possible crash because of the run in the same directory)

```
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


```



### problems

```
for some reason single node accepts so far just one jobv at the time
```
