library(tidyverse)

setwd("/rds/general/user/syl416/home/MScProject")

#read PM2.5 data
###change to non-sample when submitting as a job.
data_pm25 <- readRDS("data_merged_2017_20_date.rds")

#read province gridID data
setwd("/rds/general/user/syl416/home/MScProject/Hebei")
tile_gridIDs <- readRDS("hebei_tiles.rds")

#get province data from year dataset
province_data_pm25 <- data_pm25[data_pm25$GridID %in% unique(tile_gridIDs$GridID), ]

#test print statements
print("table(table(unique(tile_gridIDs$GridID)))")
print(table(table(unique(tile_gridIDs$GridID))))
print("")

print("dim(data_pm25)")
print(dim(data_pm25))
print("")

print("dim(province_data_pm25)")
print(dim(province_data_pm25))
print("")

#save as rds
saveRDS(province_data_pm25, "hebei_2017_20.rds")

##do this for each year then combine.


