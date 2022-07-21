library(tidyverse)
setwd("/rds/general/user/syl416/home/MScProject/Hebei")
rdsfiles <-
  c("hebei_2015_16.rds",
    "hebei_2018_19.rds",
    "hebei_2017_20.rds")

data_combined <- rdsfiles %>%
  map_dfr(readRDS)

print("hebei data combined dimensions:")
print(dim(data_combined))
print("")

print("head")
print(head(data_combined))

saveRDS(data_combined, "dataset_hebei.rds")