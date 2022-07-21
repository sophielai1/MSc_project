library(tidyverse)
setwd("/rds/general/user/syl416/home/MScProject/Hebei")

hebei_tiles <- list.files(pattern="*.csv") %>%
  lapply(read_csv) %>%
  bind_rows

saveRDS(hebei_tiles, file="hebei_tiles.rds")
