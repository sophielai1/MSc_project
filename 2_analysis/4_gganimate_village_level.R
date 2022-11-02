library(sf)
sf::sf_use_s2(FALSE)
library(dplyr)
library(paletteer)
library(ggthemes)
library(broom)
library(rgdal)
#install.packages("gifski")
#install.packages("png")
library(gifski)
library(png)
library(tidyverse)
library(gganimate)


#ggplot exploration-------------------------------

#zhangwu_liaoning --------------------------------------------------------
#load the shapefile made from 3_descriptive_village_map_panel
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/liaoning/zhangwu/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_liaoning_zhangwu_merged_sf.shp")
full_zhangwu_villages_sf <- st_transform(full_zhangwu_villages_sf, 4326)
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
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
#ggplot
zhangwu_ggplot <- full_zhangwu_villages_sf %>%
  filter(date < as.Date("2021-01-01")) %>%
  ggplot() +
  geom_sf(data=shp, color="black", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "black", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  #paletteer::scale_fill_paletteer_d("ggsci::orange_material", name="PM2.5 (μg/m³)") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (μg/m³)") +
  labs(title = 'Zhangwu, Liaoning: {current_frame}') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  transition_manual(date) #+
  #view_step(pause_length = 0.2) #this cuts off left part of plot

#zhangwu_ggplot #to view the plot in rstudio

#class(zhangwu_ggplot) #gganim
#animate the ggplot
start <- Sys.time()
zhangwu_ggplot_animated <- animate(zhangwu_ggplot, renderer=gifski_renderer(),
                                   nframes=400, fps=7,
                                   start_pause = 0, end_pause = 30)
end <- Sys.time()
#zhangwu_ggplot_animated

print(end-start) #Time difference of 51.42976 mins

anim_save("4_zhangwu_liaoning_2015_2020.gif", zhangwu_ggplot_animated)


# zhangwu_fengcheng --------------------------------------------------------
#load the shapefile made from 3_descriptive_village_map_panel
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/liaoning/fengcheng/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_liaoning_fengcheng_merged_sf.shp")
full_zhangwu_villages_sf <- st_transform(full_zhangwu_villages_sf, 4326)
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
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
#ggplot
zhangwu_ggplot <- full_zhangwu_villages_sf %>%
  filter(date < as.Date("2021-01-01")) %>%
  ggplot() +
  geom_sf(data=shp, color="black", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "black", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  #paletteer::scale_fill_paletteer_d("ggsci::orange_material", name="PM2.5 (μg/m³)") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (μg/m³)") +
  labs(title = 'Zhangwu, Fengcheng: {current_frame}') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  transition_manual(date) #+
#view_step(pause_length = 0.2) #this cuts off left part of plot

#zhangwu_ggplot #to view the plot in rstudio

#class(zhangwu_ggplot) #gganim
#animate the ggplot
start <- Sys.time()
zhangwu_ggplot_animated <- animate(zhangwu_ggplot, renderer=gifski_renderer(),
                                   nframes=400, fps=7,
                                   start_pause = 0, end_pause = 30)
end <- Sys.time()
#zhangwu_ggplot_animated

print(end-start)

anim_save("4_zhangwu_fengcheng_2015_2020.gif", zhangwu_ggplot_animated)

# hebei_anguo --------------------------------------------------------
#load the shapefile made from 3_descriptive_village_map_panel
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/hebei/anguo/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_hebei_anguo_merged_sf.shp")
full_zhangwu_villages_sf <- st_transform(full_zhangwu_villages_sf, 4326)
head(full_zhangwu_villages_sf)
summary(full_zhangwu_villages_sf$m_PM2_5)

#categorise PM2.5
# colour_scheme_orange <- c("#1BA3C6", #blue to red
#                           "#30BCAD",
#                           "#D5BB21",
#                           "#F8B620",
#                           "#F89217",
#                           "#F06719",
#                           "#E03426")
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
shp <- read_sf("hebei_anguo_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
#ggplot
zhangwu_ggplot <- full_zhangwu_villages_sf %>%
  filter(date < as.Date("2021-01-01")) %>%
  ggplot() +
  geom_sf(data=shp, color="black", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "black", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  #paletteer::scale_fill_paletteer_d("ggsci::orange_material", name="PM2.5 (μg/m³)") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (μg/m³)") +
  labs(title = 'Hebei, Anguo: {current_frame}') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  transition_manual(date) #+
#view_step(pause_length = 0.2) #this cuts off left part of plot

#zhangwu_ggplot #to view the plot in rstudio

#class(zhangwu_ggplot) #gganim
#animate the ggplot
start <- Sys.time()
zhangwu_ggplot_animated <- animate(zhangwu_ggplot, renderer=gifski_renderer(),
                                   nframes=400, fps=7,
                                   start_pause = 0, end_pause = 30)
end <- Sys.time()
#zhangwu_ggplot_animated

print(end-start) #Time difference of 40.62561 mins

anim_save("4_hebei_anguo_2015_2020.gif", zhangwu_ggplot_animated)

# hebei_luquan --------------------------------------------------------
#load the shapefile made from 3_descriptive_village_map_panel
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/hebei/luquan/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_hebei_luquan_merged_sf.shp")
full_zhangwu_villages_sf <- st_transform(full_zhangwu_villages_sf, 4326)
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
shp <- read_sf("hebei_luquan_village.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
#ggplot
zhangwu_ggplot <- full_zhangwu_villages_sf %>%
  filter(date < as.Date("2021-01-01")) %>%
  ggplot() +
  geom_sf(data=shp, color="black", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "black", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  #paletteer::scale_fill_paletteer_d("ggsci::orange_material", name="PM2.5 (μg/m³)") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (μg/m³)") +
  labs(title = 'Hebei, Luquan: {current_frame}') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  transition_manual(date) #+
#view_step(pause_length = 0.2) #this cuts off left part of plot

#zhangwu_ggplot #to view the plot in rstudio

#class(zhangwu_ggplot) #gganim
#animate the ggplot
start <- Sys.time()
zhangwu_ggplot_animated <- animate(zhangwu_ggplot, renderer=gifski_renderer(),
                                   nframes=400, fps=7,
                                   start_pause = 0, end_pause = 30)
end <- Sys.time()
#zhangwu_ggplot_animated

print(end-start) #Time difference of 40.62561 mins

anim_save("4_hebei_luquan_2015_2020.gif", zhangwu_ggplot_animated)

# ningxia_pingluo --------------------------------------------------------
#load the shapefile made from 3_descriptive_village_map_panel
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/ningxia/pingluo/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_ningxia_pingluo_merged_sf.shp")
full_zhangwu_villages_sf <- st_transform(full_zhangwu_villages_sf, 4326)
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
shp <- read_sf("ningxia_pingluo_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
#ggplot
zhangwu_ggplot <- full_zhangwu_villages_sf %>%
  filter(date < as.Date("2021-01-01")) %>%
  ggplot() +
  geom_sf(data=shp, color="black", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "black", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  #paletteer::scale_fill_paletteer_d("ggsci::orange_material", name="PM2.5 (μg/m³)") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (μg/m³)") +
  labs(title = 'Ningxia, Pingluo: {current_frame}') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  coord_sf(xlim = c(106.1, 107), ylim = c(38.6, 39.2)) +
  transition_manual(date) #+
#view_step(pause_length = 0.2) #this cuts off left part of plot

#zhangwu_ggplot #to view the plot in rstudio

#class(zhangwu_ggplot) #gganim
#animate the ggplot
start <- Sys.time()
zhangwu_ggplot_animated <- animate(zhangwu_ggplot, renderer=gifski_renderer(),
                                   nframes=400, fps=7,
                                   start_pause = 0, end_pause = 30)
end <- Sys.time()
#zhangwu_ggplot_animated

print(end-start) #Time difference of 40.62561 mins

anim_save("4_ningxia_pingluo_2015_2020_cropped.gif", zhangwu_ggplot_animated)

# ningxia_qingtongxia --------------------------------------------------------
#load the shapefile made from 3_descriptive_village_map_panel
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/ningxia/qingtongxia/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_ningxia_qingtongxia_merged_sf.shp")
full_zhangwu_villages_sf <- st_transform(full_zhangwu_villages_sf, 4326)
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
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
#ggplot
zhangwu_ggplot <- full_zhangwu_villages_sf %>%
  filter(date < as.Date("2021-01-01")) %>%
  ggplot() +
  geom_sf(data=shp, color="black", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "black", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  #paletteer::scale_fill_paletteer_d("ggsci::orange_material", name="PM2.5 (μg/m³)") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (μg/m³)") +
  labs(title = 'Ningxia, Qingtongxia: {current_frame}') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  coord_sf(xlim = c(105.88, 106.35), ylim = c(37.85, 38.25)) +
  transition_manual(date) #+
#view_step(pause_length = 0.2) #this cuts off left part of plot

#zhangwu_ggplot #to view the plot in rstudio

#class(zhangwu_ggplot) #gganim
#animate the ggplot
start <- Sys.time()
zhangwu_ggplot_animated <- animate(zhangwu_ggplot, renderer=gifski_renderer(),
                                   nframes=400, fps=7,
                                   start_pause = 0, end_pause = 30)
end <- Sys.time()
#zhangwu_ggplot_animated

print(end-start) #Time difference of 40.62561 mins

anim_save("4_ningxia_qingtongxia_2015_2020_cropped.gif", zhangwu_ggplot_animated)

# shanxi changzhi --------------------------------------------------------
#load the shapefile made from 3_descriptive_village_map_panel
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shanxi/changzhi/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_shanxi_changzhi_merged_sf.shp")
full_zhangwu_villages_sf <- st_transform(full_zhangwu_villages_sf, 4326)
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
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
#ggplot
zhangwu_ggplot <- full_zhangwu_villages_sf %>%
  filter(date < as.Date("2021-01-01")) %>%
  ggplot() +
  geom_sf(data=shp, color="black", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "black", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  #paletteer::scale_fill_paletteer_d("ggsci::orange_material", name="PM2.5 (μg/m³)") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (μg/m³)") +
  labs(title = 'Shanxi, Changzhi: {current_frame}') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  transition_manual(date) #+
#view_step(pause_length = 0.2) #this cuts off left part of plot

#zhangwu_ggplot #to view the plot in rstudio

#class(zhangwu_ggplot) #gganim
#animate the ggplot
start <- Sys.time()
zhangwu_ggplot_animated <- animate(zhangwu_ggplot, renderer=gifski_renderer(),
                                   nframes=400, fps=7,
                                   start_pause = 0, end_pause = 30)
end <- Sys.time()
#zhangwu_ggplot_animated

print(end-start) #Time difference of 40.62561 mins

anim_save("4_shanxi_changzhi_2015_2020.gif", zhangwu_ggplot_animated)

# shanxi gaoping --------------------------------------------------------
#load the shapefile made from 3_descriptive_village_map_panel
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shanxi/gaoping/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_shanxi_gaoping_merged_sf.shp")
full_zhangwu_villages_sf <- st_transform(full_zhangwu_villages_sf, 4326)
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
shp <- read_sf("shanxi_gaoping_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
#ggplot
zhangwu_ggplot <- full_zhangwu_villages_sf %>%
  filter(date < as.Date("2021-01-01")) %>%
  ggplot() +
  geom_sf(data=shp, color="black", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "black", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  #paletteer::scale_fill_paletteer_d("ggsci::orange_material", name="PM2.5 (μg/m³)") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (μg/m³)") +
  labs(title = 'Shanxi, Gaoping: {current_frame}') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  transition_manual(date) #+
#view_step(pause_length = 0.2) #this cuts off left part of plot

#zhangwu_ggplot #to view the plot in rstudio

#class(zhangwu_ggplot) #gganim
#animate the ggplot
start <- Sys.time()
zhangwu_ggplot_animated <- animate(zhangwu_ggplot, renderer=gifski_renderer(),
                                   nframes=400, fps=7,
                                   start_pause = 0, end_pause = 30)
end <- Sys.time()
#zhangwu_ggplot_animated

print(end-start) #Time difference of 40.62561 mins

anim_save("4_shanxi_gaoping_2015_2020.gif", zhangwu_ggplot_animated)

# shaanxi chenggu --------------------------------------------------------
#load the shapefile made from 3_descriptive_village_map_panel
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shaanxi/chenggu/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_shaanxi_chenggu_merged_sf.shp")
full_zhangwu_villages_sf <- st_transform(full_zhangwu_villages_sf, 4326)
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
shp <- read_sf("shaanxi_chenggu_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
#ggplot
zhangwu_ggplot <- full_zhangwu_villages_sf %>%
  filter(date < as.Date("2021-01-01")) %>%
  ggplot() +
  geom_sf(data=shp, color="black", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "black", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  #paletteer::scale_fill_paletteer_d("ggsci::orange_material", name="PM2.5 (μg/m³)") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (μg/m³)") +
  labs(title = 'Shaanxi, Chenggu: {current_frame}') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  coord_sf(xlim = c(107.12, 107.45), ylim = c(33, 33.31)) +
  transition_manual(date) #+
#view_step(pause_length = 0.2) #this cuts off left part of plot

#zhangwu_ggplot #to view the plot in rstudio

#class(zhangwu_ggplot) #gganim
#animate the ggplot
start <- Sys.time()
zhangwu_ggplot_animated <- animate(zhangwu_ggplot, renderer=gifski_renderer(),
                                   nframes=400, fps=7,
                                   start_pause = 0, end_pause = 30)
end <- Sys.time()
#zhangwu_ggplot_animated

print(end-start) #Time difference of 40.62561 mins

anim_save("4_shaanxi_chenggu_2015_2020_cropped.gif", zhangwu_ggplot_animated)

# shaanxi qishan --------------------------------------------------------
#load the shapefile made from 3_descriptive_village_map_panel
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shaanxi/qishan/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_shaanxi_qishan_merged_sf.shp")
full_zhangwu_villages_sf <- st_transform(full_zhangwu_villages_sf, 4326)
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
shp <- read_sf("shaanxi_qishan_village1.shp")
shp <- st_transform(shp, 4326)
head(shp)

####
setwd("/rds/general/user/syl416/home/MSc_project/3_results")
#ggplot
zhangwu_ggplot <- full_zhangwu_villages_sf %>%
  filter(date < as.Date("2021-01-01")) %>%
  ggplot() +
  geom_sf(data=shp, color="black", size = 0.15) +
  geom_sf(aes(fill = m_PM2_5), color = "black", size = 0.15) +
  theme_void() +
  theme(legend.position="bottom") +
  #paletteer::scale_fill_paletteer_d("ggsci::orange_material", name="PM2.5 (μg/m³)") +
  scale_fill_manual(values=colour_scheme_orange, name="PM2.5 (μg/m³)") +
  labs(title = 'Shaanxi, Qishan: {current_frame}') +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm")) +
  coord_sf(ylim = c(34.14, 34.58)) +
  transition_manual(date) #+
#view_step(pause_length = 0.2) #this cuts off left part of plot

#zhangwu_ggplot #to view the plot in rstudio

#class(zhangwu_ggplot) #gganim
#animate the ggplot
start <- Sys.time()
zhangwu_ggplot_animated <- animate(zhangwu_ggplot, renderer=gifski_renderer(),
                                   nframes=400, fps=7,
                                   start_pause = 0, end_pause = 30)
end <- Sys.time()
#zhangwu_ggplot_animated

print(end-start) #Time difference of 40.62561 mins

anim_save("4_shaanxi_qishan_2015_2020_cropped.gif", zhangwu_ggplot_animated)

#
#
#
# # testing out grey areas (NA) in ningxia ---------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/ningxia/pingluo")
baqing <- readRDS("ningxia_village_pingluo_Baqing_subset.rds")
head(baqing)
summary(baqing$PM2.5)
table(baqing$PM2.5)
baqing_values <- baqing[is.na(baqing$PM2.5)==FALSE,]
head(baqing_values)
dim(baqing)
dim(baqing_values)
summary(baqing_values$PM2.5)
summary(baqing_values$date)
summary(baqing$date)
baqing_na <- baqing[is.na(baqing$PM2.5)==TRUE,]
summary(baqing_na$date)
dim(baqing_na)
summary(baqing_na$date)
head(baqing_na)
head(baqing_values)


baqing[baqing$date=="2015-03-15",]
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
baqing_shp <- read_sf("ningxia_pingluo_village1.shp")
baqing_shp[baqing_shp$XZQMC=="八顷村",]

setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/ningxia/pingluo/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_ningxia_pingluo_merged_sf.shp")
full_zhangwu_villages_sf[full_zhangwu_villages_sf$date=="2015-03-15" & full_zhangwu_villages_sf$chns_nm=="八顷村",]

#it's because there were NA values in the PM2.5 data for some villages so changed them to 0
summary(full_zhangwu_villages_sf$m_PM2_5)

setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/ningxia/qingtongxia/plot")
full_zhangwu_villages_sf <- read_sf("full_county_village_ningxia_qingtongxia_merged_sf.shp")
summary(full_zhangwu_villages_sf$m_PM2_5)







