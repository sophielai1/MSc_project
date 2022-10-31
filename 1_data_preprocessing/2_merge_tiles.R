library(tidyverse)

setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
tiles <- readRDS("tiles_all.rds")


# 2015-16 -----------------------------------------------------------------
data_combined_2015_16 <- readRDS("data_combined_2015_16.rds")

data_merged_2015_16 <- merge(data_combined_2015_16, tiles, all.x=TRUE)

print("data merged 2015-2016:")
dim(data_merged_2015_16)
saveRDS(data_merged_2015_16, "data_merged_with_tiles_2015_16.rds")

# 2017-18 -----------------------------------------------------------------
data_combined_2017_18 <- readRDS("data_combined_2017_18.rds")

data_merged_2017_18 <- merge(data_combined_2017_18, tiles, all.x=TRUE)

print("data merged 2017-2018:")
dim(data_merged_2017_18)
saveRDS(data_merged_2017_18, "data_merged_with_tiles_2017_18.rds")

# 2019-20 -----------------------------------------------------------------
data_combined_2019_20 <- readRDS("data_combined_2019_20.rds")

data_merged_2019_20 <- merge(data_combined_2019_20, tiles, all.x=TRUE)

print("data merged 2019-2020:")
dim(data_merged_2019_20)
saveRDS(data_merged_2019_20, "data_merged_with_tiles_2019_20.rds")



