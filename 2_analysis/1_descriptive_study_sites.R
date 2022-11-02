library(tidyverse)
library(sf)
sf::sf_use_s2(FALSE)


#using first-level administrative division shp online
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/china_map_first_level")
china <- read_sf("CHN_adm1.shp")
china <- st_transform(china, 4326)
#head(china)
#table(china$NAME_1) #Hebei, Liaoning, Ningxia Hui, Shanxi, Shaanxi
china$value <- ifelse(china$NAME_1=="Hebei", "Hebei", 
                      ifelse(china$NAME_1=="Liaoning", "Liaoning",
                             ifelse(china$NAME_1=="Ningxia Hui", "Ningxia", 
                                    ifelse(china$NAME_1=="Shanxi", "Shanxi",
                                           ifelse(china$NAME_1=="Shaanxi", "Shaanxi", NA)))))
china$value <- factor(china$value, levels=c("Hebei", "Liaoning", "Ningxia", "Shanxi", "Shaanxi"))
levels(china$value)

colour_scheme_province <- c("#E41A1C","#377EB8","#4DAF4A","#984EA3","#FF7F00")

setwd("/rds/general/user/syl416/home/MSc_project/Results/province_level")
pdf("province_map.pdf", width=11)
china %>%
  ggplot() +
  geom_sf(data=china, color="black", size = 0.15) +
  geom_sf(aes(fill = value), color = "black", size = 0.15, alpha=1) +
  theme_void() +
  scale_fill_manual(values=colour_scheme_province, name="Province",
                    na.value="white", na.translate = F) +
  theme(legend.position="bottom") +
  theme(plot.margin = unit(c(1, 1, 1, 1), "cm"))
dev.off()





#using third-level map
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/china_map_third_level")
china_county <- read_sf("CHN_adm3.shp")
china_county <- st_transform(china_county, 4326)
#table(china_county$NAME_3)
china_county$value_province <- ifelse(china_county$NAME_1=="Hebei", "Hebei", 
                                                  ifelse(china_county$NAME_1=="Liaoning", "Liaoning",
                                                  ifelse(china_county$NAME_1=="Ningxia Hui", "Ningxia", 
                                                  ifelse(china_county$NAME_1=="Shanxi", "Shanxi",
                                                  ifelse(china_county$NAME_1=="Shaanxi", "Shaanxi",
                                                        NA)))))

china_county$value_province <- factor(china_county$value_province, levels=c("Hebei", "Liaoning", "Ningxia", "Shanxi", "Shaanxi"))
colour_scheme_province <- c("#E41A1C","#377EB8","#4DAF4A","#984EA3","#FF7F00",
                            "#E41A1C","#E41A1C",
                            "#377EB8","#377EB8",
                            "#4DAF4A","#4DAF4A",
                            "#984EA3","#984EA3",
                            "#FF7F00","#FF7F00")

china_county$value_county <- ifelse(china_county$NAME_1=="Hebei"&china_county$NAME_3=="Anguo", "Anguo",
                             ifelse(china_county$NAME_1=="Hebei"&china_county$NAME_3=="Huelu", "Luquan",
                             ifelse(china_county$NAME_1=="Liaoning"&china_county$NAME_3=="Fengcheng", "Fengcheng",
                             ifelse(china_county$NAME_1=="Liaoning"&china_county$NAME_3=="Zhangwu", "Zhangwu",
                             ifelse(china_county$NAME_1=="Ningxia Hui"&china_county$NAME_3=="Pingluo", "Pingluo",
                             ifelse(china_county$NAME_1=="Ningxia Hui"&china_county$NAME_3=="Qingtongxia", "Qingtongxia",
                             ifelse(china_county$NAME_1=="Shanxi"&china_county$NAME_3=="Changzhi Xiàn", "Changzhi",
                            ifelse(china_county$NAME_1=="Shanxi"&china_county$NAME_3=="Gaoping", "Gaoping",
                             ifelse(china_county$NAME_1=="Shaanxi"&china_county$NAME_3=="Chenggu", "Chenggu",
                             ifelse(china_county$NAME_1=="Shaanxi"&china_county$NAME_3=="Qishan", "Qishan",
                             NA))))))))))
china_county$value_county <- factor(china_county$value_county, levels=c("Anguo", "Luquan",
                                                                        "Fengcheng","Zhangwu",
                                                                        "Pingluo", "Qingtongxia",
                                                                        "Changzhi","Gaoping",
                                                                        "Chenggu","Qishan"))
levels(china_county$value_county)

# china_county %>%
#   ggplot() +
#   geom_sf(data=china_county, color="grey65", size = 0.15) +
#   geom_sf(aes(fill = value_province), color = "grey65", size = 0.15, alpha=0.4) +
#   geom_sf(aes(fill = value_county, color="black"), color = "grey65", size = 0.15, alpha=1) +
#   theme_void() +
#   scale_fill_manual(values=colour_scheme_province, name="Province",
#                     na.value="white", na.translate = F) +
#   theme(legend.position="bottom") +
#   coord_sf(xlim = c(104, 126), ylim = c(31.5, 43.5)) #zooming into provinces

