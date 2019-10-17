#!/opt/conda/bin/python3.7

import sys

bed1_fn = sys.argv[1]
bed2_fn = sys.argv[2]

sum_of_reads_1 = 0
sum_of_reads_2 = 0

with open(bed1_fn) as f1:
    for line in f1.readlines():
        sl = line.split()
        read_count = int(sl[3])
        sum_of_reads_1 += read_count
        
with open(bed2_fn) as f2:
    for line in f2.readlines():
        sl = line.split()
        read_count = int(sl[3])
        sum_of_reads_2 += read_count    

mapped_in_regions_fract = sum_of_reads_1/(sum_of_reads_1 + sum_of_reads_2)

print (bed1_fn, bed2_fn, sum_of_reads_1, sum_of_reads_2, mapped_in_regions_fract)     
