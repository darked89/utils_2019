# Files, directories

* never ever use space/tabs in your file/directory names
* never use Unix special characters in file/directory names (!?"'%&^~*$|/\{}[]()<>:)

# Samples/tissues
* use few letter prefix for the disease

| project | prefix |
| ------ | ------ |
| ca. breast | cbr |
| ca. colon | cco | 
| ca. prostate | cpr  |
| ca. bladder | cbl |
| Alzheimer | alz |
| control | ctr |
| fibroadenoma | fad |

* keep the patient/person ID **unchanged** in all the experimental data. 

* if not created by the in house database system, the patient_id should be: 
2 letters researcher (responsible for the patient sample collection) initial
followed by 4 numbers.

```
dk0001
dk9999

pm0543
```

* merge prefix (project) with patient_id using one underscore "_"
```
alz_dk0123
```

* provide a code for the tissue

| tissue | code |
| ------ | ------ |
| blood | BL |
| primary tumor | PT | 
| unaffected margin | UM |
| unaffected margin 99 | UM99 | 

* merge with project code & patient_id using underscore
```
cbr_ak0125_PT
```

* if not provided with a sample code id from the in house  database:

provide the sample number: 
0 for the first sample of that type (i.e. the tube #1 of blood used for DNA extraction)
1, 2 etc for the subsequent **material** preparations from the given patient-sampletype combo

```
cbr_ak0125_PT_0

cbr_ak0125_PT_1
```

* in case of repeating the experiment, i.e. re-sequencing the same sample, lets add another number. To be discussed  




```
Hello,

currently I started to use the following system:

cbrako_fix034_PT_0_9
cbr  = > ca breast (major disease prefix)
ako =>  specific project / sample source if applicable. Can be xyz for all samples stored here
fix034 => internal to that project patient id
PT => tissue type
_0_9 => biological-replicate_technical-replicate

I also used PT_13_0 for the tumor in the same patient after remission.

Above system is a quick fix for tissue samples stored in tubes labeled with non-consistent patient id's followed by generating ~10k sequencing files with groups of 4-8 with ~identical patient/tissue identifiers (fix034_PT.result,  fix034PT.result, fix034-PT.result,  fix034PT.result, etc).

Since we will get the unique ids for all the tissue samples, we can do:
a) cbrako_fix034_PT_xd2f_9 (where xd2f is some unique string to identify tumor samples from fix034 patient
b) enumerate tumor/blood samples from a given patient 
xd2f 0 
jk5p 1 

keep the  cbrako_fix034_PT_0_1
c) go for an overkill
cbrako_fix034_PT_0_1.xd2f.

where xd2f will be id for DNA/RNA prep.

I am concatenating labels for a various processing steps for each of the data files:
cbrako_fix039_PT_0_2.rna.mrgd_4.clump.r12.star_hg38p13.md.bam

to minimize the chance of screwing things and be able to figure out things in a week or in a year from now. But it is a non-trivial problem.

This is just to keep you posted before the tomorrows meeting/save some time.


```
