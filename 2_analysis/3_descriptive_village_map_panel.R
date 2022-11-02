library(sf)
sf::sf_use_s2(FALSE)
library(dplyr)
#install.packages("paletteer")
library(paletteer)
#install.packages("ggthemes")
library(ggthemes)
library(broom)
library(rgdal)


# Create village-level datasets per county --------------------------------
# 1. Combine village-level PM2.5 datasets for each county into 1 dataframe and aggregate by taking the mean concentration per village per day.
# 2. Merge with relevant shapefile so the polygon for each village is available.
# 3. Create a map plot showing the villages in each county day by day.


# liaoning zhangwu --------------------------------------------------------
#load csv
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv <- village_csv[village_csv$province=="Liaoning"&village_csv$county=="Zhangwu",]
village_csv <- village_csv[order(village_csv$name),]
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("liaoning_zhangwu_village.shp")
shp <- st_transform(shp, 4326)
#make sure villages are listed in alphabetical order in the folder
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/liaoning/zhangwu")
liaoning_zhangwu_village_list <- list.files(pattern="*.rds")
count <- 1
full_county_village_liaoning_zhangwu <- data.frame()
for(village in liaoning_zhangwu_village_list){
  print(village)
  village_rds <- readRDS(village)
  village_rds <- data.frame(village_rds)
  village_grouped <- village_rds %>% group_by(date) %>% summarise(mean_PM2_5 = mean(PM2.5))
  village_grouped$chinese_name <- village_csv[count, 4] #it does work for empty villages too
  print(head(village_grouped))
  count <- count + 1
  ##append to full county village empty dataframe
  full_county_village_liaoning_zhangwu <- rbind(full_county_village_liaoning_zhangwu, village_grouped)
  print(dim(full_county_village_liaoning_zhangwu))
  }

#save grouped dataframe
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/liaoning/zhangwu/plot")
saveRDS(full_county_village_liaoning_zhangwu, file="full_county_village_liaoning_zhangwu.rds")

##merge with shapefile and change to sf object
full_county_village_liaoning_zhangwu_merged <- left_join(full_county_village_liaoning_zhangwu, shp, by=c("chinese_name" = "XZQMC"))
full_county_village_liaoning_zhangwu_merged_sf <- sf::st_as_sf(full_county_village_liaoning_zhangwu_merged, sf_column_name="geometry", crs = 4326)

##save the merged shapefile
sf::st_write(full_county_village_liaoning_zhangwu_merged_sf, "full_county_village_liaoning_zhangwu_merged_sf.shp",
             layer_options = "ENCODING=UTF-8", append=FALSE)

#plot
full_zhangwu_villages_sf <- st_transform(full_county_village_liaoning_zhangwu_merged_sf, 4326)
head(full_zhangwu_villages_sf)
summary(full_zhangwu_villages_sf$m_PM2_5)

#categorise PM2.5
colour_scheme_orange <- c("#FFF7BC", #yellow orange
                          "#FEE391",
                          "#FEC44F",
                          "#FE9929",
                          "#EC7014",
                          "#CC4C02",
                          "#993404")
full_zhangwu_villages_sf$m_PM2_5 <- cut(full_zhangwu_villages_sf$m_PM2_5,
                                        breaks=c(0, 15, 30, 45, 
                                                 75, 100, 150, Inf),
                                        labels=c('0-15', '15.1-30', '30.1-45',
                                                 '45.1-75', '75.1-100', 
                                                 '100.1-150', '>150'))
head(full_zhangwu_villages_sf)

#load the whole county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("liaoning_zhangwu_village.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/plots")
#ggplot
pdf("liaoning_zhangwu_village_panel.pdf", width=12, height=5)

