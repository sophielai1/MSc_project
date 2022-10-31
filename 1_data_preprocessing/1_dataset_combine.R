library(tidyverse)
setwd("/rds/general/user/syl416/home/MScProject/Original_data")

## combine 2 years at a time as file sizes are too large


# combine 2015 and 2016 data ----------------------------------------------
# combine 2015 csv files
csvfiles_2015 <- list.files()
all_csvfiles_2015 <- lapply(csvfiles_2015, read.csv)
combine_csvfiles_2015 <- dplyr::bind_rows(all_csvfiles_2015)
saveRDS(combine_csvfiles_2015, file = "data_combined_2015.rds")
head(combine_csvfiles_2015)

# combine 2016 csv files
csvfiles_2016 <- list.files()
all_csvfiles_2016 <- lapply(csvfiles_2016, read.csv)
combine_csvfiles_2016 <- dplyr::bind_rows(all_csvfiles_2016)
saveRDS(combine_csvfiles_2016, file = "data_combined_2016.rds")
head(combine_csvfiles_2016)

# combine 2015 and 2016 rds files
rdsfiles_2015_2016 <-
  c("data_combined_2015.rds",
    "data_combined_2016.rds")

data_combined_2015_2016 <- rdsfiles_2015_2016 %>%
  map_dfr(readRDS)

print("data combined 2015-2016:")
dim(data_combined_2015_2016)
saveRDS(data_combined_2015_2016, "data_combined_2015_16.rds")


# combine 2017 and 2018 data ----------------------------------------------
# combine 2017 csv files
csvfiles_2017 <- list.files()
all_csvfiles_2017 <- lapply(csvfiles_2017, read.csv)
combine_csvfiles_2017 <- dplyr::bind_rows(all_csvfiles_2017)
saveRDS(combine_csvfiles_2017, file = "data_combined_2017.rds")
head(combine_csvfiles_2017)

# combine 2018 csv files
csvfiles_2018 <- list.files()
all_csvfiles_2018 <- lapply(csvfiles_2018, read.csv)
combine_csvfiles_2018 <- dplyr::bind_rows(all_csvfiles_2018)
saveRDS(combine_csvfiles_2018, file = "data_combined_2018.rds")
head(combine_csvfiles_2018)

# combine 2015 and 2016 rds files
rdsfiles_2017_2018 <-
  c("data_combined_2017.rds",
    "data_combined_2018.rds")

data_combined_2017_2018 <- rdsfiles_2017_2018 %>%
  map_dfr(readRDS)

print("data_combined 2017-2018:")
dim(data_combined_2017_2018)
saveRDS(data_combined_2017_2018, "data_combined_2017_18.rds")


# combine 2019 and 2020 data ----------------------------------------------
# combine 2019 csv files
csvfiles_2019 <- list.files()
all_csvfiles_2019 <- lapply(csvfiles_2019, read.csv)
combine_csvfiles_2019 <- dplyr::bind_rows(all_csvfiles_2019)
saveRDS(combine_csvfiles_2019, file = "data_combined_2019.rds")
head(combine_csvfiles_2019)

# combine 2020 csv files
csvfiles_2020 <- list.files()
all_csvfiles_2020 <- lapply(csvfiles_2020, read.csv)
combine_csvfiles_2020 <- dplyr::bind_rows(all_csvfiles_2020)
saveRDS(combine_csvfiles_2020, file = "data_combined_2020.rds")
head(combine_csvfiles_2020)

# combine 2019 and 2020 rds files
rdsfiles_2019_2020 <-
  c("data_combined_2019.rds",
    "data_combined_2020.rds")

data_combined_2019_2020 <- rdsfiles_2019_2020 %>%
  map_dfr(readRDS)

print("data_combined 2019-2020:")
dim(data_combined_2019_2020)
saveRDS(data_combined_2019_2020, "data_combined_2019_20.rds")




