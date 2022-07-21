library(tidyverse)
setwd("/rds/general/user/syl416/home/MScProject")
rdsfiles <-
  c("final_data_2019.rds",
    "final_data_2020.rds")

data_combined <- rdsfiles %>%
  map_dfr(readRDS)

print("data_combined 2019-2020:")
dim(data_combined)
saveRDS(data_combined, "data_combined_2019_20.rds")