library(sf)
sf::sf_use_s2(FALSE)
library(tidyverse)

# liaoning --------------------------------------------------------
#combine villages from both counties
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/liaoning")

rdsfiles <-
  c("liaoning_zhangwu_county_partial.rds",
    "liaoning_fengcheng_county_partial.rds")

counties_combined <- rdsfiles %>%
  map_dfr(readRDS)
dim(counties_combined) #6240624       7

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/liaoning")
saveRDS(counties_combined, file="liaoning_province_partial.rds")

# hebei --------------------------------------------------------
#combine villages from both counties
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/hebei")

rdsfiles <-
  c("hebei_anguo_county_partial.rds",
    "hebei_luquan_county_partial.rds")

counties_combined <- rdsfiles %>%
  map_dfr(readRDS)
dim(counties_combined) #1043392       7

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/hebei")
saveRDS(counties_combined, file="hebei_province_partial.rds")
head(counties_combined)

# ningxia --------------------------------------------------------
#combine villages from both counties
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/ningxia")

rdsfiles <-
  c("ningxia_pingluo_county_partial.rds",
    "ningxia_qingtongxia_county_partial.rds")

counties_combined <- rdsfiles %>%
  map_dfr(readRDS)
dim(counties_combined) #2978928       7

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/ningxia")
saveRDS(counties_combined, file="ningxia_province_partial.rds")
head(counties_combined)

# shanxi --------------------------------------------------------
#combine villages from both counties
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/shanxi")

rdsfiles <-
  c("shanxi_changzhi_county_partial.rds",
    "shanxi_gaoping_county_partial.rds")

counties_combined <- rdsfiles %>%
  map_dfr(readRDS)
dim(counties_combined) #925024      7

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/shanxi")
saveRDS(counties_combined, file="shanxi_province_partial.rds")
head(counties_combined)

# shaanxi --------------------------------------------------------
#combine villages from both counties
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/shaanxi")

rdsfiles <-
  c("shaanxi_chenggu_county_partial.rds",
    "shaanxi_qishan_county_partial.rds")

counties_combined <- rdsfiles %>%
  map_dfr(readRDS)
dim(counties_combined) #1174912       7

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/shaanxi")
saveRDS(counties_combined, file="shaanxi_province_partial.rds")
head(counties_combined)


# combined county dataset: daily aggregation --------------------------------
#liaoning
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/liaoning")
liaoning <- readRDS("liaoning_province_partial.rds")
liaoning_df <- data.frame(liaoning)
print("liaoning week")
dim(liaoning_df)
liaoning_df <- liaoning_df %>%
  mutate(Longitude = unlist(map(liaoning_df$geometry,1)),
         Latitude = unlist(map(liaoning_df$geometry,2)))
