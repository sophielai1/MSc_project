library(tidyverse)
library(sf)
sf::sf_use_s2(FALSE)
library(openair)


# split villages by date --------------------------------------------------
# 1. identify villages with the coal-to-electricity policy implemented and not implemented from the csv file.
# 2. split the villages by date according to the year the policy was implemented.



# DID test: 2017 ----------------------------------------------------------
# 22 villages with policy implemented in 2017
# 15 villages without policy implemented

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/changzhi")
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Xiaosong_subset.rds")
shanxi_2017_yes_village2 <- readRDS("shanxi_village_changzhi_high_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes_village1, shanxi_2017_yes_village2)

shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Gaohe_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Wu_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Wangtong_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Renjiazhuang_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Anseong_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Xinyi_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Haojiazhuang_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Yuanjiazhuang_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Haodian_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Nanzhuang_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Nam_Dong_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Dongjia_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Xijia_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Feng_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Sima_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Wang_Dongcun_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Xinzhuang_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Kanji_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
shanxi_2017_yes_village1 <- readRDS("shanxi_village_changzhi_Yitang_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/gaoping")
shanxi_2017_yes_village1 <- readRDS("shanxi_village_gaoping_shop_subset.rds")
shanxi_2017_yes <- rbind(shanxi_2017_yes, shanxi_2017_yes_village1)
dim(shanxi_2017_yes) #135904      7

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
saveRDS(shanxi_2017_yes, "shanxi_2017_yes_22villages.rds")



# DID test: 2018 ----------------------------------------------------------
# 4 villages with policy implemented in 2018
# 15 villages without policy implemented


setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/changzhi")
shanxi_2018_yes_village1 <- readRDS("shanxi_village_changzhi_caojiagou_subset.rds")
shanxi_2018_yes_village2 <- readRDS("shanxi_village_changzhi_Temple_subset.rds")
shanxi_2018_yes <- rbind(shanxi_2018_yes_village1, shanxi_2018_yes_village1)

shanxi_2018_yes_village1 <- readRDS("shanxi_village_changzhi_Dongcheng_subset.rds")
shanxi_2018_yes <- rbind(shanxi_2018_yes, shanxi_2018_yes_village1)
shanxi_2018_yes_village1 <- readRDS("shanxi_village_changzhi_Han_Chuan_subset.rds")
shanxi_2018_yes <- rbind(shanxi_2018_yes, shanxi_2018_yes_village1)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
saveRDS(shanxi_2018_yes, "shanxi_2018_yes_4villages.rds")



# DID test: 2019 ----------------------------------------------------------
# 22 villages with policy implemented in 2019
# 15 villages without policy implemented

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/changzhi")
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Juzhai_subset.rds")
shanxi_2019_yes_village2 <- readRDS("shanxi_village_changzhi_Nanhe_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes_village1, shanxi_2019_yes_village1)

shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Zhonghe_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Donghe_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Zhao_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Southern_Song_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Shuo_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Beicheng_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Upper_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Shizhuang_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_West_Hachimura_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Guandao_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Dongping_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Longshan_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Bayi_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Beixianquan_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Zhounan_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Hetou_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Xigu_County_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_Xiaohe_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)
shanxi_2019_yes_village1 <- readRDS("shanxi_village_changzhi_West_Pool_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/gaoping")
shanxi_2019_yes_village1 <- readRDS("shanxi_village_gaoping_Qinzhuang_subset.rds")
shanxi_2019_yes <- rbind(shanxi_2019_yes, shanxi_2019_yes_village1)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
saveRDS(shanxi_2019_yes, "shanxi_2019_yes_22villages.rds")



# DID test: 2020 ----------------------------------------------------------
# 4 villages with policy implemented in 2020
# 15 villages without policy implemented


setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/changzhi")
shanxi_2020_yes_village1 <- readRDS("shanxi_village_changzhi_Shitanyu_subset.rds")
shanxi_2020_yes_village2 <- readRDS("shanxi_village_changzhi_Yokogawa_subset.rds")
shanxi_2020_yes <- rbind(shanxi_2020_yes_village1, shanxi_2020_yes_village1)

shanxi_2020_yes_village1 <- readRDS("shanxi_village_changzhi_Xincheng_subset.rds")
shanxi_2020_yes <- rbind(shanxi_2020_yes, shanxi_2020_yes_village1)
shanxi_2020_yes_village1 <- readRDS("shanxi_village_changzhi_Liujia_subset.rds")
shanxi_2020_yes <- rbind(shanxi_2020_yes, shanxi_2020_yes_village1)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
saveRDS(shanxi_2020_yes, "shanxi_2020_yes_4villages.rds")











# Villages without policy ------------------------------------
# 15 villages without policy implemented



setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/changzhi")
shanxi_no_village1 <- readRDS("shanxi_village_changzhi_Sangzi_First_subset.rds")
shanxi_no_village2 <- readRDS("shanxi_village_changzhi_Yincheng_subset.rds")
shanxi_no <- rbind(shanxi_no_village1, shanxi_no_village2)

shanxi_no_village1 <- readRDS("shanxi_village_changzhi_Nancheng_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_changzhi_Bao_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_changzhi_Willow_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_changzhi_Jingfang_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_changzhi_Liling_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_changzhi_Shangqin_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_changzhi_Xishenjiazhuang_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_changzhi_Songbi_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/gaoping")
shanxi_no_village1 <- readRDS("shanxi_village_gaoping_South_Lee_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_gaoping_Fenghe_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_gaoping_Feng_Zhuang_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_gaoping_Nanwangzhuang_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)
shanxi_no_village1 <- readRDS("shanxi_village_gaoping_Wang_Henan_subset.rds")
shanxi_no <- rbind(shanxi_no, shanxi_no_village1)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
saveRDS(shanxi_no, "shanxi_no_15villages.rds")



# openair daily average ---------------------------------------------------
# use the openair function timeAverage to get the mean daily average of villages in each test.

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("shanxi_no_15villages.rds")
shanxi_data <- data.frame(shanxi_data)
shanxi_data <- shanxi_data[,c(1,2,3,4,5,6)]
head(shanxi_data)
shanxi_data_daily <- timeAverage(mydata=shanxi_data, avg.time="day",
                               start.date="2015-01-01", end.date="2020-12-31")
saveRDS(shanxi_data_daily, "daily_shanxi_no_15villages.rds")


setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("shanxi_2017_yes_22villages.rds")
shanxi_data <- data.frame(shanxi_data)
shanxi_data <- shanxi_data[,c(1,2,3,4,5,6)]
head(shanxi_data)
shanxi_data_daily <- timeAverage(mydata=shanxi_data, avg.time="day",
                                 start.date="2015-01-01", end.date="2020-12-31")
saveRDS(shanxi_data_daily, "daily_shanxi_2017_yes_22villages.rds")


setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("shanxi_2018_yes_4villages.rds")
shanxi_data <- data.frame(shanxi_data)
shanxi_data <- shanxi_data[,c(1,2,3,4,5,6)]
head(shanxi_data)
shanxi_data_daily <- timeAverage(mydata=shanxi_data, avg.time="day",
                                 start.date="2015-01-01", end.date="2020-12-31")
saveRDS(shanxi_data_daily, "daily_shanxi_2018_yes_4villages.rds")


setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("shanxi_2019_yes_22villages.rds")
shanxi_data <- data.frame(shanxi_data)
shanxi_data <- shanxi_data[,c(1,2,3,4,5,6)]
head(shanxi_data)
shanxi_data_daily <- timeAverage(mydata=shanxi_data, avg.time="day",
                                 start.date="2015-01-01", end.date="2020-12-31")
saveRDS(shanxi_data_daily, "daily_shanxi_2019_yes_22villages.rds")


setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("shanxi_2020_yes_4villages.rds")
shanxi_data <- data.frame(shanxi_data)
shanxi_data <- shanxi_data[,c(1,2,3,4,5,6)]
head(shanxi_data)
shanxi_data_daily <- timeAverage(mydata=shanxi_data, avg.time="day",
                                 start.date="2015-01-01", end.date="2020-12-31")
saveRDS(shanxi_data_daily, "daily_shanxi_2020_yes_4villages.rds")


# timesplit ---------------------------------------------------------------
# use the splitByDate function from openair to split PM2.5 concentrations from each group of villages by the date of policy implementation.

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("daily_shanxi_2017_yes_22villages.rds")
shanxi_data_split <- splitByDate(mydata=shanxi_data,
                                   dates="1/1/2017",
                                   labels=c("before 01 Jan 2017",
                                            "after 01 Jan 2017"))
saveRDS(shanxi_data_split, "split_daily_shanxi_2017_yes_22villages.rds")

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("daily_shanxi_2018_yes_4villages.rds")
shanxi_data_split <- splitByDate(mydata=shanxi_data,
                                 dates="1/1/2018",
                                 labels=c("before 01 Jan 2018",
                                          "after 01 Jan 2018"))
saveRDS(shanxi_data_split, "split_daily_shanxi_2018_yes_4villages.rds")

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("daily_shanxi_2019_yes_22villages.rds")
shanxi_data_split <- splitByDate(mydata=shanxi_data,
                                 dates="1/1/2019",
                                 labels=c("before 01 Jan 2019",
                                          "after 01 Jan 2019"))
saveRDS(shanxi_data_split, "split_daily_shanxi_2019_yes_22villages.rds")

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("daily_shanxi_2020_yes_4villages.rds")
shanxi_data_split <- splitByDate(mydata=shanxi_data,
                                 dates="1/1/2020",
                                 labels=c("before 01 Jan 2020",
                                          "after 01 Jan 2020"))
saveRDS(shanxi_data_split, "split_daily_shanxi_2020_yes_4villages.rds")

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("daily_shanxi_no_15villages.rds")
shanxi_data_split <- splitByDate(mydata=shanxi_data,
                                 dates="1/1/2017",
                                 labels=c("before 01 Jan 2017",
                                          "after 01 Jan 2017"))
saveRDS(shanxi_data_split, "split_2017_daily_shanxi_no_15villages.rds")

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("daily_shanxi_no_15villages.rds")
shanxi_data_split <- splitByDate(mydata=shanxi_data,
                                 dates="1/1/2018",
                                 labels=c("before 01 Jan 2018",
                                          "after 01 Jan 2018"))
saveRDS(shanxi_data_split, "split_2018_daily_shanxi_no_15villages.rds")

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("daily_shanxi_no_15villages.rds")
shanxi_data_split <- splitByDate(mydata=shanxi_data,
                                 dates="1/1/2019",
                                 labels=c("before 01 Jan 2019",
                                          "after 01 Jan 2019"))
saveRDS(shanxi_data_split, "split_2019_daily_shanxi_no_15villages.rds")

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("daily_shanxi_no_15villages.rds")
shanxi_data_split <- splitByDate(mydata=shanxi_data,
                                 dates="1/1/2020",
                                 labels=c("before 01 Jan 2020",
                                          "after 01 Jan 2020"))
saveRDS(shanxi_data_split, "split_2020_daily_shanxi_no_15villages.rds")



# DID test ----------------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("split_daily_shanxi_2017_yes_22villages.rds")
shanxi_data$after <- ifelse(shanxi_data$split.by == "after 01 Jan 2017", 1, 0)
shanxi_data$policy <- rep(1,times=nrow(shanxi_data))

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data_no <- readRDS("split_2017_daily_shanxi_no_15villages.rds")
shanxi_data_no$after <- ifelse(shanxi_data_no$split.by == "after 01 Jan 2017", 1, 0)
shanxi_data_no$policy <- rep(0,times=nrow(shanxi_data_no))

shanxi_data_2017 <- rbind(shanxi_data, shanxi_data_no)
saveRDS(shanxi_data_2017, "full_2017.rds")

shanxi_data_2017 <- readRDS("full_2017.rds")
didreg <- lm(PM2.5 ~ policy*after, data = shanxi_data_2017)
summary(didreg)
confint(didreg)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("split_daily_shanxi_2018_yes_4villages.rds")
shanxi_data$after <- ifelse(shanxi_data$split.by == "after 01 Jan 2018", 1, 0)
table(shanxi_data$after)
shanxi_data$policy <- rep(1,times=nrow(shanxi_data))

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data_no <- readRDS("split_2018_daily_shanxi_no_15villages.rds")
shanxi_data_no$after <- ifelse(shanxi_data_no$split.by == "after 01 Jan 2018", 1, 0)
table(shanxi_data_no$after)
shanxi_data_no$policy <- rep(0,times=nrow(shanxi_data_no))

shanxi_data_2018 <- rbind(shanxi_data, shanxi_data_no)
saveRDS(shanxi_data_2018, "full_2018.rds")

shanxi_data_2018 <- readRDS("full_2018.rds")
didreg <- lm(PM2.5 ~ policy*after, data = shanxi_data_2018)
summary(didreg)
confint(didreg)


setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("split_daily_shanxi_2019_yes_22villages.rds")
shanxi_data$after <- ifelse(shanxi_data$split.by == "after 01 Jan 2019", 1, 0)
table(shanxi_data$after)
shanxi_data$policy <- rep(1,times=nrow(shanxi_data))

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data_no <- readRDS("split_2019_daily_shanxi_no_15villages.rds")
shanxi_data_no$after <- ifelse(shanxi_data_no$split.by == "after 01 Jan 2019", 1, 0)
table(shanxi_data_no$after)
shanxi_data_no$policy <- rep(0,times=nrow(shanxi_data_no))

shanxi_data_2019 <- rbind(shanxi_data, shanxi_data_no)
saveRDS(shanxi_data_2019, "full_2019.rds")

shanxi_data_2019 <- readRDS("full_2019.rds")
didreg <- lm(PM2.5 ~ policy*after, data = shanxi_data_2019)
summary(didreg)
confint(didreg)





setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data <- readRDS("split_daily_shanxi_2020_yes_4villages.rds")
shanxi_data$after <- ifelse(shanxi_data$split.by == "after 01 Jan 2020", 1, 0)
table(shanxi_data$after)
shanxi_data$policy <- rep(1,times=nrow(shanxi_data))

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data_no <- readRDS("split_2020_daily_shanxi_no_15villages.rds")
shanxi_data_no$after <- ifelse(shanxi_data_no$split.by == "after 01 Jan 2020", 1, 0)
table(shanxi_data_no$after)
shanxi_data_no$policy <- rep(0,times=nrow(shanxi_data_no))

shanxi_data_2020 <- rbind(shanxi_data, shanxi_data_no)
saveRDS(shanxi_data_2020, "full_2020.rds")

shanxi_data_2020 <- readRDS("full_2020.rds")
didreg <- lm(PM2.5 ~ policy*after, data = shanxi_data_2020)
summary(didreg)
confint(didreg)








# before and after plot ---------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data_yes_2017 <- readRDS("split_daily_shanxi_2017_yes_22villages.rds")
head(shanxi_data_yes_2017)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/plots")
y_expression <- expression(PM[2.5] ~ (ug/m^3))
set.seed(1)
timeVar_data <- timeVariation(mydata=shanxi_data_yes_2017,
                                  pollutant=c("PM2.5"),
                                  group="split.by",
                                  #main="",
                                  ylab=y_expression,
                              ylim=c(10,130),
                                  ref.y = list(h = c(15,75), lty = c(5,5)))
pdf("timeVariation_daily_shanxi_before_after.pdf", width=9)
plot(timeVar_data, subset="month")
dev.off()




setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data_yes_2017 <- readRDS("split_daily_shanxi_2018_yes_4villages.rds")
head(shanxi_data_yes_2017)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/plots")
y_expression <- expression(PM[2.5] ~ (ug/m^3))
set.seed(1)
timeVar_data <- timeVariation(mydata=shanxi_data_yes_2017,
                              pollutant=c("PM2.5"),
                              group="split.by",
                              #main="",
                              ylab=y_expression,
                              ylim=c(10,130),
                              ref.y = list(h = c(15,75), lty = c(5,5)))
pdf("timeVariation_daily_shanxi_before_after_2018.pdf", width=9)
plot(timeVar_data, subset="month")
dev.off()




setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data_yes_2017 <- readRDS("split_daily_shanxi_2019_yes_22villages.rds")
head(shanxi_data_yes_2017)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/plots")
y_expression <- expression(PM[2.5] ~ (ug/m^3))
set.seed(1)
timeVar_data <- timeVariation(mydata=shanxi_data_yes_2017,
                              pollutant=c("PM2.5"),
                              group="split.by",
                              #main="",
                              ylab=y_expression,
                              ylim=c(10,130),
                              ref.y = list(h = c(15,75), lty = c(5,5)))
pdf("timeVariation_daily_shanxi_before_after_2019.pdf", width=9)
plot(timeVar_data, subset="month")
dev.off()




setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
shanxi_data_yes_2017 <- readRDS("split_daily_shanxi_2020_yes_4villages.rds")
head(shanxi_data_yes_2017)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/plots")
y_expression <- expression(PM[2.5] ~ (ug/m^3))
set.seed(1)
timeVar_data <- timeVariation(mydata=shanxi_data_yes_2017,
                              pollutant=c("PM2.5"),
                              group="split.by",
                              #main="",
                              ylab=y_expression,
                              ylim=c(10,130),
                              ref.y = list(h = c(15,75), lty = c(5,5)))
pdf("timeVariation_daily_shanxi_before_after_2020.pdf", width=9)
plot(timeVar_data, subset="month")
dev.off()



# DID test assumptions -------------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
full_2017 <- readRDS("full_2017.rds")
head(full_2017)
full_2017$policy <- as.character(full_2017$policy)
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi/DID_assumptions")
pdf("full_2017_scatterplot.pdf")
ggplot(full_2017, aes(after, PM2.5, colour = policy)) +
  geom_jitter() +
  theme_minimal()
dev.off()
pdf("full_2017_parallel_trends.pdf")
ggplot(full_2017, aes(year, PM2.5, colour=policy)) +
  stat_summary(geom = 'line') +
  geom_vline(xintercept =  2019-01-01) +
  theme_minimal()
dev.off()


setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
full_2018 <- readRDS("full_2018.rds")
full_2018$policy <- as.character(full_2018$policy)
pdf("full_2018_scatterplot.pdf")
ggplot(full_2018, aes(after, PM2.5, colour = policy)) +
  geom_jitter() +
  theme_minimal()
dev.off()
pdf("full_2018_parallel_trends.pdf")
ggplot(full_2018, aes(year, PM2.5, colour=policy)) +
  stat_summary(geom = 'line') +
  geom_vline(xintercept =  2020-01-01) +
  theme_minimal()
dev.off()


setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
full_2019 <- readRDS("full_2019.rds")
full_2019$policy <- as.character(full_2019$policy)
pdf("full_2019_scatterplot.pdf")
ggplot(full_2019, aes(after, PM2.5, colour = policy)) +
  geom_jitter() +
  theme_minimal()
dev.off()
pdf("full_2019_parallel_trends.pdf")
ggplot(full_2019, aes(year, PM2.5, colour=policy)) +
  stat_summary(geom = 'line') +
  geom_vline(xintercept =  2021-01-01) +
  theme_minimal()
dev.off()


setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level/shanxi")
full_2020 <- readRDS("full_2020.rds")
full_2020$policy <- as.character(full_2020$policy)
pdf("full_2020_scatterplot.pdf")
ggplot(full_2020, aes(after, PM2.5, colour = policy)) +
  geom_jitter() +
  theme_minimal()
dev.off()
pdf("full_2020_parallel_trends.pdf")
ggplot(full_2020, aes(year, PM2.5, colour=policy)) +
  stat_summary(geom = 'line') +
  geom_vline(xintercept =  2022-01-01) +
  theme_minimal()
dev.off()