full_zhangwu_villages_sf %>%
  filter(date >= as.Date("2015-12-01") & date <= as.Date("2015-12-07")) %>%
  ggplot() +
  geom_sf(data=shp, color="grey65", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "grey65", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (ug/m³)") +
  labs(title = 'Zhangwu, Liaoning') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  facet_grid(. ~ date)

dev.off()


# liaoning fengcheng ------------------------------------------------------
#load csv
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv <- village_csv[village_csv$province=="Liaoning"&village_csv$county=="Fengcheng",]
village_csv <- village_csv[order(village_csv$name),]
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("liaoning_fengcheng_village1.shp")
shp <- st_transform(shp, 4326)
#make sure villages are listed in alphabetical order in the folder
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/liaoning/fengcheng")
liaoning_zhangwu_village_list <- list.files(pattern="*.rds")
count <- 1
full_county_village_liaoning_zhangwu <- data.frame()
for(village in liaoning_zhangwu_village_list){
  print(village)
  village_rds <- readRDS(village)
  village_rds <- data.frame(village_rds)
  village_grouped <- village_rds %>% group_by(date) %>% summarise(mean_PM2_5 = mean(PM2.5))
  village_grouped$chinese_name <- village_csv[count, 4] #it does work for empty villages too
  print(head(village_grouped))
  count <- count + 1
  ##append to full county village empty dataframe
  full_county_village_liaoning_zhangwu <- rbind(full_county_village_liaoning_zhangwu, village_grouped)
  print(dim(full_county_village_liaoning_zhangwu))
}

#save grouped dataframe
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/liaoning/fengcheng/plot")
saveRDS(full_county_village_liaoning_zhangwu, file="full_county_village_liaoning_fengcheng.rds")

##merge with shapefile and change to sf object
full_county_village_liaoning_zhangwu_merged <- left_join(full_county_village_liaoning_zhangwu, shp, by=c("chinese_name" = "XZQMC"))
full_county_village_liaoning_zhangwu_merged_sf <- sf::st_as_sf(full_county_village_liaoning_zhangwu_merged, sf_column_name="geometry", crs = 4326)

##save the merged shapefile
sf::st_write(full_county_village_liaoning_zhangwu_merged_sf, "full_county_village_liaoning_fengcheng_merged_sf.shp",
             layer_options = "ENCODING=UTF-8", append=FALSE)

#plot
full_zhangwu_villages_sf <- st_transform(full_county_village_liaoning_zhangwu_merged_sf, 4326)
head(full_zhangwu_villages_sf)
summary(full_zhangwu_villages_sf$m_PM2_5)

#categorise PM2.5
colour_scheme_orange <- c("#FFF7BC", #yellow orange
                          "#FEE391",
                          "#FEC44F",
                          "#FE9929",
                          "#EC7014",
                          "#CC4C02",
                          "#993404")
full_zhangwu_villages_sf$m_PM2_5 <- cut(full_zhangwu_villages_sf$m_PM2_5,
                                        breaks=c(0, 15, 30, 45, 
                                                 75, 100, 150, Inf),
                                        labels=c('0-15', '15.1-30', '30.1-45',
                                                 '45.1-75', '75.1-100', 
                                                 '100.1-150', '>150'))
head(full_zhangwu_villages_sf)

#load the whole county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("liaoning_fengcheng_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/plots")
#ggplot
pdf("liaoning_fengcheng_village_panel.pdf", width=12, height=5)

full_zhangwu_villages_sf %>%
  filter(date >= as.Date("2015-12-01") & date <= as.Date("2015-12-07")) %>%
  ggplot() +
  geom_sf(data=shp, color="grey65", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "grey65", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (ug/m³)") +
  labs(title = 'Fengcheng, Liaoning') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  facet_grid(. ~ date)

dev.off()

# hebei anguo ------------------------------------------------------
#load csv
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv <- village_csv[village_csv$province=="Hebei"&village_csv$county=="Anguo",]
village_csv <- village_csv[order(village_csv$name),]
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("hebei_anguo_village1.shp")
shp <- st_transform(shp, 4326)
#make sure villages are listed in alphabetical order in the folder
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/hebei/anguo")
liaoning_zhangwu_village_list <- list.files(pattern="*.rds")
count <- 1
full_county_village_liaoning_zhangwu <- data.frame()
for(village in liaoning_zhangwu_village_list){
  print(village)
  village_rds <- readRDS(village)
  village_rds <- data.frame(village_rds)
  village_grouped <- village_rds %>% group_by(date) %>% summarise(mean_PM2_5 = mean(PM2.5))
  village_grouped$chinese_name <- village_csv[count, 4] #it does work for empty villages too
  print(head(village_grouped))
  count <- count + 1
  ##append to full county village empty dataframe
  full_county_village_liaoning_zhangwu <- rbind(full_county_village_liaoning_zhangwu, village_grouped)
  print(dim(full_county_village_liaoning_zhangwu))
}

#save grouped dataframe
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/hebei/anguo/plot")
saveRDS(full_county_village_liaoning_zhangwu, file="full_county_village_hebei_anguo.rds")

##merge with shapefile and change to sf object
full_county_village_liaoning_zhangwu_merged <- left_join(full_county_village_liaoning_zhangwu, shp, by=c("chinese_name" = "XZQMC"))
full_county_village_liaoning_zhangwu_merged_sf <- sf::st_as_sf(full_county_village_liaoning_zhangwu_merged, sf_column_name="geometry", crs = 4326)

##save the merged shapefile
sf::st_write(full_county_village_liaoning_zhangwu_merged_sf, "full_county_village_hebei_anguo_merged_sf.shp", 
             layer_options = "ENCODING=UTF-8", append=FALSE)

#plot
full_zhangwu_villages_sf <- st_transform(full_county_village_liaoning_zhangwu_merged_sf, 4326)
head(full_zhangwu_villages_sf)
summary(full_zhangwu_villages_sf$m_PM2_5)

#categorise PM2.5
colour_scheme_orange <- c("#FFF7BC", #yellow orange
                          "#FEE391",
                          "#FEC44F",
                          "#FE9929",
                          "#EC7014",
                          "#CC4C02",
                          "#993404")
full_zhangwu_villages_sf$m_PM2_5 <- cut(full_zhangwu_villages_sf$m_PM2_5,
                                        breaks=c(0, 15, 30, 45, 
                                                 75, 100, 150, Inf),
                                        labels=c('0-15', '15.1-30', '30.1-45',
                                                 '45.1-75', '75.1-100', 
                                                 '100.1-150', '>150'))
head(full_zhangwu_villages_sf)

#load the whole county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("hebei_anguo_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/plots")
#ggplot
pdf("hebei_anguo_village_panel.pdf", width=12, height=5)

full_zhangwu_villages_sf %>%
  filter(date >= as.Date("2015-12-01") & date <= as.Date("2015-12-07")) %>%
  ggplot() +
  geom_sf(data=shp, color="grey65", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "grey65", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (ug/m³)") +
  labs(title = 'Anguo, Hebei') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  facet_grid(. ~ date)

dev.off()

# hebei luquan ------------------------------------------------------
#load csv
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv <- village_csv[village_csv$province=="Hebei"&village_csv$county=="Luquan",]
village_csv <- village_csv[order(village_csv$name),]
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("hebei_luquan_village.shp")
shp <- st_transform(shp, 4326)
#make sure villages are listed in alphabetical order in the folder
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/hebei/luquan")
liaoning_zhangwu_village_list <- list.files(pattern="*.rds")
count <- 1
full_county_village_liaoning_zhangwu <- data.frame()
for(village in liaoning_zhangwu_village_list){
  print(village)
  village_rds <- readRDS(village)
  village_rds <- data.frame(village_rds)
  village_grouped <- village_rds %>% group_by(date) %>% summarise(mean_PM2_5 = mean(PM2.5))
  village_grouped$chinese_name <- village_csv[count, 4] #it does work for empty villages too
  print(head(village_grouped))
  count <- count + 1
  ##append to full county village empty dataframe
  full_county_village_liaoning_zhangwu <- rbind(full_county_village_liaoning_zhangwu, village_grouped)
  print(dim(full_county_village_liaoning_zhangwu))
}

#save grouped dataframe
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/hebei/luquan/plot")
saveRDS(full_county_village_liaoning_zhangwu, file="full_county_village_hebei_luquan.rds")

##merge with shapefile and change to sf object
full_county_village_liaoning_zhangwu_merged <- left_join(full_county_village_liaoning_zhangwu, shp, by=c("chinese_name" = "XZQMC"))
full_county_village_liaoning_zhangwu_merged_sf <- sf::st_as_sf(full_county_village_liaoning_zhangwu_merged, sf_column_name="geometry", crs = 4326)

##save the merged shapefile
sf::st_write(full_county_village_liaoning_zhangwu_merged_sf, "full_county_village_hebei_luquan_merged_sf.shp", 
             layer_options = "ENCODING=UTF-8", append=FALSE)

#plot
full_zhangwu_villages_sf <- st_transform(full_county_village_liaoning_zhangwu_merged_sf, 4326)

#categorise PM2.5
colour_scheme_orange <- c("#FFF7BC", #yellow orange
                          "#FEE391",
                          "#FEC44F",
                          "#FE9929",
                          "#EC7014",
                          "#CC4C02",
                          "#993404")
full_zhangwu_villages_sf$m_PM2_5 <- cut(full_zhangwu_villages_sf$m_PM2_5,
                                        breaks=c(0, 15, 30, 45, 
                                                 75, 100, 150, Inf),
                                        labels=c('0-15', '15.1-30', '30.1-45',
                                                 '45.1-75', '75.1-100', 
                                                 '100.1-150', '>150'))

#load the whole county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("hebei_luquan_village.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/plots")
#ggplot
pdf("hebei_luquan_village_panel.pdf", width=12, height=5)

full_zhangwu_villages_sf %>%
  filter(date >= as.Date("2015-12-01") & date <= as.Date("2015-12-07")) %>%
  ggplot() +
  geom_sf(data=shp, color="grey65", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "grey65", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (ug/m³)") +
  labs(title = 'Luquan, Hebei') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  facet_grid(. ~ date)

dev.off()


# ningxia pingluo ------------------------------------------------------
#load csv
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv <- village_csv[village_csv$province=="Ningxia"&village_csv$county=="Pingluo",]
village_csv <- village_csv[order(village_csv$name),]
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("ningxia_pingluo_village1.shp")
shp <- st_transform(shp, 4326)
#make sure villages are listed in alphabetical order in the folder
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/ningxia/pingluo")
liaoning_zhangwu_village_list <- list.files(pattern="*.rds")
count <- 1
full_county_village_liaoning_zhangwu <- data.frame()
for(village in liaoning_zhangwu_village_list){
  print(village)
  village_rds <- readRDS(village)
  village_rds <- data.frame(village_rds)
  #replace PM2.5 NA with 0
  village_rds$PM2.5[is.na(village_rds$PM2.5)] = 0
  village_grouped <- village_rds %>% group_by(date) %>% summarise(mean_PM2_5 = mean(PM2.5))
  village_grouped$chinese_name <- village_csv[count, 4] #it does work for empty villages too
  print(head(village_grouped))
  count <- count + 1
  ##append to full county village empty dataframe
  full_county_village_liaoning_zhangwu <- rbind(full_county_village_liaoning_zhangwu, village_grouped)
  print(dim(full_county_village_liaoning_zhangwu))
}

#save grouped dataframe
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/ningxia/pingluo/plot")
saveRDS(full_county_village_liaoning_zhangwu, file="full_county_village_ningxia_pingluo.rds")

##merge with shapefile and change to sf object
full_county_village_liaoning_zhangwu_merged <- left_join(full_county_village_liaoning_zhangwu, shp, by=c("chinese_name" = "XZQMC"))
full_county_village_liaoning_zhangwu_merged_sf <- sf::st_as_sf(full_county_village_liaoning_zhangwu_merged, sf_column_name="geometry", crs = 4326)

##save the merged shapefile
sf::st_write(full_county_village_liaoning_zhangwu_merged_sf, "full_county_village_ningxia_pingluo_merged_sf.shp", 
             layer_options = "ENCODING=UTF-8", append=FALSE)

#plot
full_zhangwu_villages_sf <- st_transform(full_county_village_liaoning_zhangwu_merged_sf, 4326)

#categorise PM2.5
colour_scheme_orange <- c("#FFF7BC", #yellow orange
                          "#FEE391",
                          "#FEC44F",
                          "#FE9929",
                          "#EC7014",
                          "#CC4C02",
                          "#993404")
full_zhangwu_villages_sf$m_PM2_5 <- cut(full_zhangwu_villages_sf$m_PM2_5,
                                        breaks=c(0, 15, 30, 45, 
                                                 75, 100, 150, Inf),
                                        labels=c('0-15', '15.1-30', '30.1-45',
                                                 '45.1-75', '75.1-100', 
                                                 '100.1-150', '>150'))

#load the whole county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("ningxia_pingluo_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/plots")
#ggplot
pdf("ningxia_pingluo_village_panel.pdf", width=12, height=5)

full_zhangwu_villages_sf %>%
  filter(date >= as.Date("2015-12-01") & date <= as.Date("2015-12-07")) %>%
  ggplot() +
  geom_sf(data=shp, color="grey65", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "grey65", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (ug/m³)") +
  labs(title = 'Pingluo, Ningxia') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  coord_sf(xlim = c(106.1, 107), ylim = c(38.6, 39.2)) +
  facet_grid(. ~ date)

dev.off()

# ningxia qingtongxia ------------------------------------------------------
#load csv
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv <- village_csv[village_csv$province=="Ningxia"&village_csv$county=="Qingtongxia",]
village_csv <- village_csv[order(village_csv$name),]
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("ningxia_qingtongxia_village1.shp")
shp <- st_transform(shp, 4326)
#make sure villages are listed in alphabetical order in the folder
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/ningxia/qingtongxia")
liaoning_zhangwu_village_list <- list.files(pattern="*.rds")
count <- 1
full_county_village_liaoning_zhangwu <- data.frame()
for(village in liaoning_zhangwu_village_list){
  print(village)
  village_rds <- readRDS(village)
  village_rds <- data.frame(village_rds)
  #replace PM2.5 NA with 0
  village_rds$PM2.5[is.na(village_rds$PM2.5)] = 0
  village_grouped <- village_rds %>% group_by(date) %>% summarise(mean_PM2_5 = mean(PM2.5))
  village_grouped$chinese_name <- village_csv[count, 4] #it does work for empty villages too
  print(head(village_grouped))
  count <- count + 1
  ##append to full county village empty dataframe
  full_county_village_liaoning_zhangwu <- rbind(full_county_village_liaoning_zhangwu, village_grouped)
  print(dim(full_county_village_liaoning_zhangwu))
}

#save grouped dataframe
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/ningxia/qingtongxia/plot")
saveRDS(full_county_village_liaoning_zhangwu, file="full_county_village_ningxia_qingtongxia.rds")

##merge with shapefile and change to sf object
full_county_village_liaoning_zhangwu_merged <- left_join(full_county_village_liaoning_zhangwu, shp, by=c("chinese_name" = "XZQMC"))
full_county_village_liaoning_zhangwu_merged_sf <- sf::st_as_sf(full_county_village_liaoning_zhangwu_merged, sf_column_name="geometry", crs = 4326)

##save the merged shapefile
sf::st_write(full_county_village_liaoning_zhangwu_merged_sf, "full_county_village_ningxia_qingtongxia_merged_sf.shp", 
             layer_options = "ENCODING=UTF-8", append=FALSE)

#plot
full_zhangwu_villages_sf <- st_transform(full_county_village_liaoning_zhangwu_merged_sf, 4326)
head(full_zhangwu_villages_sf)
summary(full_zhangwu_villages_sf$m_PM2_5)

#categorise PM2.5
colour_scheme_orange <- c("#FFF7BC", #yellow orange
                          "#FEE391",
                          "#FEC44F",
                          "#FE9929",
                          "#EC7014",
                          "#CC4C02",
                          "#993404")
full_zhangwu_villages_sf$m_PM2_5 <- cut(full_zhangwu_villages_sf$m_PM2_5,
                                        breaks=c(0, 15, 30, 45, 
                                                 75, 100, 150, Inf),
                                        labels=c('0-15', '15.1-30', '30.1-45',
                                                 '45.1-75', '75.1-100', 
                                                 '100.1-150', '>150'))

#load the whole county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("ningxia_qingtongxia_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/plots")
#ggplot
pdf("ningxia_qingtongxia_village_panel.pdf", width=12, height=5)

full_zhangwu_villages_sf %>%
  filter(date >= as.Date("2015-12-01") & date <= as.Date("2015-12-07")) %>%
  ggplot() +
  geom_sf(data=shp, color="grey65", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "grey65", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (ug/m³)") +
  labs(title = 'Qingtongxia, Ningxia') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  coord_sf(xlim = c(105.88, 106.35), ylim = c(37.85, 38.25)) +
  facet_grid(. ~ date)

dev.off()


# shanxi changzhi ------------------------------------------------------
#load csv
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv <- village_csv[village_csv$province=="Shanxi"&village_csv$county=="Changzhi",]
village_csv <- village_csv[order(village_csv$name),]
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("shanxi_changzhi_village.shp")
shp <- st_transform(shp, 4326)
#make sure villages are listed in alphabetical order in the folder
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shanxi/changzhi")
liaoning_zhangwu_village_list <- list.files(pattern="*.rds")
count <- 1
full_county_village_liaoning_zhangwu <- data.frame()
for(village in liaoning_zhangwu_village_list){
  print(village)
  village_rds <- readRDS(village)
  village_rds <- data.frame(village_rds)
  village_grouped <- village_rds %>% group_by(date) %>% summarise(mean_PM2_5 = mean(PM2.5))
  village_grouped$chinese_name <- village_csv[count, 4] #it does work for empty villages too
  print(head(village_grouped))
  count <- count + 1
  ##append to full county village empty dataframe
  full_county_village_liaoning_zhangwu <- rbind(full_county_village_liaoning_zhangwu, village_grouped)
  print(dim(full_county_village_liaoning_zhangwu))
}

#save grouped dataframe
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shanxi/changzhi/plot")
saveRDS(full_county_village_liaoning_zhangwu, file="full_county_village_shanxi_changzhi.rds")

##merge with shapefile and change to sf object
full_county_village_liaoning_zhangwu_merged <- left_join(full_county_village_liaoning_zhangwu, shp, by=c("chinese_name" = "XZQMC"))
full_county_village_liaoning_zhangwu_merged_sf <- sf::st_as_sf(full_county_village_liaoning_zhangwu_merged, sf_column_name="geometry", crs = 4326)

##save the merged shapefile
sf::st_write(full_county_village_liaoning_zhangwu_merged_sf, "full_county_village_shanxi_changzhi_merged_sf.shp", 
             layer_options = "ENCODING=UTF-8", append=FALSE)

#plot
full_zhangwu_villages_sf <- st_transform(full_county_village_liaoning_zhangwu_merged_sf, 4326)
head(full_zhangwu_villages_sf)
summary(full_zhangwu_villages_sf$m_PM2_5)

#categorise PM2.5
colour_scheme_orange <- c("#FFF7BC", #yellow orange
                          "#FEE391",
                          "#FEC44F",
                          "#FE9929",
                          "#EC7014",
                          "#CC4C02",
                          "#993404")
full_zhangwu_villages_sf$m_PM2_5 <- cut(full_zhangwu_villages_sf$m_PM2_5,
                                        breaks=c(0, 15, 30, 45, 
                                                 75, 100, 150, Inf),
                                        labels=c('0-15', '15.1-30', '30.1-45',
                                                 '45.1-75', '75.1-100', 
                                                 '100.1-150', '>150'))

#load the whole county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("shanxi_changzhi_village.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/plots")
#ggplot
pdf("shanxi_changzhi_village_panel.pdf", width=12, height=5)

full_zhangwu_villages_sf %>%
  filter(date >= as.Date("2015-12-01") & date <= as.Date("2015-12-07")) %>%
  ggplot() +
  geom_sf(data=shp, color="grey65", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "grey65", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (ug/m³)") +
  labs(title = 'Changzhi, Shanxi') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  facet_grid(. ~ date)

dev.off()

# shanxi gaoping ------------------------------------------------------
#load csv
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv <- village_csv[village_csv$province=="Shanxi"&village_csv$county=="Gaoping",]
village_csv <- village_csv[order(village_csv$name),]
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("shanxi_gaoping_village1.shp")
shp <- st_transform(shp, 4326)
#make sure villages are listed in alphabetical order in the folder
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shanxi/gaoping")
liaoning_zhangwu_village_list <- list.files(pattern="*.rds")
count <- 1
full_county_village_liaoning_zhangwu <- data.frame()
for(village in liaoning_zhangwu_village_list){
  print(village)
  village_rds <- readRDS(village)
  village_rds <- data.frame(village_rds)
  village_grouped <- village_rds %>% group_by(date) %>% summarise(mean_PM2_5 = mean(PM2.5))
  village_grouped$chinese_name <- village_csv[count, 4] #it does work for empty villages too
  print(head(village_grouped))
  count <- count + 1
  ##append to full county village empty dataframe
  full_county_village_liaoning_zhangwu <- rbind(full_county_village_liaoning_zhangwu, village_grouped)
  print(dim(full_county_village_liaoning_zhangwu))
}

#save grouped dataframe
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shanxi/gaoping/plot")
saveRDS(full_county_village_liaoning_zhangwu, file="full_county_village_shanxi_gaoping.rds")

##merge with shapefile and change to sf object
full_county_village_liaoning_zhangwu_merged <- left_join(full_county_village_liaoning_zhangwu, shp, by=c("chinese_name" = "XZQMC"))
full_county_village_liaoning_zhangwu_merged_sf <- sf::st_as_sf(full_county_village_liaoning_zhangwu_merged, sf_column_name="geometry", crs = 4326)

##save the merged shapefile
sf::st_write(full_county_village_liaoning_zhangwu_merged_sf, "full_county_village_shanxi_gaoping_merged_sf.shp", 
             layer_options = "ENCODING=UTF-8", append=FALSE)

#plot
full_zhangwu_villages_sf <- st_transform(full_county_village_liaoning_zhangwu_merged_sf, 4326)

#categorise PM2.5
colour_scheme_orange <- c("#FFF7BC", #yellow orange
                          "#FEE391",
                          "#FEC44F",
                          "#FE9929",
                          "#EC7014",
                          "#CC4C02",
                          "#993404")
full_zhangwu_villages_sf$m_PM2_5 <- cut(full_zhangwu_villages_sf$m_PM2_5,
                                        breaks=c(0, 15, 30, 45, 
                                                 75, 100, 150, Inf),
                                        labels=c('0-15', '15.1-30', '30.1-45',
                                                 '45.1-75', '75.1-100', 
                                                 '100.1-150', '>150'))

#load the whole county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("shanxi_gaoping_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/plots")
#ggplot
pdf("shanxi_gaoping_village_panel.pdf", width=12, height=5)

full_zhangwu_villages_sf %>%
  filter(date >= as.Date("2015-12-01") & date <= as.Date("2015-12-07")) %>%
  ggplot() +
  geom_sf(data=shp, color="grey65", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "grey65", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (ug/m³)") +
  labs(title = 'Gaoping, Shanxi') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  facet_grid(. ~ date)

dev.off()

# shaanxi chenggu ------------------------------------------------------
#load csv
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv <- village_csv[village_csv$province=="Shaanxi"&village_csv$county=="Chenggu",]
village_csv <- village_csv[order(village_csv$name),]
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("shaanxi_chenggu_village1.shp")
shp <- st_transform(shp, 4326)
#make sure villages are listed in alphabetical order in the folder
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shaanxi/chenggu")
liaoning_zhangwu_village_list <- list.files(pattern="*.rds")
count <- 1
full_county_village_liaoning_zhangwu <- data.frame()
for(village in liaoning_zhangwu_village_list){
  print(village)
  village_rds <- readRDS(village)
  village_rds <- data.frame(village_rds)
  village_grouped <- village_rds %>% group_by(date) %>% summarise(mean_PM2_5 = mean(PM2.5))
  village_grouped$chinese_name <- village_csv[count, 4] #it does work for empty villages too
  print(head(village_grouped))
  count <- count + 1
  ##append to full county village empty dataframe
  full_county_village_liaoning_zhangwu <- rbind(full_county_village_liaoning_zhangwu, village_grouped)
  print(dim(full_county_village_liaoning_zhangwu))
}

#save grouped dataframe
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shaanxi/chenggu/plot")
saveRDS(full_county_village_liaoning_zhangwu, file="full_county_village_shaanxi_chenggu.rds")

##merge with shapefile and change to sf object
full_county_village_liaoning_zhangwu_merged <- left_join(full_county_village_liaoning_zhangwu, shp, by=c("chinese_name" = "XZQMC"))
full_county_village_liaoning_zhangwu_merged_sf <- sf::st_as_sf(full_county_village_liaoning_zhangwu_merged, sf_column_name="geometry", crs = 4326)

##save the merged shapefile
sf::st_write(full_county_village_liaoning_zhangwu_merged_sf, "full_county_village_shaanxi_chenggu_merged_sf.shp", 
             layer_options = "ENCODING=UTF-8", append=FALSE)

#plot
full_zhangwu_villages_sf <- st_transform(full_county_village_liaoning_zhangwu_merged_sf, 4326)

#categorise PM2.5
colour_scheme_orange <- c("#FFF7BC", #yellow orange
                          "#FEE391",
                          "#FEC44F",
                          "#FE9929",
                          "#EC7014",
                          "#CC4C02",
                          "#993404")
full_zhangwu_villages_sf$m_PM2_5 <- cut(full_zhangwu_villages_sf$m_PM2_5,
                                        breaks=c(0, 15, 30, 45, 
                                                 75, 100, 150, Inf),
                                        labels=c('0-15', '15.1-30', '30.1-45',
                                                 '45.1-75', '75.1-100', 
                                                 '100.1-150', '>150'))

#load the whole county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("shaanxi_chenggu_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/plots")
#ggplot
pdf("shaanxi_chenggu_village_panel.pdf", width=12, height=5)

full_zhangwu_villages_sf %>%
  filter(date >= as.Date("2015-12-01") & date <= as.Date("2015-12-07")) %>%
  ggplot() +
  geom_sf(data=shp, color="grey65", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "grey65", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom", panel.spacing = unit(1, "cm")) +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (ug/m³)") +
  labs(title = 'Chenggu, Shaanxi') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  coord_sf(xlim = c(107.12, 107.45), ylim = c(33, 33.31)) +
  facet_grid(. ~ date)

dev.off()

# shaanxi qishan ------------------------------------------------------
#load csv
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv <- village_csv[village_csv$province=="Shaanxi"&village_csv$county=="Qishan",]
village_csv <- village_csv[order(village_csv$name),]
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("shaanxi_qishan_village1.shp")
shp <- st_transform(shp, 4326)
#make sure villages are listed in alphabetical order in the folder
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shaanxi/qishan")
liaoning_zhangwu_village_list <- list.files(pattern="*.rds")
count <- 1
full_county_village_liaoning_zhangwu <- data.frame()
for(village in liaoning_zhangwu_village_list){
  print(village)
  village_rds <- readRDS(village)
  village_rds <- data.frame(village_rds)
  village_grouped <- village_rds %>% group_by(date) %>% summarise(mean_PM2_5 = mean(PM2.5))
  village_grouped$chinese_name <- village_csv[count, 4] #it does work for empty villages too
  print(head(village_grouped))
  count <- count + 1
  ##append to full county village empty dataframe
  full_county_village_liaoning_zhangwu <- rbind(full_county_village_liaoning_zhangwu, village_grouped)
  print(dim(full_county_village_liaoning_zhangwu))
}

#save grouped dataframe
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shaanxi/qishan/plot")
saveRDS(full_county_village_liaoning_zhangwu, file="full_county_village_shaanxi_qishan.rds")

##merge with shapefile and change to sf object
full_county_village_liaoning_zhangwu_merged <- left_join(full_county_village_liaoning_zhangwu, shp, by=c("chinese_name" = "XZQMC"))
full_county_village_liaoning_zhangwu_merged_sf <- sf::st_as_sf(full_county_village_liaoning_zhangwu_merged, sf_column_name="geometry", crs = 4326)

##save the merged shapefile
sf::st_write(full_county_village_liaoning_zhangwu_merged_sf, "full_county_village_shaanxi_qishan_merged_sf.shp", 
             layer_options = "ENCODING=UTF-8", append=FALSE)

#plot
full_zhangwu_villages_sf <- st_transform(full_county_village_liaoning_zhangwu_merged_sf, 4326)

#categorise PM2.5
colour_scheme_orange <- c("#FFF7BC", #yellow orange
                          "#FEE391",
                          "#FEC44F",
                          "#FE9929",
                          "#EC7014",
                          "#CC4C02",
                          "#993404")
full_zhangwu_villages_sf$m_PM2_5 <- cut(full_zhangwu_villages_sf$m_PM2_5,
                                        breaks=c(0, 15, 30, 45, 
                                                 75, 100, 150, Inf),
                                        labels=c('0-15', '15.1-30', '30.1-45',
                                                 '45.1-75', '75.1-100', 
                                                 '100.1-150', '>150'))

#load the whole county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shp <- read_sf("shaanxi_qishan_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/plots")
#ggplot
pdf("shaanxi_qishan_village_panel.pdf", width=12, height=5)

full_zhangwu_villages_sf %>%
  filter(date >= as.Date("2015-12-01") & date <= as.Date("2015-12-07")) %>%
  ggplot() +
  geom_sf(data=shp, color="grey65", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "grey65", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (ug/m³)") +
  labs(title = 'Qishan, Shaanxi') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  coord_sf(ylim = c(34.14, 34.58)) +
  facet_grid(. ~ date)

dev.off()

























