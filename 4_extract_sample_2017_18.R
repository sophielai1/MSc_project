library(tidyverse)

setwd("/rds/general/user/syl416/home/MScProject")

data_merged_2017_18 <- readRDS("data_merged_2017_18.rds")

set.seed(1)
data_merged_2017_18_sample_1000 <- data_merged_2017_18[sample(nrow(data_merged_2017_18), 1000, replace=FALSE),]

saveRDS(data_merged_2017_18_sample_1000, file="data_merged_2017_18_sample_1000.rds")
