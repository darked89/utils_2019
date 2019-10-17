#!/usr/bin/env python3


import sys

in_fn = sys.argv[1]

regions_dict = {}

patients_dict = {'' }

participation_dict = {'Absent': '0', 'Complete':'1', 'Partial': '0.5'}

samples_cols = ['itwin-IS_BL_0_0',
'itwin-IS_BU_0_0',
'itwin-IS_BU_1_0',
'itwin-IS_HR_0_0',
'itwin-EL_BL_0_0',
'itwin-EL_BU_0_0',
'itwin-EL_HR_0_0',
'itwin-AN_BL_0_0',
'itwin-MA_BL_0_0']


with open(in_fn) as f:
    counter = 0
    for line in f:
        if counter > 0:
            sl = line.split()
            region, cnv_type, sample_id, participation = sl
            if region not in regions_dict.keys():
                regions_dict[region] = {}
            regions_dict[region]['cnv_type'] = cnv_type
            participation_num = participation_dict[participation]
            regions_dict[region][sample_id] = participation_num


            #patient_id, tissue_id, biol_copy, tech_copy = sample_id.split('_')
            #patient_id = patient_id.split('-')[1]

            #print(region, patient_id, cnv_type, participation, tissue_id, biol_copy)
        counter += 1

header = 'region\tcnv_type\t'
tmp_string = "\t".join(samples_cols)
header = header + tmp_string
print(header)

for region in regions_dict.keys():
    #out_string_1 = f"""{region}\t{regions_dict[region]['cnv_type']}\t{len(regions_dict[region])}"""
    out_string_1 = f"""{region}\t{regions_dict[region]['cnv_type']}"""
    out_values = []
    for sample_id in samples_cols:
        try:
            out_values.append(regions_dict[region][sample_id])
        except:
            print(region, regions_dict[region])
    out_string_2 = '\t'.join(out_values)
    out_string  = out_string_1 + "\t" + out_string_2
    print(out_string)

'''
            if region not in regions_dict.keys():
                pass
            else:
                pass
'''
