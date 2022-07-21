library(tidyverse)

setwd("/rds/general/user/syl416/home/MScProject")

data_2015_16_add_date <- readRDS("data_merged_2015_16.rds")

#convert year and day to numeric
data_2015_16_add_date$year <- as.numeric(data_2015_16_add_date$year)
data_2015_16_add_date$day <- as.numeric(data_2015_16_add_date$day)

#convert the year 2015 and 2016 to dates
data_2015_16_add_date$date <- as.Date(ifelse(data_2015_16_add_date$year == 2015,
					     as.Date(data_2015_16_add_date$day, origin="2014-12-31", format="%Y-%m-%d"),
					     as.Date(data_2015_16_add_date$day, origin="2015-12-31", format="%Y-%m-%d")),
				      origin="1970-01-01", format="%Y-%m-%d")

saveRDS(data_2015_16_add_date, file="data_merged_2015_16_date.rds")




