library(tidyverse)

setwd("/rds/general/user/syl416/home/MScProject")

data_2019_20_add_date <- readRDS("data_merged_2019_20.rds")

#convert year and day to numeric
data_2019_20_add_date$year <- as.numeric(data_2019_20_add_date$year)
data_2019_20_add_date$day <- as.numeric(data_2019_20_add_date$day)

#convert the year 2019 and 2020 to dates
data_2019_20_add_date$date <- as.Date(ifelse(data_2019_20_add_date$year == 2017,
                                             as.Date(data_2019_20_add_date$day, origin="2016-12-31", format="%Y-%m-%d"),
                                             as.Date(data_2019_20_add_date$day, origin="2019-12-31", format="%Y-%m-%d")),
                                      origin="1970-01-01", format="%Y-%m-%d")

saveRDS(data_2019_20_add_date, file="data_merged_2017_20_date.rds")

print(head(data_2019_20_add_date))