#getting the colours right
setwd("/rds/general/user/syl416/home/MSc_project/Results")
pdf("province_county_map.pdf", width=11)
china_county %>%
  ggplot() +
  geom_sf(data=china_county, color="grey65", size = 0.1) +
  geom_sf(aes(fill = value_province), color="grey65", size = 0.1, alpha=0.4) +
  geom_sf(aes(fill = value_county), color="grey65", size = 0.1, alpha=1) +
  theme_void() +
  scale_fill_manual(name="Province",
                    na.value="white", na.translate = F,
                    breaks=c("Hebei","Liaoning","Ningxia","Shanxi","Shaanxi",
                      "Anguo", "Luquan",
                             "Fengcheng","Zhangwu",
                             "Pingluo", "Qingtongxia",
                             "Changzhi","Gaoping",
                             "Chenggu","Qishan"),
                    values=c("#E41A1C","#377EB8","#4DAF4A","#984EA3","#FF7F00",
                             "#E41A1C","#E41A1C",
                             "#377EB8","#377EB8",
                             "#4DAF4A","#4DAF4A",
                             "#984EA3","#984EA3",
                             "#FF7F00","#FF7F00")) +
  theme(legend.position="none") +
  coord_sf(xlim = c(104, 126), ylim = c(31.5, 43.5)) #zooming into provinces
dev.off()






#differences in polygon names in the shapefiles

#working out which county corresponds to changzhi
china_county[china_county$NAME_1=="Shanxi" &
               china_county$NAME_3=="Changzhi Xiàn", ]
china_county[china_county$NAME_1=="Shanxi" &
               china_county$NAME_3=="Changzhi Shì", ]

data.frame(china_county[china_county$NAME_1=="Shanxi",9])[1] #Changzhi Shì, Changzhi Xiàn



#trying to work out which county corresponds to luquan
 china_county[china_county$NAME_1=="Hebei" &
                china_county$NAME_3=="Anguo", ]
hebei_counties <- data.frame(china_county[china_county$NAME_1=="Hebei", 14])
hebei_counties[,1]


hebei_county_test <- china_county[china_county$NAME_1=="Hebei", 9]
hebei_county_test %>%
  ggplot() +
  geom_sf(data=hebei_county_test, aes(fill=NAME_3)) +
  theme(legend.position="none")

hebei_county_test %>%
  ggplot() +
  geom_sf(data=hebei_county_test, aes(fill=NAME_3))
  


head(hebei_county_test)






# days within limits ------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/province_level")
province_daily <- readRDS("all_provinces_daily.rds")
dim(province_daily) #2192
((dim(province_daily[province_daily$Hebei <=15, ])[1])/2192)*100 #51
((dim(province_daily[province_daily$Hebei <=75, ])[1])/2192)*100 #1458

((dim(province_daily[province_daily$Liaoning <=15, ])[1])/2192)*100 
((dim(province_daily[province_daily$Liaoning <=75, ])[1])/2192)*100 

((dim(province_daily[province_daily$Ningxia <=15, ])[1])/2192)*100 
((dim(province_daily[province_daily$Ningxia <=75, ])[1])/2192)*100 

((dim(province_daily[province_daily$Shanxi <=15, ])[1])/2192)*100 
((dim(province_daily[province_daily$Shanxi <=75, ])[1])/2192)*100 

((dim(province_daily[province_daily$Shaanxi <=15, ])[1])/2192)*100 
((dim(province_daily[province_daily$Shaanxi <=75, ])[1])/2192)*100 


setwd("/rds/general/user/syl416/home/MSc_project/Aggregated_data/county_level")
counties_daily <- readRDS("all_counties_daily.rds")
dim(counties_daily) #2192
((dim(counties_daily[counties_daily$Anguo <=15, ])[1])/2192)*100 
((dim(counties_daily[counties_daily$Anguo <=75, ])[1])/2192)*100 

((dim(counties_daily[counties_daily$Luquan <=15, ])[1])/2192)*100 
((dim(counties_daily[counties_daily$Luquan <=75, ])[1])/2192)*100 

((dim(counties_daily[counties_daily$Fengcheng <=15, ])[1])/2192)*100 
((dim(counties_daily[counties_daily$Fengcheng <=75, ])[1])/2192)*100 

((dim(counties_daily[counties_daily$Zhangwu <=15, ])[1])/2192)*100 
((dim(counties_daily[counties_daily$Zhangwu <=75, ])[1])/2192)*100 

((dim(counties_daily[counties_daily$Pingluo <=15, ])[1])/2192)*100 
((dim(counties_daily[counties_daily$Pingluo <=75, ])[1])/2192)*100 

((dim(counties_daily[counties_daily$Qingtongxia <=15, ])[1])/2192)*100 
((dim(counties_daily[counties_daily$Qingtongxia <=75, ])[1])/2192)*100 

((dim(counties_daily[counties_daily$Changzhi <=15, ])[1])/2192)*100 
((dim(counties_daily[counties_daily$Changzhi <=75, ])[1])/2192)*100 

((dim(counties_daily[counties_daily$Gaoping <=15, ])[1])/2192)*100 
((dim(counties_daily[counties_daily$Gaoping <=75, ])[1])/2192)*100 

((dim(counties_daily[counties_daily$Chenggu <=15, ])[1])/2192)*100 
((dim(counties_daily[counties_daily$Chenggu <=75, ])[1])/2192)*100 

((dim(counties_daily[counties_daily$Qishan <=15, ])[1])/2192)*100 
((dim(counties_daily[counties_daily$Qishan <=75, ])[1])/2192)*100 

















