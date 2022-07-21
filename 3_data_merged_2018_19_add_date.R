library(tidyverse)

setwd("/rds/general/user/syl416/home/MScProject")

data_2017_18_add_date <- readRDS("data_merged_2017_18.rds")

#convert year and day to numeric
data_2017_18_add_date$year <- as.numeric(data_2017_18_add_date$year)
data_2017_18_add_date$day <- as.numeric(data_2017_18_add_date$day)

#convert the year 2017 and 2018 to dates
data_2017_18_add_date$date <- as.Date(ifelse(data_2017_18_add_date$year == 2018,
                                             as.Date(data_2017_18_add_date$day, origin="2017-12-31", format="%Y-%m-%d"),
                                             as.Date(data_2017_18_add_date$day, origin="2018-12-31", format="%Y-%m-%d")),
                                      origin="1970-01-01", format="%Y-%m-%d")

saveRDS(data_2017_18_add_date, file="data_merged_2018_19_date.rds")

print(head(data_2017_18_add_date))