liaoning_df <- subset(liaoning_df, select = -geometry)
start <- Sys.time()
liaoning_df_wk <- timeAverage(mydata=liaoning_df, avg.time="week",
                               start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start #Time difference of 30.09442 mins
head(liaoning_df_wk)
dim(liaoning_df_wk)
print("liaoning day")
liaoning_df_day <- timeAverage(mydata=liaoning_df, avg.time="day",
                              start.date="2015-01-01", end.date="2020-12-31")
dim(liaoning_df_day)

#hebei
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/hebei")
hebei <- readRDS("hebei_province_partial.rds")
hebei_df <- data.frame(hebei)
print("hebei week")
dim(hebei_df)
hebei_df <- hebei_df %>%
  mutate(Longitude = unlist(map(hebei_df$geometry,1)),
         Latitude = unlist(map(hebei_df$geometry,2)))
hebei_df <- subset(hebei_df, select = -geometry)
start <- Sys.time()
hebei_df_wk <- timeAverage(mydata=hebei_df, avg.time="week",
                            start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(hebei_df_wk)
dim(hebei_df_wk)
print("hebei day")
hebei_df_day <- timeAverage(mydata=hebei_df, avg.time="day",
                               start.date="2015-01-01", end.date="2020-12-31")
dim(hebei_df_day)

#ningxia
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/ningxia")
ningxia <- readRDS("ningxia_province_partial.rds")
ningxia_df <- data.frame(ningxia)
print("ningxia week")
dim(ningxia_df)
ningxia_df <- ningxia_df %>%
  mutate(Longitude = unlist(map(ningxia_df$geometry,1)),
         Latitude = unlist(map(ningxia_df$geometry,2)))
ningxia_df <- subset(ningxia_df, select = -geometry)
start <- Sys.time()
ningxia_df_wk <- timeAverage(mydata=ningxia_df, avg.time="week",
                              start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(ningxia_df_wk)
dim(ningxia_df_wk)
print("ningxia day")
ningxia_df_day <- timeAverage(mydata=ningxia_df, avg.time="day",
                            start.date="2015-01-01", end.date="2020-12-31")
dim(ningxia_df_day)

#shanxi
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/shanxi")
shanxi <- readRDS("shanxi_province_partial.rds")
shanxi_df <- data.frame(shanxi)
print("shanxi week")
dim(shanxi_df)
shanxi_df <- shanxi_df %>%
  mutate(Longitude = unlist(map(shanxi_df$geometry,1)),
         Latitude = unlist(map(shanxi_df$geometry,2)))
shanxi_df <- subset(shanxi_df, select = -geometry)
start <- Sys.time()
shanxi_df_wk <- timeAverage(mydata=shanxi_df, avg.time="week",
                             start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(shanxi_df_wk)
dim(shanxi_df_wk)
print("shanxi day")
shanxi_df_day <- timeAverage(mydata=shanxi_df, avg.time="day",
                              start.date="2015-01-01", end.date="2020-12-31")
dim(shanxi_df_day)

#shaanxi
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/province_level/partial/shaanxi")
shaanxi <- readRDS("shaanxi_province_partial.rds")
shaanxi_df <- data.frame(shaanxi)
print("shaanxi week")
dim(shaanxi_df)
shaanxi_df <- shaanxi_df %>%
  mutate(Longitude = unlist(map(shaanxi_df$geometry,1)),
         Latitude = unlist(map(shaanxi_df$geometry,2)))
shaanxi_df <- subset(shaanxi_df, select = -geometry)
start <- Sys.time()
shaanxi_df_wk <- timeAverage(mydata=shaanxi_df, avg.time="week",
                              start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(shaanxi_df_wk)
dim(shaanxi_df_wk)
print("shaanxi day")
shaanxi_df_day <- timeAverage(mydata=shaanxi_df, avg.time="day",
                             start.date="2015-01-01", end.date="2020-12-31")
dim(shaanxi_df_day)


#merge the datasets (just date and PM2.5)
liaoning_df_wk_subset <- liaoning_df_wk[, c(1,3)]
colnames(liaoning_df_wk_subset)[2] <- "Liaoning"
liaoning_df_day_subset <- liaoning_df_day[, c(1,3)]
colnames(liaoning_df_day_subset)[2] <- "Liaoning"

hebei_df_wk_subset <- hebei_df_wk[, c(1,3)]
colnames(hebei_df_wk_subset)[2] <- "Hebei"
hebei_df_day_subset <- hebei_df_day[, c(1,3)]
colnames(hebei_df_day_subset)[2] <- "Hebei"

ningxia_df_wk_subset <- ningxia_df_wk[, c(1,3)]
colnames(ningxia_df_wk_subset)[2] <- "Ningxia"
ningxia_df_day_subset <- ningxia_df_day[, c(1,3)]
colnames(ningxia_df_day_subset)[2] <- "Ningxia"

shanxi_df_wk_subset <- shanxi_df_wk[, c(1,3)]
colnames(shanxi_df_wk_subset)[2] <- "Shanxi"
shanxi_df_day_subset <- shanxi_df_day[, c(1,3)]
colnames(shanxi_df_day_subset)[2] <- "Shanxi"

shaanxi_df_wk_subset <- shaanxi_df_wk[, c(1,3)]
colnames(shaanxi_df_wk_subset)[2] <- "Shaanxi"
shaanxi_df_day_subset <- shaanxi_df_day[, c(1,3)]
colnames(shaanxi_df_day_subset)[2] <- "Shaanxi"


#merge the datasets into one and save: week
liaoning_hebei <- merge(x=liaoning_df_wk_subset, y=hebei_df_wk_subset,
                  by="date", all=TRUE)
liaoning_hebei_ningxia <- merge(x=liaoning_hebei, y=ningxia_df_wk_subset,
                         by="date", all=TRUE)
liaoning_hebei_ningxia_shanxi <- merge(x=liaoning_hebei_ningxia, y=shanxi_df_wk_subset,
                         by="date", all=TRUE)
liaoning_hebei_ningxia_shanxi_shaanxi <- merge(x=liaoning_hebei_ningxia_shanxi, y=shaanxi_df_wk_subset,
                                 by="date", all=TRUE)

head(liaoning_hebei_ningxia_shanxi_shaanxi)
dim(liaoning_hebei_ningxia_shanxi_shaanxi)

setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/province_level")
saveRDS(liaoning_hebei_ningxia_shanxi_shaanxi, file="all_provinces_weekly.rds")


#merge the datasets into one and save: day
day_liaoning_hebei <- merge(x=liaoning_df_day_subset, y=hebei_df_day_subset,
                        by="date", all=TRUE)
day_liaoning_hebei_ningxia <- merge(x=day_liaoning_hebei, y=ningxia_df_day_subset,
                                by="date", all=TRUE)
day_liaoning_hebei_ningxia_shanxi <- merge(x=day_liaoning_hebei_ningxia, y=shanxi_df_day_subset,
                                       by="date", all=TRUE)
day_liaoning_hebei_ningxia_shanxi_shaanxi <- merge(x=day_liaoning_hebei_ningxia_shanxi, y=shaanxi_df_day_subset,
                                               by="date", all=TRUE)

head(day_liaoning_hebei_ningxia_shanxi_shaanxi)
dim(day_liaoning_hebei_ningxia_shanxi_shaanxi)

setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/province_level")
saveRDS(day_liaoning_hebei_ningxia_shanxi_shaanxi, file="all_provinces_daily.rds")











