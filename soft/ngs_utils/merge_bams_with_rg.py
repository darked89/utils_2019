#!/opt/conda/bin/python3.7

import glob, os, sys
from subprocess import check_output, STDOUT


pattern   = '*.rg.bam'

patient_ids = []

for rgbam_fn in glob.glob(pattern):
    subject_id  = rgbam_fn.split('_')[0]
    print("##", rgbam_fn, subject_id)
    
    if subject_id not in patient_ids:
         patient_ids.append(subject_id)
 

print(patient_ids)

merged_prefix  = "idsc-"
merged_postfix = "nseq_20190506_r12.bwa_ens94.rg.mrg.bam"


for subject_id in patient_ids:
    output_bam = f'{merged_prefix}{subject_id}_{merged_postfix}'
    pattern = f'{subject_id}_*.rg.bam'
    input_bams =  glob.glob(pattern)
    print(output_bam)
    inputs_str = " ".join(input_bams)
    command = f'sambamba merge -t 32 {output_bam} {inputs_str}'
    print( command) 
    #for i in input_bams


    
'''    
    out_string = f"""java -Xmx8G -jar /opt/soft/picard_current/picard.jar \\
    AddOrReplaceReadGroups \\
    I={input_bam} \\
    O={output_bam} \\
    RGID={read_group_name} \\
    RGSM={sample_name} \\
    RGLB={library_name} \\
    RGPU={platform_unit} \\
    RGPL=ILLUMINA \\
    RGPM={platform_model} \\
    RGCN=MAB \\
    RGDT={run_date}
    
    """
    print (out_string) 

'''
