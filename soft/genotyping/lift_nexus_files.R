# pawols 20191017

# R solution to lift coordinates from human genome build 36.1 
# (which we have in Nexus files) to build 38, 
# which is correct for the arrays we used. 
# It creates text files with changed names and trimmed header 
# although they should be read by Nexus without any problems. 

# The scheme of program is to read manifest, 
#read files one by one, 
# merge with manifest by SNP Name, 
# select required columns in proper order, 
# write file with extra two rows [Header] and [Data].

# libraries
library(dplyr)
library(readr)
library(data.table)

# set working directory with files to be lifted
setwd("E:/snp_array/cbrako/raw_data")

# read manifest
manifest = fread("E:/snp_array/manifests/GSAMD-24v2-0_20024620_A1-b38.strand",
                 header = F,
                 sep = "\t",
                 col.names = c("SNP Name", "Chr", "Position", "Intensity","Strand", "Alleles"),
                 nThread = 8)

# list files in directory
file_list = list.files(pattern = "*.txt")

# lift-over genome using manifest
for(i in 1:length(file_list)){
  input = fread(file_list[i],
                skip = 9,
                header = T,
                col.names = c("SNP Name", "Sample Name", "chr.old", "pos.old", "Log R Ratio","B Allele Freq", "GC Score"),
                nThread = 8)
  input$'Sample Name' = substr(file_list[i],8,nchar(file_list[i])-4)
  input = inner_join(manifest, input, by="SNP Name", all=F)
  input = input[,c("SNP Name","Sample Name","Chr","Position","Log R Ratio","B Allele Freq","GC Score")]
  cat("[Header]\n[Data]\n", file = paste(substr(file_list[i],8, nchar(file_list[i])-4),"lift.txt",sep="_"))
  write_tsv(input, path=paste(substr(file_list[i],8, nchar(file_list[i])-4),"lift.txt",sep="_"), append = T, col_names = T)
  rm(input)
}


