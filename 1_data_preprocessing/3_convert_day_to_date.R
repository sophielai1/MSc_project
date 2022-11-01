library(tidyverse)
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")


# 2015-16: convert day to date --------------------------------------------
data_2015_16_add_date <- readRDS("2_data_merged_with_tiles_2015_16.rds")

#convert year and day to numeric
data_2015_16_add_date$year <- as.numeric(data_2015_16_add_date$year)
data_2015_16_add_date$day <- as.numeric(data_2015_16_add_date$day)

#convert the year 2015 and 2016 to dates
data_2015_16_add_date$date <- as.Date(ifelse(data_2015_16_add_date$year == 2015,
					     as.Date(data_2015_16_add_date$day, origin="2014-12-31", format="%Y-%m-%d"),
					     as.Date(data_2015_16_add_date$day, origin="2015-12-31", format="%Y-%m-%d")),
				      origin="1970-01-01", format="%Y-%m-%d")

saveRDS(data_2015_16_add_date, file="3_final_data_2015_16.rds")

# 2017-18: convert day to date --------------------------------------------
data_2017_18_add_date <- readRDS("2_data_merged_with_tiles_2017_18.rds")

#convert year and day to numeric
data_2017_18_add_date$year <- as.numeric(data_2017_18_add_date$year)
data_2017_18_add_date$day <- as.numeric(data_2017_18_add_date$day)

#convert the year 2017 and 2018 to dates
data_2017_18_add_date$date <- as.Date(ifelse(data_2017_18_add_date$year == 2017,
                                             as.Date(data_2015_16_add_date$day, origin="2016-12-31", format="%Y-%m-%d"),
                                             as.Date(data_2015_16_add_date$day, origin="2017-12-31", format="%Y-%m-%d")),
                                      origin="1970-01-01", format="%Y-%m-%d")

saveRDS(data_2017_18_add_date, file="3_final_data_2017_18.rds")

# 2019-20: convert day to date --------------------------------------------
data_2019_20_add_date <- readRDS("2_data_merged_with_tiles_2019_20.rds")

#convert year and day to numeric
data_2019_20_add_date$year <- as.numeric(data_2019_20_add_date$year)
data_2019_20_add_date$day <- as.numeric(data_2019_20_add_date$day)

#convert the year 2019 and 2020 to dates
data_2019_20_add_date$date <- as.Date(ifelse(data_2019_20_add_date$year == 2019,
                                             as.Date(data_2019_20_add_date$day, origin="2018-12-31", format="%Y-%m-%d"),
                                             as.Date(data_2019_20_add_date$day, origin="2019-12-31", format="%Y-%m-%d")),
                                      origin="1970-01-01", format="%Y-%m-%d")

saveRDS(data_2019_20_add_date, file="3_final_data_2019_20.rds")


