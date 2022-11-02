library(sf)
sf::sf_use_s2(FALSE)
library(tidyverse)
library(openair)


# liaoning zhangwu --------------------------------------------------------
#combine 60 villages
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/liaoning/zhangwu")
liaoning_zhangwu_county_partial <- list.files(pattern="*.rds") %>%
  lapply(readRDS) %>%
  bind_rows
dim(liaoning_zhangwu_county_partial) #2531760       7

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/liaoning")
saveRDS(liaoning_zhangwu_county_partial, file="liaoning_zhangwu_county_partial.rds")
# liaoning fengcheng ------------------------------------------------------
#combine 59 villages
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/liaoning/fengcheng")
liaoning_fengcheng_county_partial <- list.files(pattern="*.rds") %>%
  lapply(readRDS) %>%
  bind_rows
dim(liaoning_fengcheng_county_partial) #3708864       7

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/liaoning")
saveRDS(liaoning_fengcheng_county_partial, file="liaoning_fengcheng_county_partial.rds")

# hebei anguo --------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/hebei/anguo")
hebei_anguo_county_partial <- list.files(pattern="*.rds") %>%
  lapply(readRDS) %>%
  bind_rows
dim(hebei_anguo_county_partial) #427440      7
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/hebei")
saveRDS(hebei_anguo_county_partial, file="hebei_anguo_county_partial.rds")
# hebei luquan --------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/hebei/luquan")
hebei_luquan_county_partial <- list.files(pattern="*.rds") %>%
  lapply(readRDS) %>%
  bind_rows
dim(hebei_luquan_county_partial) #615952      7
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/hebei")
saveRDS(hebei_luquan_county_partial, file="hebei_luquan_county_partial.rds")

# ningxia pingluo --------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/ningxia/pingluo")
ningxia_pingluo_county_partial <- list.files(pattern="*.rds") %>%
  lapply(readRDS) %>%
  bind_rows
dim(ningxia_pingluo_county_partial) #1889504       7
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/ningxia")
saveRDS(ningxia_pingluo_county_partial, file="ningxia_pingluo_county_partial.rds")
# ningxia qingtongxia --------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/ningxia/qingtongxia")
ningxia_qingtongxia_county_partial <- list.files(pattern="*.rds") %>%
  lapply(readRDS) %>%
  bind_rows
dim(ningxia_qingtongxia_county_partial) #1089424       7
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/ningxia")
saveRDS(ningxia_qingtongxia_county_partial, file="ningxia_qingtongxia_county_partial.rds")

# shanxi changzhi --------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/changzhi")
shanxi_changzhi_county_partial <- list.files(pattern="*.rds") %>%
  lapply(readRDS) %>%
  bind_rows
dim(shanxi_changzhi_county_partial) #414288      7
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/shanxi")
saveRDS(shanxi_changzhi_county_partial, file="shanxi_changzhi_county_partial.rds")
# shanxi gaoping --------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/gaoping")
shanxi_gaoping_county_partial <- list.files(pattern="*.rds") %>%
  lapply(readRDS) %>%
  bind_rows
dim(shanxi_gaoping_county_partial) #510736      7
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/shanxi")
saveRDS(shanxi_gaoping_county_partial, file="shanxi_gaoping_county_partial.rds")

# shaanxi chenggu --------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shaanxi/chenggu")
shaanxi_chenggu_county_partial <- list.files(pattern="*.rds") %>%
  lapply(readRDS) %>%
  bind_rows
dim(shaanxi_chenggu_county_partial) #477856      7
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/shaanxi")
saveRDS(shaanxi_chenggu_county_partial, file="shaanxi_chenggu_county_partial.rds")
# shaanxi qishan --------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shaanxi/qishan")
shaanxi_qishan_county_partial <- list.files(pattern="*.rds") %>%
  lapply(readRDS) %>%
  bind_rows
dim(shaanxi_qishan_county_partial) #697056      7
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/shaanxi")
saveRDS(shaanxi_qishan_county_partial, file="shaanxi_qishan_county_partial.rds")


