# Calculating LRR sd for Nexus files
# Pawel Olszewski
# paweloni@gmail.com
# 2019.08.20
# Gdansk

library(dplyr) #because I like to use filter function

#create a list of all files in a directory.
file_list = list.files(pattern="*.txt") 

# create an empty data frame with columns for file name, LRR sd for chromosome 1 and total LRR sd.
data_file = data.frame(file_list = file_list, LRR_chr1_sd = 0, LRR_total_sd = 0)

for (i in seq_along(data_file$file_list)){
  data = read.table(file_list[i],
                    skip = 10,
                    header = F,
                    col.names = c("SNP_name", "sample_name", "chr", "pos","Log_R_Ratio", "B_Allele_Freq", "GCscore"))
  data_ch1 = filter(data, chr %in% 1)
  data_file$LRR_chr1_sd[i] = sd(data_ch1$Log.R.Ratio, na.rm=T)
  data_file$LRR_total_sd[i] = sd(data$Log_R_Ratio, na.rm=T)
  rm(data, data_ch1)#remove crap
}

#write file
write.csv(data_file, file = "LRR_genotyping_data.csv", row.names = F)
