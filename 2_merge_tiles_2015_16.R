library(tidyverse)

setwd("/rds/general/user/syl416/home/MScProject/Data")
tiles <- readRDS("tiles_all.rds")

setwd("/rds/general/user/syl416/home/MScProject")
data_combined <- readRDS("data_combined_2015_16.rds")

data_merged <- merge(data_combined, tiles, all.x=TRUE)

print("data_merged 2015-2016:")
dim(data_merged)
saveRDS(data_merged, "data_merged_2015_16.rds")