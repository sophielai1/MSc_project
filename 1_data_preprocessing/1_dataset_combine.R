library(tidyverse)

## combine 2 years at a time as file sizes are too large


# 2015: extract year and day from filename --------
# Example filename: China_PM25_1km_2015_001_096
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/2015")
new_file_list <- list()
list_of_files_in_folder <- list.files()
file_number <- 1
for (x in list_of_files_in_folder){
  temp <- read.csv(x)
  filename_vector <- strsplit(list_of_files_in_folder[file_number], split="_")
  temp$year <- filename_vector[[1]][4]
  temp$day <- filename_vector[[1]][5]
  empty_list[[x]] <- temp
  if (file_number <= length(list_of_files_in_folder)){
    file_number <- file_number + 1
  } else{
    break
  }
}

# combine 2015 csv files ----------------------------------------------
combine_csvfiles_2015 <- dplyr::bind_rows(new_file_list)
head(combine_csvfiles_2015)
tail(combine_csvfiles_2015)
saveRDS(combine_csvfiles_2015, file="data_combined_2015.rds")

# 2016: extract year and day from filename --------
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/2016")
new_file_list <- list()
list_of_files_in_folder <- list.files()
file_number <- 1
for (x in list_of_files_in_folder){
  temp <- read.csv(x)
  filename_vector <- strsplit(list_of_files_in_folder[file_number], split="_")
  temp$year <- filename_vector[[1]][4]
  temp$day <- filename_vector[[1]][5]
  empty_list[[x]] <- temp
  if (file_number <= length(list_of_files_in_folder)){
    file_number <- file_number + 1
  } else{
    break
  }
}

# combine 2016 csv files ----------------------------------------------
combine_csvfiles_2016 <- dplyr::bind_rows(new_file_list)
head(combine_csvfiles_2016)
tail(combine_csvfiles_2016)
saveRDS(combine_csvfiles_2016, file="data_combined_2016.rds")

# 2015-2016: combine 2015 and 2016 rds files -----------------------------------------
rdsfiles_2015_2016 <-
  c("data_combined_2015.rds",
    "data_combined_2016.rds")

data_combined_2015_2016 <- rdsfiles_2015_2016 %>%
  map_dfr(readRDS)

print("data combined 2015-2016:")
dim(data_combined_2015_2016)
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
saveRDS(data_combined_2015_2016, "data_combined_2015_16.rds")

# 2017: extract year and day from filename --------
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/2017")
new_file_list <- list()
list_of_files_in_folder <- list.files()
file_number <- 1
for (x in list_of_files_in_folder){
  temp <- read.csv(x)
  filename_vector <- strsplit(list_of_files_in_folder[file_number], split="_")
  temp$year <- filename_vector[[1]][4]
  temp$day <- filename_vector[[1]][5]
  empty_list[[x]] <- temp
  if (file_number <= length(list_of_files_in_folder)){
    file_number <- file_number + 1
  } else{
    break
  }
}

# combine 2017 csv files ----------------------------------------------
combine_csvfiles_2017 <- dplyr::bind_rows(new_file_list)
head(combine_csvfiles_2017)
tail(combine_csvfiles_2017)
saveRDS(combine_csvfiles_2017, file="data_combined_2017.rds")

# 2018: extract year and day from filename --------
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/2018")
new_file_list <- list()
list_of_files_in_folder <- list.files()
file_number <- 1
for (x in list_of_files_in_folder){
  temp <- read.csv(x)
  filename_vector <- strsplit(list_of_files_in_folder[file_number], split="_")
  temp$year <- filename_vector[[1]][4]
  temp$day <- filename_vector[[1]][5]
  empty_list[[x]] <- temp
  if (file_number <= length(list_of_files_in_folder)){
    file_number <- file_number + 1
  } else{
    break
  }
}

# combine 2018 csv files ----------------------------------------------
combine_csvfiles_2018 <- dplyr::bind_rows(new_file_list)
head(combine_csvfiles_2018)
tail(combine_csvfiles_2018)
saveRDS(combine_csvfiles_2018, file="data_combined_2018.rds")

# 2017-2018: combine 2017 and 2018 data ----------------------------------------------
rdsfiles_2017_2018 <-
  c("data_combined_2017.rds",
    "data_combined_2018.rds")

data_combined_2017_2018 <- rdsfiles_2017_2018 %>%
  map_dfr(readRDS)

print("data_combined 2017-2018:")
dim(data_combined_2017_2018)
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
saveRDS(data_combined_2017_2018, "data_combined_2017_18.rds")

# 2019: extract year and day from filename --------
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/2019")
new_file_list <- list()
list_of_files_in_folder <- list.files()
file_number <- 1
for (x in list_of_files_in_folder){
  temp <- read.csv(x)
  filename_vector <- strsplit(list_of_files_in_folder[file_number], split="_")
  temp$year <- filename_vector[[1]][4]
  temp$day <- filename_vector[[1]][5]
  empty_list[[x]] <- temp
  if (file_number <= length(list_of_files_in_folder)){
    file_number <- file_number + 1
  } else{
    break
  }
}

# combine 2019 csv files ----------------------------------------------
combine_csvfiles_2019 <- dplyr::bind_rows(new_file_list)
head(combine_csvfiles_2019)
tail(combine_csvfiles_2019)
saveRDS(combine_csvfiles_2019, file="data_combined_2019.rds")

# 2020: extract year and day from filename --------
setwd("/rds/general/user/syl416/home/MSc_project/Original_data/2020")
new_file_list <- list()
list_of_files_in_folder <- list.files()
file_number <- 1
for (x in list_of_files_in_folder){
  temp <- read.csv(x)
  filename_vector <- strsplit(list_of_files_in_folder[file_number], split="_")
  temp$year <- filename_vector[[1]][4]
  temp$day <- filename_vector[[1]][5]
  empty_list[[x]] <- temp
  if (file_number <= length(list_of_files_in_folder)){
    file_number <- file_number + 1
  } else{
    break
  }
}

# combine 2020 csv files ----------------------------------------------
combine_csvfiles_2020 <- dplyr::bind_rows(new_file_list)
head(combine_csvfiles_2020)
tail(combine_csvfiles_2020)
saveRDS(combine_csvfiles_2020, file="data_combined_2020.rds")

# 2019-2020: combine 2019 and 2020 data ----------------------------------------------
rdsfiles_2019_2020 <-
  c("data_combined_2019.rds",
    "data_combined_2020.rds")

data_combined_2019_2020 <- rdsfiles_2019_2020 %>%
  map_dfr(readRDS)

print("data_combined 2019-2020:")
dim(data_combined_2019_2020)
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
saveRDS(data_combined_2019_2020, "data_combined_2019_20.rds")




