library(tidyverse)

setwd("/rds/general/user/syl416/home/MScProject/Data")
tiles <- readRDS("tiles_all.rds")

setwd("/rds/general/user/syl416/home/MScProject")
data_combined <- readRDS("data_combined_2019_20.rds")

data_merged <- merge(data_combined, tiles, all.x=TRUE)

print("data_merged 2019-2020:")
dim(data_merged)
saveRDS(data_merged, "data_merged_2019_20.rds")