# combined county dataset: daily aggregation  ---------------------------------

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/liaoning")
liaoning1 <- readRDS("liaoning_fengcheng_county_partial.rds")
liaoning_df1 <- data.frame(liaoning1)
print("liaoning fengcheng")
dim(liaoning_df1)
liaoning_df1 <- liaoning_df1 %>%
  mutate(Longitude = unlist(map(liaoning_df1$geometry,1)),
         Latitude = unlist(map(liaoning_df1$geometry,2)))
liaoning_df1 <- subset(liaoning_df1, select = -geometry)
start <- Sys.time()
liaoning_df1_wk <- timeAverage(mydata=liaoning_df1, avg.time="day",
                               start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start #Time difference of 30.09442 mins
head(liaoning_df1_wk)
dim(liaoning_df1_wk)

liaoning2 <- readRDS("liaoning_zhangwu_county_partial.rds")
liaoning_df2 <- data.frame(liaoning2)
print("liaoning zhangwu")
dim(liaoning_df2)
liaoning_df2 <- liaoning_df2 %>%
  mutate(Longitude = unlist(map(liaoning_df2$geometry,1)),
         Latitude = unlist(map(liaoning_df2$geometry,2)))
liaoning_df2 <- subset(liaoning_df2, select = -geometry)
start <- Sys.time()
liaoning_df2_wk <- timeAverage(mydata=liaoning_df2, avg.time="day",
                               start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(liaoning_df2_wk)
dim(liaoning_df2_wk)




setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/hebei")
hebei1 <- readRDS("hebei_anguo_county_partial.rds")
hebei_df1 <- data.frame(hebei1)
print("hebei anguo")
dim(hebei_df1)
hebei_df1 <- hebei_df1 %>%
  mutate(Longitude = unlist(map(hebei_df1$geometry,1)),
         Latitude = unlist(map(hebei_df1$geometry,2)))
hebei_df1 <- subset(hebei_df1, select = -geometry)
start <- Sys.time()
hebei_df1_wk <- timeAverage(mydata=hebei_df1, avg.time="day",
                            start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(hebei_df1_wk)
dim(hebei_df1_wk)

hebei2 <- readRDS("hebei_luquan_county_partial.rds")
hebei_df2 <- data.frame(hebei2)
print("hebei luquan")
dim(hebei_df2)
hebei_df2 <- hebei_df2 %>%
  mutate(Longitude = unlist(map(hebei_df2$geometry,1)),
         Latitude = unlist(map(hebei_df2$geometry,2)))
hebei_df2 <- subset(hebei_df2, select = -geometry)
start <- Sys.time()
hebei_df2_wk <- timeAverage(mydata=hebei_df2, avg.time="day",
                            start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(hebei_df2_wk)
dim(hebei_df2_wk)



setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/ningxia")
ningxia1 <- readRDS("ningxia_pingluo_county_partial.rds")
ningxia_df1 <- data.frame(ningxia1)
print("ningxia pingluo")
dim(ningxia_df1)
ningxia_df1 <- ningxia_df1 %>%
  mutate(Longitude = unlist(map(ningxia_df1$geometry,1)),
         Latitude = unlist(map(ningxia_df1$geometry,2)))
ningxia_df1 <- subset(ningxia_df1, select = -geometry)
start <- Sys.time()
ningxia_df1_wk <- timeAverage(mydata=ningxia_df1, avg.time="day",
                              start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(ningxia_df1_wk)
dim(ningxia_df1_wk)

ningxia2 <- readRDS("ningxia_qingtongxia_county_partial.rds")
ningxia_df2 <- data.frame(ningxia2)
print("ningxia qingtongxia")
dim(ningxia_df2)
ningxia_df2 <- ningxia_df2 %>%
  mutate(Longitude = unlist(map(ningxia_df2$geometry,1)),
         Latitude = unlist(map(ningxia_df2$geometry,2)))
ningxia_df2 <- subset(ningxia_df2, select = -geometry)
start <- Sys.time()
ningxia_df2_wk <- timeAverage(mydata=ningxia_df2, avg.time="day",
                              start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(ningxia_df2_wk)
dim(ningxia_df2_wk)



setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/shanxi")
shanxi1 <- readRDS("shanxi_changzhi_county_partial.rds")
shanxi_df1 <- data.frame(shanxi1)
print("shanxi changzhi")
dim(shanxi_df1)
shanxi_df1 <- shanxi_df1 %>%
  mutate(Longitude = unlist(map(shanxi_df1$geometry,1)),
         Latitude = unlist(map(shanxi_df1$geometry,2)))
shanxi_df1 <- subset(shanxi_df1, select = -geometry)
start <- Sys.time()
shanxi_df1_wk <- timeAverage(mydata=shanxi_df1, avg.time="day",
                             start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(shanxi_df1_wk)
dim(shanxi_df1_wk)

shanxi2 <- readRDS("shanxi_gaoping_county_partial.rds")
shanxi_df2 <- data.frame(shanxi2)
print("shanxi gaoping")
dim(shanxi_df2)
shanxi_df2 <- shanxi_df2 %>%
  mutate(Longitude = unlist(map(shanxi_df2$geometry,1)),
         Latitude = unlist(map(shanxi_df2$geometry,2)))
shanxi_df2 <- subset(shanxi_df2, select = -geometry)
start <- Sys.time()
shanxi_df2_wk <- timeAverage(mydata=shanxi_df2, avg.time="day",
                             start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(shanxi_df2_wk)
dim(shanxi_df2_wk)



setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/shaanxi")
shaanxi1 <- readRDS("shaanxi_chenggu_county_partial.rds")
shaanxi_df1 <- data.frame(shaanxi1)
print("shaanxi chenggu")
dim(shaanxi_df1)
shaanxi_df1 <- shaanxi_df1 %>%
  mutate(Longitude = unlist(map(shaanxi_df1$geometry,1)),
         Latitude = unlist(map(shaanxi_df1$geometry,2)))
shaanxi_df1 <- subset(shaanxi_df1, select = -geometry)
start <- Sys.time()
shaanxi_df1_wk <- timeAverage(mydata=shaanxi_df1, avg.time="day",
                              start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(shaanxi_df1_wk)
dim(shaanxi_df1_wk)

shaanxi2 <- readRDS("shaanxi_qishan_county_partial.rds")
shaanxi_df2 <- data.frame(shaanxi2)
print("shaanxi qishan")
dim(shaanxi_df2)
shaanxi_df2 <- shaanxi_df2 %>%
  mutate(Longitude = unlist(map(shaanxi_df2$geometry,1)),
         Latitude = unlist(map(shaanxi_df2$geometry,2)))
shaanxi_df2 <- subset(shaanxi_df2, select = -geometry)
start <- Sys.time()
shaanxi_df2_wk <- timeAverage(mydata=shaanxi_df2, avg.time="day",
                              start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(shaanxi_df2_wk)
dim(shaanxi_df2_wk)

#merge the datasets (just date and PM2.5)
liaoning_df1_wk_subset <- liaoning_df1_wk[, c(1,3)]
colnames(liaoning_df1_wk_subset)[2] <- "Fengcheng"
liaoning_df2_wk_subset <- liaoning_df2_wk[, c(1,3)]
colnames(liaoning_df2_wk_subset)[2] <- "Zhangwu"

hebei_df1_wk_subset <- hebei_df1_wk[, c(1,3)]
colnames(hebei_df1_wk_subset)[2] <- "Anguo"
hebei_df2_wk_subset <- hebei_df2_wk[, c(1,3)]
colnames(hebei_df2_wk_subset)[2] <- "Luquan"

ningxia_df1_wk_subset <- ningxia_df1_wk[, c(1,3)]
colnames(ningxia_df1_wk_subset)[2] <- "Pingluo"
ningxia_df2_wk_subset <- ningxia_df2_wk[, c(1,3)]
colnames(ningxia_df2_wk_subset)[2] <- "Qingtongxia"

shanxi_df1_wk_subset <- shanxi_df1_wk[, c(1,3)]
colnames(shanxi_df1_wk_subset)[2] <- "Changzhi"
shanxi_df2_wk_subset <- shanxi_df2_wk[, c(1,3)]
colnames(shanxi_df2_wk_subset)[2] <- "Gaoping"

shaanxi_df1_wk_subset <- shaanxi_df1_wk[, c(1,3)]
colnames(shaanxi_df1_wk_subset)[2] <- "Chenggu"
shaanxi_df2_wk_subset <- shaanxi_df2_wk[, c(1,3)]
colnames(shaanxi_df2_wk_subset)[2] <- "Qishan"


#merge the datasets into one and save
liaoning <- merge(x=liaoning_df1_wk_subset, y=liaoning_df2_wk_subset,
                  by="date", all=TRUE)
liaoning_hebei1 <- merge(x=liaoning, y=hebei_df1_wk_subset,
                         by="date", all=TRUE)
liaoning_hebei2 <- merge(x=liaoning_hebei1, y=hebei_df2_wk_subset,
                         by="date", all=TRUE)
liaoning_hebei_ningxia1 <- merge(x=liaoning_hebei2, y=ningxia_df1_wk_subset,
                                 by="date", all=TRUE)
liaoning_hebei_ningxia2 <- merge(x=liaoning_hebei_ningxia1, y=ningxia_df2_wk_subset,
                                 by="date", all=TRUE)
liaoning_hebei_ningxia_shanxi1 <- merge(x=liaoning_hebei_ningxia2, y=shanxi_df1_wk_subset,
                                        by="date", all=TRUE)
liaoning_hebei_ningxia_shanxi2 <- merge(x=liaoning_hebei_ningxia_shanxi1, y=shanxi_df2_wk_subset,
                                        by="date", all=TRUE)
liaoning_hebei_ningxia_shanxi_shaanxi1 <- merge(x=liaoning_hebei_ningxia_shanxi2, y=shaanxi_df1_wk_subset,
                                                by="date", all=TRUE)
liaoning_hebei_ningxia_shanxi_shaanxi2 <- merge(x=liaoning_hebei_ningxia_shanxi_shaanxi1, y=shaanxi_df2_wk_subset,
                                                by="date", all=TRUE)

head(liaoning_hebei_ningxia_shanxi_shaanxi2)
dim(liaoning_hebei_ningxia_shanxi_shaanxi2)

setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/county_level")
saveRDS(liaoning_hebei_ningxia_shanxi_shaanxi2, file="all_counties_daily.rds")

# combined county dataset: weekly aggregation  ---------------------------------

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/liaoning")
liaoning1 <- readRDS("liaoning_fengcheng_county_partial.rds")
liaoning_df1 <- data.frame(liaoning1)
print("liaoning fengcheng")
dim(liaoning_df1)
liaoning_df1 <- liaoning_df1 %>%
  mutate(Longitude = unlist(map(liaoning_df1$geometry,1)),
         Latitude = unlist(map(liaoning_df1$geometry,2)))
liaoning_df1 <- subset(liaoning_df1, select = -geometry)
start <- Sys.time()
liaoning_df1_wk <- timeAverage(mydata=liaoning_df1, avg.time="week",
                               start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start #Time difference of 30.09442 mins
head(liaoning_df1_wk)
dim(liaoning_df1_wk)

liaoning2 <- readRDS("liaoning_zhangwu_county_partial.rds")
liaoning_df2 <- data.frame(liaoning2)
print("liaoning zhangwu")
dim(liaoning_df2)
liaoning_df2 <- liaoning_df2 %>%
  mutate(Longitude = unlist(map(liaoning_df2$geometry,1)),
         Latitude = unlist(map(liaoning_df2$geometry,2)))
liaoning_df2 <- subset(liaoning_df2, select = -geometry)
start <- Sys.time()
liaoning_df2_wk <- timeAverage(mydata=liaoning_df2, avg.time="week",
                               start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(liaoning_df2_wk)
dim(liaoning_df2_wk)




setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/hebei")
hebei1 <- readRDS("hebei_anguo_county_partial.rds")
hebei_df1 <- data.frame(hebei1)
print("hebei anguo")
dim(hebei_df1)
hebei_df1 <- hebei_df1 %>%
  mutate(Longitude = unlist(map(hebei_df1$geometry,1)),
         Latitude = unlist(map(hebei_df1$geometry,2)))
hebei_df1 <- subset(hebei_df1, select = -geometry)
start <- Sys.time()
hebei_df1_wk <- timeAverage(mydata=hebei_df1, avg.time="week",
                            start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(hebei_df1_wk)
dim(hebei_df1_wk)

hebei2 <- readRDS("hebei_luquan_county_partial.rds")
hebei_df2 <- data.frame(hebei2)
print("hebei luquan")
dim(hebei_df2)
hebei_df2 <- hebei_df2 %>%
  mutate(Longitude = unlist(map(hebei_df2$geometry,1)),
         Latitude = unlist(map(hebei_df2$geometry,2)))
hebei_df2 <- subset(hebei_df2, select = -geometry)
start <- Sys.time()
hebei_df2_wk <- timeAverage(mydata=hebei_df2, avg.time="week",
                            start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(hebei_df2_wk)
dim(hebei_df2_wk)



setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/ningxia")
ningxia1 <- readRDS("ningxia_pingluo_county_partial.rds")
ningxia_df1 <- data.frame(ningxia1)
print("ningxia pingluo")
dim(ningxia_df1)
ningxia_df1 <- ningxia_df1 %>%
  mutate(Longitude = unlist(map(ningxia_df1$geometry,1)),
         Latitude = unlist(map(ningxia_df1$geometry,2)))
ningxia_df1 <- subset(ningxia_df1, select = -geometry)
start <- Sys.time()
ningxia_df1_wk <- timeAverage(mydata=ningxia_df1, avg.time="week",
                              start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(ningxia_df1_wk)
dim(ningxia_df1_wk)

ningxia2 <- readRDS("ningxia_qingtongxia_county_partial.rds")
ningxia_df2 <- data.frame(ningxia2)
print("ningxia qingtongxia")
dim(ningxia_df2)
ningxia_df2 <- ningxia_df2 %>%
  mutate(Longitude = unlist(map(ningxia_df2$geometry,1)),
         Latitude = unlist(map(ningxia_df2$geometry,2)))
ningxia_df2 <- subset(ningxia_df2, select = -geometry)
start <- Sys.time()
ningxia_df2_wk <- timeAverage(mydata=ningxia_df2, avg.time="week",
                              start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(ningxia_df2_wk)
dim(ningxia_df2_wk)



setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/shanxi")
shanxi1 <- readRDS("shanxi_changzhi_county_partial.rds")
shanxi_df1 <- data.frame(shanxi1)
print("shanxi changzhi")
dim(shanxi_df1)
shanxi_df1 <- shanxi_df1 %>%
  mutate(Longitude = unlist(map(shanxi_df1$geometry,1)),
         Latitude = unlist(map(shanxi_df1$geometry,2)))
shanxi_df1 <- subset(shanxi_df1, select = -geometry)
start <- Sys.time()
shanxi_df1_wk <- timeAverage(mydata=shanxi_df1, avg.time="week",
                             start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(shanxi_df1_wk)
dim(shanxi_df1_wk)

shanxi2 <- readRDS("shanxi_gaoping_county_partial.rds")
shanxi_df2 <- data.frame(shanxi2)
print("shanxi gaoping")
dim(shanxi_df2)
shanxi_df2 <- shanxi_df2 %>%
  mutate(Longitude = unlist(map(shanxi_df2$geometry,1)),
         Latitude = unlist(map(shanxi_df2$geometry,2)))
shanxi_df2 <- subset(shanxi_df2, select = -geometry)
start <- Sys.time()
shanxi_df2_wk <- timeAverage(mydata=shanxi_df2, avg.time="week",
                             start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(shanxi_df2_wk)
dim(shanxi_df2_wk)



setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level/partial/shaanxi")
shaanxi1 <- readRDS("shaanxi_chenggu_county_partial.rds")
shaanxi_df1 <- data.frame(shaanxi1)
print("shaanxi chenggu")
dim(shaanxi_df1)
shaanxi_df1 <- shaanxi_df1 %>%
  mutate(Longitude = unlist(map(shaanxi_df1$geometry,1)),
         Latitude = unlist(map(shaanxi_df1$geometry,2)))
shaanxi_df1 <- subset(shaanxi_df1, select = -geometry)
start <- Sys.time()
shaanxi_df1_wk <- timeAverage(mydata=shaanxi_df1, avg.time="week",
                              start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(shaanxi_df1_wk)
dim(shaanxi_df1_wk)

shaanxi2 <- readRDS("shaanxi_qishan_county_partial.rds")
shaanxi_df2 <- data.frame(shaanxi2)
print("shaanxi qishan")
dim(shaanxi_df2)
shaanxi_df2 <- shaanxi_df2 %>%
  mutate(Longitude = unlist(map(shaanxi_df2$geometry,1)),
         Latitude = unlist(map(shaanxi_df2$geometry,2)))
shaanxi_df2 <- subset(shaanxi_df2, select = -geometry)
start <- Sys.time()
shaanxi_df2_wk <- timeAverage(mydata=shaanxi_df2, avg.time="week",
                              start.date="2015-01-01", end.date="2020-12-31")
end <- Sys.time()
end-start
head(shaanxi_df2_wk)
dim(shaanxi_df2_wk)

#merge the datasets (just date and PM2.5)
liaoning_df1_wk_subset <- liaoning_df1_wk[, c(1,3)]
colnames(liaoning_df1_wk_subset)[2] <- "Fengcheng"
liaoning_df2_wk_subset <- liaoning_df2_wk[, c(1,3)]
colnames(liaoning_df2_wk_subset)[2] <- "Zhangwu"

hebei_df1_wk_subset <- hebei_df1_wk[, c(1,3)]
colnames(hebei_df1_wk_subset)[2] <- "Anguo"
hebei_df2_wk_subset <- hebei_df2_wk[, c(1,3)]
colnames(hebei_df2_wk_subset)[2] <- "Luquan"

ningxia_df1_wk_subset <- ningxia_df1_wk[, c(1,3)]
colnames(ningxia_df1_wk_subset)[2] <- "Pingluo"
ningxia_df2_wk_subset <- ningxia_df2_wk[, c(1,3)]
colnames(ningxia_df2_wk_subset)[2] <- "Qingtongxia"

shanxi_df1_wk_subset <- shanxi_df1_wk[, c(1,3)]
colnames(shanxi_df1_wk_subset)[2] <- "Changzhi"
shanxi_df2_wk_subset <- shanxi_df2_wk[, c(1,3)]
colnames(shanxi_df2_wk_subset)[2] <- "Gaoping"

shaanxi_df1_wk_subset <- shaanxi_df1_wk[, c(1,3)]
colnames(shaanxi_df1_wk_subset)[2] <- "Chenggu"
shaanxi_df2_wk_subset <- shaanxi_df2_wk[, c(1,3)]
colnames(shaanxi_df2_wk_subset)[2] <- "Qishan"


#merge the datasets into one and save
liaoning <- merge(x=liaoning_df1_wk_subset, y=liaoning_df2_wk_subset,
                  by="date", all=TRUE)
liaoning_hebei1 <- merge(x=liaoning, y=hebei_df1_wk_subset,
                         by="date", all=TRUE)
liaoning_hebei2 <- merge(x=liaoning_hebei1, y=hebei_df2_wk_subset,
                         by="date", all=TRUE)
liaoning_hebei_ningxia1 <- merge(x=liaoning_hebei2, y=ningxia_df1_wk_subset,
                                 by="date", all=TRUE)
liaoning_hebei_ningxia2 <- merge(x=liaoning_hebei_ningxia1, y=ningxia_df2_wk_subset,
                                 by="date", all=TRUE)
liaoning_hebei_ningxia_shanxi1 <- merge(x=liaoning_hebei_ningxia2, y=shanxi_df1_wk_subset,
                                        by="date", all=TRUE)
liaoning_hebei_ningxia_shanxi2 <- merge(x=liaoning_hebei_ningxia_shanxi1, y=shanxi_df2_wk_subset,
                                        by="date", all=TRUE)
liaoning_hebei_ningxia_shanxi_shaanxi1 <- merge(x=liaoning_hebei_ningxia_shanxi2, y=shaanxi_df1_wk_subset,
                                                by="date", all=TRUE)
liaoning_hebei_ningxia_shanxi_shaanxi2 <- merge(x=liaoning_hebei_ningxia_shanxi_shaanxi1, y=shaanxi_df2_wk_subset,
                                                by="date", all=TRUE)

head(liaoning_hebei_ningxia_shanxi_shaanxi2)
dim(liaoning_hebei_ningxia_shanxi_shaanxi2)

setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/county_level")
saveRDS(liaoning_hebei_ningxia_shanxi_shaanxi2, file="all_counties_weekly.rds")





