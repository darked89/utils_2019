## FASTQ format

```
#naming of reads by the instrument:

@<instrument>:<run number>:<flowcell ID>:<lane>:<tile>:<x-pos>:<y-pos> <read>:<is filtered>:<control number>:<sample number | barcode1'+barcode2'>

# forward, 4 different files, same run:
@NB551173:16:HLV52AFXY:1:11101:2683:1040 1:N:0:TGAAGAGA
@NB551173:16:HLV52AFXY:2:11101:21713:1036 1:N:0:TGAAGAGA
@NB551173:16:HLV52AFXY:3:11401:12648:1048 1:N:0:TGNAGAGA
@NB551173:16:HLV52AFXY:4:11401:4415:1046 1:N:0:TGAAGNGA

#corresponding reverse (r2) names:

@NB551173:16:HLV52AFXY:1:11101:2683:1040 2:N:0:TGAAGAGA
@NB551173:16:HLV52AFXY:2:11101:21713:1036 2:N:0:TGAAGAGA
@NB551173:16:HLV52AFXY:3:11401:12648:1048 2:N:0:TGNAGAGA
@NB551173:16:HLV52AFXY:4:11401:4415:1046 2:N:0:TGAAGNGA
```

