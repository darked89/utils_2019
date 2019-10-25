# to marge several fastq files

```
# for gzipped fastq (separate for R1 and R2 reads!!!

zcat *R1_001.fastq.gz > MP012019_BL_batch2_r1.fq
zcat *R2_001.fastq.gz > MP012019_BL_batch2_r2.fq

# for plain text fastq (note the file suffix change. This is to be on the safe side)
cat *R1_001.fastq > MP012019_BL_batch2_r1.fq
cat *R2_001.fastq > MP012019_BL_batch2_r2.fq


```