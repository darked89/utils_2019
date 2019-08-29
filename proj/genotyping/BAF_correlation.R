##
#
library(data.table)
library(corrplot)

file_list = list.files(pattern="*.txt") #lists all files in the directory but in principle it should contain list of files that are meant to be uploaded.

BAF_matrix = do.call(cbind, lapply(file_list, function(fn)fread(fn, skip=10, header=F, col.names = c("SNP.name", "sample.name", "chr", "pos","Log.R.Ratio", "B.Allele.Freq", "GCscore"))[,6]))
colnames(BAF_matrix) = file_list

BAF_matrix=na.omit(BAF_matrix)
cor_BAF = cor(BAF_matrix)

corrplot.mixed(cor_BAF, number.digits = 4)


