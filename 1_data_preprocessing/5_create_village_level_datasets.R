library(sf)
sf::sf_use_s2(FALSE)
library(tidyverse)


# Subset village shapefiles by county -------------------------------------
## LIAONING ----------------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county")
shp <- read_sf("辽宁.shp")
dim(shp)
head(shp)

### zhangwu -----------------------------------------------------------------
liaoning_zhangwu <- subset(shp, 县 %in% c("彰武县"))
liaoning_zhangwu
plot(liaoning_zhangwu)
class(liaoning_zhangwu)

#save county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/liaoning_zhangwu")
sf::st_write(liaoning_zhangwu, "liaoning_zhangwu.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 

#intersect village-level shapefile with county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village")
liaoning_fengcheng_village <- read_sf("辽宁.shp")
liaoning_fengcheng_village <- st_transform(liaoning_fengcheng_village, 4326)

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/liaoning_zhangwu")
liaoning_fengcheng <- read_sf("liaoning_zhangwu.shp")
liaoning_fengcheng <- st_transform(liaoning_fengcheng, 4326)

st_crs(liaoning_fengcheng_village) == st_crs(liaoning_fengcheng)  # should return TRUE

liaoning_fengcheng_village_intersects <- liaoning_fengcheng_village[st_intersects(liaoning_fengcheng_village, liaoning_fengcheng) %>% lengths > 0,]
plot(liaoning_fengcheng_village_intersects["XZQMC"])
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(liaoning_fengcheng_village_intersects, "liaoning_zhangwu_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 



### fengcheng ---------------------------------------------------------------
liaoning_fengcheng <- subset(shp, 县 %in% c("凤城市"))
plot(liaoning_fengcheng)

#save county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/liaoning_fengcheng")
sf::st_write(liaoning_fengcheng, "liaoning_fengcheng.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 

#intersect village-level shapefile with county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/repaired")
liaoning_fengcheng_village <- read_sf("辽宁.shp")
liaoning_fengcheng_village <- st_transform(liaoning_fengcheng_village, 4326)

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/liaoning_fengcheng")
liaoning_fengcheng <- read_sf("liaoning_fengcheng.shp")
liaoning_fengcheng <- st_transform(liaoning_fengcheng, 4326)

st_crs(liaoning_fengcheng_village) == st_crs(liaoning_fengcheng)  # should return TRUE

#sf::sf_use_s2(FALSE)
liaoning_fengcheng_village_intersects <- liaoning_fengcheng_village[st_intersects(liaoning_fengcheng_village, liaoning_fengcheng) %>% lengths > 0,]
plot(liaoning_fengcheng_village_intersects["XZQMC"])
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(liaoning_fengcheng_village_intersects, "liaoning_fengcheng_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 


## HEBEI -------------------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county")
shp <- read_sf("河北.shp")


### luquan ------------------------------------------------------------------

hebei_luquan <- subset(shp, 县 %in% c("鹿泉市"))
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/hebei_luquan")
#save county shapefile
sf::st_write(hebei_luquan, "hebei_luquan.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
plot(hebei_luquan)

#intersect village-level shapefile with county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village")
liaoning_fengcheng_village <- read_sf("河北.shp")
liaoning_fengcheng_village <- st_transform(liaoning_fengcheng_village, 4326)

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/hebei_luquan")
liaoning_fengcheng <- read_sf("hebei_luquan.shp")
liaoning_fengcheng <- st_transform(liaoning_fengcheng, 4326)

st_crs(liaoning_fengcheng_village) == st_crs(liaoning_fengcheng)  # should return TRUE

liaoning_fengcheng_village_intersects <- liaoning_fengcheng_village[st_intersects(liaoning_fengcheng_village, liaoning_fengcheng) %>% lengths > 0,]
plot(liaoning_fengcheng_village_intersects["XZQMC"])
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(liaoning_fengcheng_village_intersects, "hebei_luquan_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 


### anguo -------------------------------------------------------------------

hebei_anguo <- subset(shp, 县 %in% c("安国市"))
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/hebei_anguo")

#save county shapefile
sf::st_write(hebei_anguo, "hebei_anguo.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
plot(hebei_anguo)

#intersect village-level shapefile with county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village")
liaoning_fengcheng_village <- read_sf("河北.shp")
liaoning_fengcheng_village <- st_transform(liaoning_fengcheng_village, 4326)

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/hebei_anguo")
liaoning_fengcheng <- read_sf("hebei_anguo.shp")
liaoning_fengcheng <- st_transform(liaoning_fengcheng, 4326)

st_crs(liaoning_fengcheng_village) == st_crs(liaoning_fengcheng)  # should return TRUE

liaoning_fengcheng_village_intersects <- liaoning_fengcheng_village[st_intersects(liaoning_fengcheng_village, liaoning_fengcheng) %>% lengths > 0,]
plot(liaoning_fengcheng_village_intersects["XZQMC"])
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(liaoning_fengcheng_village_intersects, "hebei_anguo_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 



## NINGXIA -----------------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county")
shp <- read_sf("宁夏.shp")


### pingluo -----------------------------------------------------------------

ningxia_pingluo <- subset(shp, 县 %in% c("平罗县"))
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/ningxia_pingluo")
#save county shapefile
sf::st_write(ningxia_pingluo, "ningxia_pingluo.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
plot(ningxia_pingluo)

#intersect village-level shapefile with county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village")
liaoning_fengcheng_village <- read_sf("宁夏回族自治区a.shp")
liaoning_fengcheng_village <- st_transform(liaoning_fengcheng_village, 4326)

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/ningxia_pingluo")
liaoning_fengcheng <- read_sf("ningxia_pingluo.shp")
liaoning_fengcheng <- st_transform(liaoning_fengcheng, 4326)

st_crs(liaoning_fengcheng_village) == st_crs(liaoning_fengcheng)  # should return TRUE

liaoning_fengcheng_village_intersects <- liaoning_fengcheng_village[st_intersects(liaoning_fengcheng_village, liaoning_fengcheng) %>% lengths > 0,]
plot(liaoning_fengcheng_village_intersects["XZQMC"])
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(liaoning_fengcheng_village_intersects, "ningxia_pingluo_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 


### qingtongxia -------------------------------------------------------------

ningxia_qingtongxia <- subset(shp, 县 %in% c("青铜峡市"))
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/ningxia_qingtongxia")

#save county shapefile
sf::st_write(ningxia_qingtongxia, "ningxia_qingtongxia.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
plot(ningxia_qingtongxia)

#intersect village-level shapefile with county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village")
liaoning_fengcheng_village <- read_sf("宁夏回族自治区a.shp")
liaoning_fengcheng_village <- st_transform(liaoning_fengcheng_village, 4326)

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/ningxia_qingtongxia")
liaoning_fengcheng <- read_sf("ningxia_qingtongxia.shp")
liaoning_fengcheng <- st_transform(liaoning_fengcheng, 4326)

st_crs(liaoning_fengcheng_village) == st_crs(liaoning_fengcheng)  # should return TRUE

liaoning_fengcheng_village_intersects <- liaoning_fengcheng_village[st_intersects(liaoning_fengcheng_village, liaoning_fengcheng) %>% lengths > 0,]
plot(liaoning_fengcheng_village_intersects["XZQMC"])
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(liaoning_fengcheng_village_intersects, "ningxia_qingtongxia_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 



## SHANXI -----------------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county")
shp <- read_sf("山西.shp")


### gaoping ------------------------------------------------------------------

shanxi_gaoping <- subset(shp, 县 %in% c("高平市"))
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/shanxi_gaoping")

#save county shapefile
sf::st_write(shanxi_gaoping, "shanxi_gaoping.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
plot(shanxi_gaoping)

#intersect village-level shapefile with county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village")
liaoning_fengcheng_village <- read_sf("山西.shp")
liaoning_fengcheng_village <- st_transform(liaoning_fengcheng_village, 4326)

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/shanxi_gaoping")
liaoning_fengcheng <- read_sf("shanxi_gaoping.shp")
liaoning_fengcheng <- st_transform(liaoning_fengcheng, 4326)

st_crs(liaoning_fengcheng_village) == st_crs(liaoning_fengcheng)  # should return TRUE

liaoning_fengcheng_village_intersects <- liaoning_fengcheng_village[st_intersects(liaoning_fengcheng_village, liaoning_fengcheng) %>% lengths > 0,]
plot(liaoning_fengcheng_village_intersects["XZQMC"])
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(liaoning_fengcheng_village_intersects, "shanxi_gaoping_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 


### changzhi ----------------------------------------------------------------

shanxi_changzhi <- subset(shp, 县 %in% c("长治县"))
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/shanxi_changzhi")
#save county shapefile
sf::st_write(shanxi_changzhi, "shanxi_changzhi.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
plot(shanxi_changzhi)

#intersect village-level shapefile with county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village")
liaoning_fengcheng_village <- read_sf("山西.shp")
liaoning_fengcheng_village <- st_transform(liaoning_fengcheng_village, 4326)

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/shanxi_changzhi")
liaoning_fengcheng <- read_sf("shanxi_changzhi.shp")
liaoning_fengcheng <- st_transform(liaoning_fengcheng, 4326)

st_crs(liaoning_fengcheng_village) == st_crs(liaoning_fengcheng)  # should return TRUE

liaoning_fengcheng_village_intersects <- liaoning_fengcheng_village[st_intersects(liaoning_fengcheng_village, liaoning_fengcheng) %>% lengths > 0,]
plot(liaoning_fengcheng_village_intersects["XZQMC"])
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(liaoning_fengcheng_village_intersects, "shanxi_changzhi_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 



## SHAANXI -----------------------------------------------------------------
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county")
shp <- read_sf("陕西.shp")


### qishan ------------------------------------------------------------------

shaanxi_qishan <- subset(shp, 县 %in% c("岐山县"))
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/shaanxi_qishan")

#save county shapefile
sf::st_write(shaanxi_qishan, "shaanxi_qishan.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
plot(shaanxi_qishan)

#intersect village-level shapefile with county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village")
liaoning_fengcheng_village <- read_sf("陕西.shp")
liaoning_fengcheng_village <- st_transform(liaoning_fengcheng_village, 4326)

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/shaanxi_qishan")
liaoning_fengcheng <- read_sf("shaanxi_qishan.shp")
liaoning_fengcheng <- st_transform(liaoning_fengcheng, 4326)

st_crs(liaoning_fengcheng_village) == st_crs(liaoning_fengcheng)  # should return TRUE

liaoning_fengcheng_village_intersects <- liaoning_fengcheng_village[st_intersects(liaoning_fengcheng_village, liaoning_fengcheng) %>% lengths > 0,]
plot(liaoning_fengcheng_village_intersects["XZQMC"])
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(liaoning_fengcheng_village_intersects, "shaanxi_qishan_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 


### chenggu -----------------------------------------------------------------

shaanxi_chenggu <- subset(shp, 县 %in% c("城固县"))

#save county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/shaanxi_chenggu")
sf::st_write(shaanxi_chenggu, "shaanxi_chenggu.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
plot(shaanxi_chenggu)

#intersect village-level shapefile with county shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village")
liaoning_fengcheng_village <- read_sf("陕西.shp")
liaoning_fengcheng_village <- st_transform(liaoning_fengcheng_village, 4326)

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_county/shaanxi_chenggu")
liaoning_fengcheng <- read_sf("shaanxi_chenggu.shp")
liaoning_fengcheng <- st_transform(liaoning_fengcheng, 4326)

st_crs(liaoning_fengcheng_village) == st_crs(liaoning_fengcheng)  # should return TRUE

liaoning_fengcheng_village_intersects <- liaoning_fengcheng_village[st_intersects(liaoning_fengcheng_village, liaoning_fengcheng) %>% lengths > 0,]
plot(liaoning_fengcheng_village_intersects["XZQMC"])
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(liaoning_fengcheng_village_intersects, "shaanxi_chenggu_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 



# Subset province data into county-level ----------------------------------
# Use the shapefiles created above which have been split by county to subset the province level data created in previous script into counties.

#read shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
liaoning_zhangwu_shp <- read_sf("liaoning_zhangwu_village.shp")
liaoning_fengcheng_shp <- read_sf("liaoning_fengcheng_village.shp")
hebei_luquan_shp <- read_sf("hebei_luquan_village.shp")
hebei_anguo_shp <- read_sf("hebei_anguo_village.shp")
ningxia_pingluo_shp <- read_sf("ningxia_pingluo_village.shp")
ningxia_qingtongxia_shp <- read_sf("ningxia_qingtongxia_village.shp")
shanxi_gaoping_shp <- read_sf("shanxi_gaoping_village.shp")
shanxi_changzhi_shp <- read_sf("shanxi_changzhi_village.shp")
shaanxi_qishan_shp <- read_sf("shaanxi_qishan_village.shp")
shaanxi_chenggu_shp <- read_sf("shaanxi_chenggu_village.shp")

#intersect province data and county shapefile
#convert to an object of class sf
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
liaoning_province_data <- readRDS("4_liaoning_full_dataset.rds")
liaoning_province_data <- st_as_sf(liaoning_province_data, coords=c("Longitude", "Latitude"))
hebei_province_data <- readRDS("4_hebei_full_dataset.rds")
hebei_province_data <- st_as_sf(hebei_province_data, coords=c("Longitude", "Latitude"))
ningxia_province_data <- readRDS("4_ningxia_full_dataset.rds")
ningxia_province_data <- st_as_sf(ningxia_province_data, coords=c("Longitude", "Latitude"))
shanxi_province_data <- readRDS("4_shanxi_full_dataset.rds")
shanxi_province_data <- st_as_sf(shanxi_province_data, coords=c("Longitude", "Latitude"))
shaanxi_province_data <- readRDS("4_shaanxi_full_dataset.rds")
shaanxi_province_data <- st_as_sf(shaanxi_province_data, coords=c("Longitude", "Latitude"))

#make sure coordinate systems projections are the same
liaoning_zhangwu_shp <- st_transform(liaoning_zhangwu_shp, 4326)
liaoning_fengcheng_shp <- st_transform(liaoning_fengcheng_shp, 4326)
liaoning_province_data <- liaoning_province_data %>% st_set_crs(st_crs(liaoning_zhangwu_shp))
st_crs(liaoning_zhangwu_shp) == st_crs(liaoning_province_data)  # should return TRUE
st_crs(liaoning_fengcheng_shp) == st_crs(liaoning_province_data)  # should return TRUE

hebei_luquan_shp <- st_transform(hebei_luquan_shp, 4326)
hebei_anguo_shp <- st_transform(hebei_anguo_shp, 4326)
hebei_province_data <- hebei_province_data %>% st_set_crs(st_crs(hebei_luquan_shp))
st_crs(hebei_luquan_shp) == st_crs(hebei_province_data)  # should return TRUE
st_crs(hebei_anguo_shp) == st_crs(hebei_province_data)  # should return TRUE

ningxia_pingluo_shp <- st_transform(ningxia_pingluo_shp, 4326)
ningxia_qingtongxia_shp <- st_transform(ningxia_qingtongxia_shp, 4326)
ningxia_province_data <- ningxia_province_data %>% st_set_crs(st_crs(ningxia_pingluo_shp))
st_crs(ningxia_pingluo_shp) == st_crs(ningxia_province_data)  # should return TRUE
st_crs(ningxia_qingtongxia_shp) == st_crs(ningxia_province_data)  # should return TRUE

shanxi_gaoping_shp <- st_transform(shanxi_gaoping_shp, 4326)
shanxi_changzhi_shp <- st_transform(shanxi_changzhi_shp, 4326)
shanxi_province_data <- shanxi_province_data %>% st_set_crs(st_crs(shanxi_gaoping_shp))
st_crs(shanxi_gaoping_shp) == st_crs(shanxi_province_data)  # should return TRUE
st_crs(shanxi_changzhi_shp) == st_crs(shanxi_province_data)  # should return TRUE

shaanxi_qishan_shp <- st_transform(shaanxi_qishan_shp, 4326)
shaanxi_chenggu_shp <- st_transform(shaanxi_chenggu_shp, 4326)
shaanxi_province_data <- shaanxi_province_data %>% st_set_crs(st_crs(shaanxi_qishan_shp))
st_crs(shaanxi_qishan_shp) == st_crs(shaanxi_province_data)  # should return TRUE
st_crs(shaanxi_chenggu_shp) == st_crs(shaanxi_province_data)  # should return TRUE

#st_intersects
start_time <- Sys.time()
liaoning_zhangwu_intersects <- liaoning_province_data[st_intersects(liaoning_province_data, liaoning_zhangwu_shp) %>% lengths > 0,]
end_time <- Sys.time()
end_time - start_time
start_time <- Sys.time()
liaoning_fengcheng_intersects <- liaoning_province_data[st_intersects(liaoning_province_data, liaoning_fengcheng_shp) %>% lengths > 0,]
end_time <- Sys.time()
end_time - start_time

start_time <- Sys.time()
hebei_luquan_intersects <- hebei_province_data[st_intersects(hebei_province_data, hebei_luquan_shp) %>% lengths > 0,]
end_time <- Sys.time()
end_time - start_time
start_time <- Sys.time()
hebei_anguo_intersects <- hebei_province_data[st_intersects(hebei_province_data, hebei_anguo_shp) %>% lengths > 0,]
end_time <- Sys.time()
end_time - start_time

start_time <- Sys.time()
ningxia_pingluo_intersects <- ningxia_province_data[st_intersects(ningxia_province_data, ningxia_pingluo_shp) %>% lengths > 0,]
end_time <- Sys.time()
end_time - start_time
start_time <- Sys.time()
ningxia_qingtongxia_intersects <- ningxia_province_data[st_intersects(ningxia_province_data, ningxia_qingtongxia_shp) %>% lengths > 0,]
end_time <- Sys.time()
end_time - start_time

start_time <- Sys.time()
shanxi_gaoping_intersects <- shanxi_province_data[st_intersects(shanxi_province_data, shanxi_gaoping_shp) %>% lengths > 0,]
end_time <- Sys.time()
end_time - start_time
start_time <- Sys.time()
shanxi_changzhi_intersects <- shanxi_province_data[st_intersects(shanxi_province_data, shanxi_changzhi_shp) %>% lengths > 0,]
end_time <- Sys.time()
end_time - start_time

start_time <- Sys.time()
shaanxi_qishan_intersects <- shaanxi_province_data[st_intersects(shaanxi_province_data, shaanxi_qishan_shp) %>% lengths > 0,]
end_time <- Sys.time()
end_time - start_time
start_time <- Sys.time()
shaanxi_chenggu_intersects <- shaanxi_province_data[st_intersects(shaanxi_province_data, shaanxi_chenggu_shp) %>% lengths > 0,]
end_time <- Sys.time()
end_time - start_time

#save province subset
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
saveRDS(liaoning_zhangwu_intersects, file = "liaoning_zhangwu_county.rds")
saveRDS(liaoning_fengcheng_intersects, file = "liaoning_fengcheng_county.rds")
saveRDS(hebei_luquan_intersects, file = "hebei_luquan_county.rds")
saveRDS(hebei_anguo_intersects, file = "hebei_anguo_county.rds")
saveRDS(ningxia_pingluo_intersects, file = "ningxia_pingluo_county.rds")
saveRDS(ningxia_qingtongxia_intersects, file = "ningxia_qingtongxia_county.rds")
saveRDS(shanxi_gaoping_intersects, file = "shanxi_gaoping_county.rds")
saveRDS(shanxi_changzhi_intersects, file = "shanxi_changzhi_county.rds")
saveRDS(shaanxi_qishan_intersects, file = "shaanxi_qishan_county.rds")
saveRDS(shaanxi_chenggu_intersects, file = "shaanxi_chenggu_county.rds")


# Create village-level datasets -------------------------------------------
# 1. Read newly created village-level shapefiles, separated by county
# 2. Read PM2.5 data, subset by county
# 3. Use a for loop to go through the 60 villages from each county, intersect the subset county data with the polygon of the same village name.

## LIAONING zhangwu --------------------------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
liaoning_zhangwu_shp <- read_sf("liaoning_zhangwu_village.shp")
liaoning_zhangwu_shp <- st_transform(liaoning_zhangwu_shp, 4326)

#load subset county data
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
liaoning_zhangwu_data <- readRDS("liaoning_zhangwu_county.rds")
liaoning_zhangwu_data <- st_as_sf(liaoning_zhangwu_data, coords=c("Longitude", "Latitude")) #convert to an object of class sf

#make sure they have the same crs
liaoning_zhangwu_data <- liaoning_zhangwu_data %>% st_set_crs(st_crs(liaoning_zhangwu_shp))
st_crs(liaoning_zhangwu_shp) == st_crs(liaoning_zhangwu_data)  # should return TRUE

#read csv with village names
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
village_names <- read.csv("SSaSS_village_geo5.csv")
liaoning_zhangwu_names <- village_names[village_names$province=="Liaoning"&village_names$county=="Zhangwu",]
#replace spaces in names with underscore
liaoning_zhangwu_names$name<-gsub(" ", "_",liaoning_zhangwu_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level")
for (i in 1:nrow(liaoning_zhangwu_names)) {
  name <- liaoning_zhangwu_names[i, 5]
  chinese_name <- liaoning_zhangwu_names[i, 4]
  zhangwu_village <- subset(liaoning_zhangwu_shp, XZQMC %in% c(chinese_name))
  zhangwu_village_intersects <- liaoning_zhangwu_data[st_intersects(liaoning_zhangwu_data, zhangwu_village) %>% lengths > 0,]
  saveRDS(zhangwu_village_intersects, file = paste("liaoning_village_zhangwu_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
}


## LIAONING fengcheng --------------------------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
liaoning_fengcheng_shp <- read_sf("liaoning_fengcheng_village.shp")
liaoning_fengcheng_shp <- st_transform(liaoning_fengcheng_shp, 4326)

#load subset county data
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
liaoning_fengcheng_data <- readRDS("liaoning_fengcheng_county.rds")
liaoning_fengcheng_data <- st_as_sf(liaoning_fengcheng_data, coords=c("Longitude", "Latitude")) #convert to an object of class sf

#make sure they have the same crs
liaoning_fengcheng_data <- liaoning_fengcheng_data %>% st_set_crs(st_crs(liaoning_fengcheng_shp))
st_crs(liaoning_fengcheng_shp) == st_crs(liaoning_fengcheng_data)  # should return TRUE

#read csv with village names
setwd("/rds/general/user/syl416/home/MSc_project/Original_data")
village_names <- read.csv("SSaSS_village_geo5.csv")
liaoning_fengcheng_names <- village_names[village_names$province=="Liaoning"&village_names$county=="Fengcheng",]
#replace spaces in names with underscore
liaoning_fengcheng_names$name<-gsub(" ", "_",liaoning_fengcheng_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level")
for (i in 1:nrow(liaoning_fengcheng_names)) {
  name <- liaoning_fengcheng_names[i, 5]
  chinese_name <- liaoning_fengcheng_names[i, 4]
  fengcheng_village <- subset(liaoning_fengcheng_shp, XZQMC %in% c(chinese_name))
  fengcheng_village_intersects <- liaoning_fengcheng_data[st_intersects(liaoning_fengcheng_data, fengcheng_village) %>% lengths > 0,]
  saveRDS(fengcheng_village_intersects, file = paste("liaoning_village_fengcheng_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
}

## HEBEI anguo --------------------------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
hebei_anguo_shp <- read_sf("hebei_anguo_village1.shp")
hebei_anguo_shp <- st_transform(hebei_anguo_shp, 4326)

#load subset county data
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
hebei_anguo_data <- readRDS("hebei_anguo_county.rds")
hebei_anguo_data <- st_as_sf(hebei_anguo_data, coords=c("Longitude", "Latitude")) #convert to an object of class sf

#make sure they have the same crs
hebei_anguo_data <- hebei_anguo_data %>% st_set_crs(st_crs(hebei_anguo_shp))
st_crs(hebei_anguo_shp) == st_crs(hebei_anguo_data)  # should return TRUE

#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
hebei_anguo_names <- village_names[village_names$province=="Hebei"&village_names$county=="Anguo",]
#replace spaces in names with underscore
hebei_anguo_names$name<-gsub(" ", "_",hebei_anguo_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level")
for (i in 1:nrow(hebei_anguo_names)) {
  name <- hebei_anguo_names[i, 5]
  chinese_name <- hebei_anguo_names[i, 4]
  anguo_village <- subset(hebei_anguo_shp, XZQMC %in% c(chinese_name))
  hebei_anguo_intersects <- hebei_anguo_data[st_intersects(hebei_anguo_data, anguo_village) %>% lengths > 0,]
  saveRDS(hebei_anguo_intersects, file = paste("hebei_village_anguo_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
}

## HEBEI luquan --------------------------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
hebei_luquan_shp <- read_sf("hebei_luquan_village.shp")
hebei_luquan_shp <- st_transform(hebei_luquan_shp, 4326)

#load subset county data
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
hebei_luquan_data <- readRDS("hebei_luquan_county.rds")
hebei_luquan_data <- st_as_sf(hebei_luquan_data, coords=c("Longitude", "Latitude")) #convert to an object of class sf

#make sure they have the same crs
hebei_luquan_data <- hebei_luquan_data %>% st_set_crs(st_crs(hebei_luquan_shp))
st_crs(hebei_luquan_shp) == st_crs(hebei_luquan_data)  # should return TRUE

#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
hebei_luquan_names <- village_names[village_names$province=="Hebei"&village_names$county=="Luquan",]
#replace spaces in names with underscore
hebei_luquan_names$name<-gsub(" ", "_",hebei_luquan_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level")
for (i in 1:nrow(hebei_luquan_names)) {
  name <- hebei_luquan_names[i, 5]
  chinese_name <- hebei_luquan_names[i, 4]
  luquan_village <- subset(hebei_luquan_shp, XZQMC %in% c(chinese_name))
  hebei_luquan_intersects <- hebei_luquan_data[st_intersects(hebei_luquan_data, luquan_village) %>% lengths > 0,]
  saveRDS(hebei_luquan_intersects, file = paste("hebei_village_luquan_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
}

## NINGXIA PINGLUO --------------------------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
ningxia_pingluo_shp <- read_sf("ningxia_pingluo_village1.shp")
ningxia_pingluo_shp <- st_transform(ningxia_pingluo_shp, 4326)

#load subset county data
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
ningxia_pingluo_data <- readRDS("ningxia_pingluo_county.rds")
ningxia_pingluo_data <- st_as_sf(ningxia_pingluo_data, coords=c("Longitude", "Latitude")) #convert to an object of class sf

#make sure they have the same crs
ningxia_pingluo_data <- ningxia_pingluo_data %>% st_set_crs(st_crs(ningxia_pingluo_shp))
st_crs(ningxia_pingluo_shp) == st_crs(ningxia_pingluo_data)  # should return TRUE

#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
ningxia_pingluo_names <- village_names[village_names$province=="Ningxia"&village_names$county=="Pingluo",]
#replace spaces in names with underscore
ningxia_pingluo_names$name<-gsub(" ", "_",ningxia_pingluo_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level")
for (i in 1:nrow(ningxia_pingluo_names)) {
  name <- ningxia_pingluo_names[i, 5]
  chinese_name <- ningxia_pingluo_names[i, 4]
  pingluo_village <- subset(ningxia_pingluo_shp, XZQMC %in% c(chinese_name))
  ningxia_pingluo_intersects <- ningxia_pingluo_data[st_intersects(ningxia_pingluo_data, pingluo_village) %>% lengths > 0,]
  saveRDS(ningxia_pingluo_intersects, file = paste("ningxia_village_pingluo_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
}

## NINGXIA qingtongxia --------------------------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
ningxia_qingtongxia_shp <- read_sf("ningxia_qingtongxia_village1.shp")
ningxia_qingtongxia_shp <- st_transform(ningxia_qingtongxia_shp, 4326)

#load subset county data
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
ningxia_qingtongxia_data <- readRDS("ningxia_qingtongxia_county.rds")
ningxia_qingtongxia_data <- st_as_sf(ningxia_qingtongxia_data, coords=c("Longitude", "Latitude")) #convert to an object of class sf

#make sure they have the same crs
ningxia_qingtongxia_data <- ningxia_qingtongxia_data %>% st_set_crs(st_crs(ningxia_qingtongxia_shp))
st_crs(ningxia_qingtongxia_shp) == st_crs(ningxia_qingtongxia_data)  # should return TRUE

#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
ningxia_qingtongxia_names <- village_names[village_names$province=="Ningxia"&village_names$county=="Qingtongxia",]
#replace spaces in names with underscore
ningxia_qingtongxia_names$name<-gsub(" ", "_",ningxia_qingtongxia_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level")
for (i in 1:nrow(ningxia_qingtongxia_names)) {
  name <- ningxia_qingtongxia_names[i, 5]
  chinese_name <- ningxia_qingtongxia_names[i, 4]
  qingtongxia_village <- subset(ningxia_qingtongxia_shp, XZQMC %in% c(chinese_name))
  ningxia_qingtongxia_intersects <- ningxia_qingtongxia_data[st_intersects(ningxia_qingtongxia_data, qingtongxia_village) %>% lengths > 0,]
  saveRDS(ningxia_qingtongxia_intersects, file = paste("ningxia_village_qingtongxia_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
}

## SHANXI changzhi --------------------------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shanxi_changzhi_shp <- read_sf("shanxi_changzhi_village.shp")
shanxi_changzhi_shp <- st_transform(shanxi_changzhi_shp, 4326)

#load subset county data
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
shanxi_changzhi_data <- readRDS("shanxi_changzhi_county.rds")
shanxi_changzhi_data <- st_as_sf(shanxi_changzhi_data, coords=c("Longitude", "Latitude")) #convert to an object of class sf

#make sure they have the same crs
shanxi_changzhi_data <- shanxi_changzhi_data %>% st_set_crs(st_crs(shanxi_changzhi_shp))
st_crs(shanxi_changzhi_shp) == st_crs(shanxi_changzhi_data)  # should return TRUE

#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
shanxi_changzhi_names <- village_names[village_names$province=="Shanxi"&village_names$county=="Changzhi",]
#replace spaces in names with underscore
shanxi_changzhi_names$name<-gsub(" ", "_",shanxi_changzhi_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level")
for (i in 1:nrow(shanxi_changzhi_names)) {
  name <- shanxi_changzhi_names[i, 5]
  chinese_name <- shanxi_changzhi_names[i, 4]
  changzhi_village <- subset(shanxi_changzhi_shp, XZQMC %in% c(chinese_name))
  shanxi_changzhi_village_intersects <- shanxi_changzhi_data[st_intersects(shanxi_changzhi_data, changzhi_village) %>% lengths > 0,]
  saveRDS(shanxi_changzhi_village_intersects, file = paste("shanxi_village_changzhi_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
}

## SHANXI gaoping --------------------------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shanxi_gaoping_shp <- read_sf("shanxi_gaoping_village1.shp")
shanxi_gaoping_shp <- st_transform(shanxi_gaoping_shp, 4326)

#load subset county data
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
shanxi_gaoping_data <- readRDS("shanxi_gaoping_county.rds")
shanxi_gaoping_data <- st_as_sf(shanxi_gaoping_data, coords=c("Longitude", "Latitude")) #convert to an object of class sf

#make sure they have the same crs
shanxi_gaoping_data <- shanxi_gaoping_data %>% st_set_crs(st_crs(shanxi_gaoping_shp))
st_crs(shanxi_gaoping_shp) == st_crs(shanxi_gaoping_data)  # should return TRUE

#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
shanxi_gaoping_names <- village_names[village_names$province=="Shanxi"&village_names$county=="Gaoping",]
#replace spaces in names with underscore
shanxi_gaoping_names$name<-gsub(" ", "_",shanxi_gaoping_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level")
for (i in 1:nrow(shanxi_gaoping_names)) {
  name <- shanxi_gaoping_names[i, 5]
  chinese_name <- shanxi_gaoping_names[i, 4]
  gaoping_village <- subset(shanxi_gaoping_shp, XZQMC %in% c(chinese_name))
  shanxi_gaoping_village_intersects <- shanxi_gaoping_data[st_intersects(shanxi_gaoping_data, gaoping_village) %>% lengths > 0,]
  saveRDS(shanxi_gaoping_village_intersects, file = paste("shanxi_village_gaoping_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
}

## SHAANXI chenggu --------------------------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shaanxi_chenggu_shp <- read_sf("shaanxi_chenggu_village1.shp")
shaanxi_chenggu_shp <- st_transform(shaanxi_chenggu_shp, 4326)

#load subset county data
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
shaanxi_chenggu_data <- readRDS("shaanxi_chenggu_county.rds")
shaanxi_chenggu_data <- st_as_sf(shaanxi_chenggu_data, coords=c("Longitude", "Latitude")) #convert to an object of class sf

#make sure they have the same crs
shaanxi_chenggu_data <- shaanxi_chenggu_data %>% st_set_crs(st_crs(shaanxi_chenggu_shp))
st_crs(shaanxi_chenggu_shp) == st_crs(shaanxi_chenggu_data)  # should return TRUE

#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
shaanxi_chenggu_names <- village_names[village_names$province=="Shaanxi"&village_names$county=="Chenggu",]
#replace spaces in names with underscore
shaanxi_chenggu_names$name<-gsub(" ", "_",shaanxi_chenggu_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level")
for (i in 1:nrow(shaanxi_chenggu_names)) {
  name <- shaanxi_chenggu_names[i, 5]
  chinese_name <- shaanxi_chenggu_names[i, 4]
  chenggu_village <- subset(shaanxi_chenggu_shp, XZQMC %in% c(chinese_name))
  shaanxi_chenggu_village_intersects <- shaanxi_chenggu_data[st_intersects(shaanxi_chenggu_data, chenggu_village) %>% lengths > 0,]
  saveRDS(shaanxi_chenggu_village_intersects, file = paste("shaanxi_village_chenggu_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
}

## SHAANXI qishan --------------------------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
shaanxi_qishan_shp <- read_sf("shaanxi_qishan_village1.shp")
shaanxi_qishan_shp <- st_transform(shaanxi_qishan_shp, 4326)

#load subset county data
setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/county_level")
shaanxi_qishan_data <- readRDS("shaanxi_qishan_county.rds")
shaanxi_qishan_data <- st_as_sf(shaanxi_qishan_data, coords=c("Longitude", "Latitude")) #convert to an object of class sf

#make sure they have the same crs
shaanxi_qishan_data <- shaanxi_qishan_data %>% st_set_crs(st_crs(shaanxi_qishan_shp))
st_crs(shaanxi_qishan_shp) == st_crs(shaanxi_qishan_data)  # should return TRUE

#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
shaanxi_qishan_names <- village_names[village_names$province=="Shaanxi"&village_names$county=="Qishan",]
#replace spaces in names with underscore
shaanxi_qishan_names$name<-gsub(" ", "_",shaanxi_qishan_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Subset_data/village_level")
for (i in 1:nrow(shaanxi_qishan_names)) {
  name <- shaanxi_qishan_names[i, 5]
  chinese_name <- shaanxi_qishan_names[i, 4]
  qishan_village <- subset(shaanxi_qishan_shp, XZQMC %in% c(chinese_name))
  shaanxi_qishan_village_intersects <- shaanxi_qishan_data[st_intersects(shaanxi_qishan_data, qishan_village) %>% lengths > 0,]
  saveRDS(shaanxi_qishan_village_intersects, file = paste("shaanxi_village_qishan_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
}





# Checking village names in shapefile ---------------------------------------
# HEBEI anguo
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
anguo_shp <- read_sf("hebei_anguo_village.shp")

#load province data (province subset)
setwd("/rds/general/user/syl416/home/MSc_project/Results/county_level/whole/hebei") 
anguo_data <- readRDS("hebei_county_anguo_whole.rds") 
anguo_data <- st_as_sf(anguo_data, coords=c("Longitude", "Latitude"))

#make sure coordinate systems projections are the same
anguo_shp <- st_transform(anguo_shp, 4326)
anguo_data <- anguo_data %>% st_set_crs(st_crs(anguo_shp))
#double check it using a different village subset
st_crs(anguo_shp) == st_crs(anguo_data)  # should return TRUE

#LOAD THE LATEST VERSION!!!!!!!!!!!
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo1.csv")
village_csv <- village_csv[village_csv$province=="Hebei" & 
                             village_csv$county=="Anguo", ]

#check the villages in shapefile
for (i in 1:nrow(village_csv)) {
  chinese_name <- village_csv[i, 4]
  print(chinese_name)
  chinese_name_yn <- table(anguo_shp$XZQMC %in% c(chinese_name))
  print(chinese_name_yn)
}

length(anguo_shp$XZQMC) #total 270 villages
length(village_csv$Chinese_name)

#These are the ones in csv but not in shapefile.
# 西王奇-> 西王奇村
#find coords from csv of village
coords_village_csv_西王奇 <- village_csv[village_csv$Chinese_name=="西王奇" & 
                                        village_csv$province=="Hebei" & 
                                        village_csv$county=="Anguo", ]
coords_village_csv_西王奇

anguo_shp$XZQMC

# #convert the above to an sf object
# coords_village_csv_西王奇 <- st_as_sf(coords_village_csv_西王奇, coords=c("longitude", "lattitude"))
# coords_village_csv_西王奇 <- coords_village_csv_西王奇 %>% st_set_crs(st_crs(anguo_shp))
# st_crs(anguo_shp) == st_crs(coords_village_csv_西王奇)  # should return TRUE
# 
# #st_intersects with village csv points and county shapefile to find the shapefile polygon name
# specific_village_shp_name <- anguo_shp[st_intersects(anguo_shp, coords_village_csv_西王奇) %>% lengths > 0,]
# specific_village_shp_name #东王奇村

# 北流罗 -> 北流罗村
coords_village_csv <- village_csv[village_csv$Chinese_name=="北流罗" & 
                                    village_csv$province=="Hebei" & 
                                    village_csv$county=="Anguo", ]
coords_village_csv

# #convert the above to an sf object
# coords_village_csv <- st_as_sf(coords_village_csv, coords=c("longitude", "lattitude"))
# coords_village_csv <- coords_village_csv %>% st_set_crs(st_crs(anguo_shp))
# st_crs(anguo_shp) == st_crs(coords_village_csv)  # should return TRUE
# 
# #st_intersects with village csv points and county shapefile to find the shapefile polygon name
# specific_village_shp_name <- anguo_shp[st_intersects(anguo_shp, coords_village_csv) %>% lengths > 0,]
# specific_village_shp_name #西叩村 - google maps says this is in a different county
# 
# #check shapefile names
# anguo_shp$XZQMC #北流罗村


# Exploring empty datasets ------------------------------------------------
#some villages still don't have data associated with them so check their names:

# hebei anguo
#Soochow 10 东吴庄
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/hebei/anguo")
for (i in 10:10) {
  name <- hebei_anguo_names[i, 5]
  chinese_name <- hebei_anguo_names[i, 4]
  anguo_village <- subset(hebei_anguo_shp, XZQMC %in% c(chinese_name))
  hebei_anguo_intersects <- hebei_anguo_data[st_intersects(hebei_anguo_data, anguo_village) %>% lengths > 0,]
  #saveRDS(hebei_anguo_intersects, file = paste("hebei_village_anguo_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(anguo_village)
  print(hebei_anguo_intersects)
}

hebei_anguo_shp$XZQMC

coords_village <- hebei_anguo_names[hebei_anguo_names$Chinese_name=="东吴庄", ]
coords_village <- st_as_sf(coords_village, coords=c("longitude", "lattitude"))
coords_village <- coords_village %>% st_set_crs(st_crs(hebei_anguo_shp))
st_crs(hebei_anguo_shp) == st_crs(coords_village)  # should return TRUE
hebei_anguo_shp$value <- ifelse(hebei_anguo_shp$XZQMC=="东吴庄", 1, NA)
pal <- brewer.pal(3, "Dark2")
plot(hebei_anguo_shp["geometry"], graticule=TRUE, axes = TRUE, pch = '.', main="东吴庄")
plot(hebei_anguo_shp["value"], graticule=TRUE, axes=TRUE, add=TRUE, pal=pal)
plot(coords_village['geometry'], axes = TRUE, graticule=TRUE, pch = 16, cex=0.6, 
     col="red", add = TRUE)
intersect_test <- hebei_anguo_shp[st_intersects(hebei_anguo_shp, coords_village) %>% lengths > 0,]
intersect_test # 袁李村

#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
hebei_anguo_names <- village_names[village_names$province=="Hebei"&village_names$county=="Anguo",]
#replace spaces in names with underscore
hebei_anguo_names$name<-gsub(" ", "_",hebei_anguo_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/hebei/anguo")
for (i in 10:10) {
  name <- hebei_anguo_names[i, 5]
  chinese_name <- hebei_anguo_names[i, 4]
  anguo_village <- subset(hebei_anguo_shp, XZQMC %in% c(chinese_name))
  hebei_anguo_intersects <- hebei_anguo_data[st_intersects(hebei_anguo_data, anguo_village) %>% lengths > 0,]
  #saveRDS(hebei_anguo_intersects, file = paste("hebei_village_anguo_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(anguo_village)
  print(dim(hebei_anguo_intersects))
}

setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/hebei/anguo")
#Mazhuang 52 马庄村1
for (i in 52:52) {
  name <- hebei_anguo_names[i, 5]
  chinese_name <- hebei_anguo_names[i, 4]
  anguo_village <- subset(hebei_anguo_shp, XZQMC %in% c(chinese_name))
  hebei_anguo_intersects <- hebei_anguo_data[st_intersects(hebei_anguo_data, anguo_village) %>% lengths > 0,]
  saveRDS(hebei_anguo_intersects, file = paste("hebei_village_anguo_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(anguo_village)
  print(hebei_anguo_intersects)
}
#东马庄村
coords_village <- hebei_anguo_names[hebei_anguo_names$Chinese_name=="东马庄村", ]
coords_village <- st_as_sf(coords_village, coords=c("longitude", "lattitude"))
coords_village <- coords_village %>% st_set_crs(st_crs(hebei_anguo_shp))
st_crs(hebei_anguo_shp) == st_crs(coords_village)  # should return TRUE
hebei_anguo_shp$value <- ifelse(hebei_anguo_shp$XZQMC=="东马庄村", 1, NA)
pal <- brewer.pal(3, "Dark2")
plot(hebei_anguo_shp["geometry"], graticule=TRUE, axes = TRUE, pch = '.', main="东马庄村, Anguo, Hebei")
plot(hebei_anguo_shp["value"], graticule=TRUE, axes=TRUE, add=TRUE, pal=pal)
plot(coords_village['geometry'], axes = TRUE, graticule=TRUE, pch = 16, cex=0.6, 
     col="red", add = TRUE)
intersect_test <- hebei_anguo_shp[st_intersects(hebei_anguo_shp, coords_village) %>% lengths > 0,]
intersect_test # 袁李村


# shanxi changzh
#Renjiazhuang 24 任家庄村
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shanxi/changzhi")
for (i in 24:24) {
  name <- shanxi_changzhi_names[i, 5]
  chinese_name <- shanxi_changzhi_names[i, 4]
  changzhi_village <- subset(shanxi_changzhi_shp, XZQMC %in% c(chinese_name))
  shanxi_changzhi_village_intersects <- shanxi_changzhi_data[st_intersects(shanxi_changzhi_data, changzhi_village) %>% lengths > 0,]
  #saveRDS(shanxi_changzhi_village_intersects, file = paste("shanxi_village_changzhi_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(changzhi_village)
  print(shanxi_changzhi_village_intersects)
}

shanxi_changzhi_shp$XZQMC
#There is a 任家庄 in the shapefile so seeing if that has any data.
changzhi_village <- subset(shanxi_changzhi_shp, XZQMC == "任家庄")
shanxi_changzhi_village_intersects <- shanxi_changzhi_data[st_intersects(shanxi_changzhi_data, changzhi_village) %>% lengths > 0,]
shanxi_changzhi_village_intersects
#yes! so changing the name in csv to 任家庄

#now running it to save the rds

#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
shanxi_changzhi_names <- village_names[village_names$province=="Shanxi"&village_names$county=="Changzhi",]
#replace spaces in names with underscore
shanxi_changzhi_names$name<-gsub(" ", "_",shanxi_changzhi_names$name)

setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shanxi/changzhi")
for (i in 24:24) {
  name <- shanxi_changzhi_names[i, 5]
  chinese_name <- shanxi_changzhi_names[i, 4]
  changzhi_village <- subset(shanxi_changzhi_shp, XZQMC %in% c(chinese_name))
  shanxi_changzhi_village_intersects <- shanxi_changzhi_data[st_intersects(shanxi_changzhi_data, changzhi_village) %>% lengths > 0,]
  saveRDS(shanxi_changzhi_village_intersects, file = paste("shanxi_village_changzhi_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(changzhi_village)
  print(shanxi_changzhi_village_intersects)
}

## shaanxi chenggu 
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shaanxi/chenggu")
# Xiajie 2 下街村 
for (i in 2:2) {
  name <- shaanxi_chenggu_names[i, 5]
  chinese_name <- shaanxi_chenggu_names[i, 4]
  chenggu_village <- subset(shaanxi_chenggu_shp, XZQMC %in% c(chinese_name))
  shaanxi_chenggu_village_intersects <- shaanxi_chenggu_data[st_intersects(shaanxi_chenggu_data, chenggu_village) %>% lengths > 0,]
  #saveRDS(shaanxi_chenggu_village_intersects, file = paste("shaanxi_village_chenggu_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(chenggu_village)
  print(shaanxi_chenggu_village_intersects)
}

shaanxi_chenggu_shp$XZQMC

coords_village <- shaanxi_chenggu_names[shaanxi_chenggu_names$Chinese_name=="下街村", ]
coords_village <- st_as_sf(coords_village, coords=c("longitude", "lattitude"))
coords_village <- coords_village %>% st_set_crs(st_crs(shaanxi_chenggu_shp))
st_crs(shaanxi_chenggu_shp) == st_crs(coords_village)  # should return TRUE
shaanxi_chenggu_shp$value <- ifelse(shaanxi_chenggu_shp$XZQMC=="下街村", 1, NA)
pal <- brewer.pal(3, "Dark2")
plot(shaanxi_chenggu_shp["geometry"], graticule=TRUE, axes = TRUE, pch = '.', main="下街村")
plot(shaanxi_chenggu_shp["value"], graticule=TRUE, axes=TRUE, add=TRUE, pal=pal)
plot(coords_village['geometry'], axes = TRUE, graticule=TRUE, pch = 16, cex=0.6, 
     col="red", add = TRUE)
intersect_test <- shaanxi_chenggu_shp[st_intersects(shaanxi_chenggu_shp, coords_village) %>% lengths > 0,]
intersect_test #许家庙村 
#on google maps, 下街村 and 许家庙村 are very close together so changing it to 许家庙村

#running it to save it
#read csv LATEST VERSION (VERSION 5)
setwd("/rds/general/user/syl416/home/MSc_project")
village_names <- read.csv("SSaSS_village_geo5.csv")
shaanxi_chenggu_names <- village_names[village_names$province=="Shaanxi"&village_names$county=="Chenggu",]
#replace spaces in names with underscore
shaanxi_chenggu_names$name<-gsub(" ", "_",shaanxi_chenggu_names$name)
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shaanxi/chenggu")
for (i in 2:2) {
  name <- shaanxi_chenggu_names[i, 5]
  chinese_name <- shaanxi_chenggu_names[i, 4]
  chenggu_village <- subset(shaanxi_chenggu_shp, XZQMC %in% c(chinese_name))
  shaanxi_chenggu_village_intersects <- shaanxi_chenggu_data[st_intersects(shaanxi_chenggu_data, chenggu_village) %>% lengths > 0,]
  saveRDS(shaanxi_chenggu_village_intersects, file = paste("shaanxi_village_chenggu_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(chenggu_village)
  print(shaanxi_chenggu_village_intersects)
}


# Lefeng 41 乐丰村
for (i in 41:41) {
  name <- shaanxi_chenggu_names[i, 5]
  chinese_name <- shaanxi_chenggu_names[i, 4]
  chenggu_village <- subset(shaanxi_chenggu_shp, XZQMC %in% c(chinese_name))
  shaanxi_chenggu_village_intersects <- shaanxi_chenggu_data[st_intersects(shaanxi_chenggu_data, chenggu_village) %>% lengths > 0,]
  #saveRDS(shaanxi_chenggu_village_intersects, file = paste("shaanxi_village_chenggu_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(chenggu_village)
  print(shaanxi_chenggu_village_intersects)
}

coords_village <- shaanxi_chenggu_names[shaanxi_chenggu_names$Chinese_name=="乐丰村", ]
coords_village <- st_as_sf(coords_village, coords=c("longitude", "lattitude"))
coords_village <- coords_village %>% st_set_crs(st_crs(shaanxi_chenggu_shp))
st_crs(shaanxi_chenggu_shp) == st_crs(coords_village)  # should return TRUE
shaanxi_chenggu_shp$value <- ifelse(shaanxi_chenggu_shp$XZQMC=="乐丰村", 1, NA)
pal <- brewer.pal(3, "Dark2")
plot(shaanxi_chenggu_shp["geometry"], graticule=TRUE, axes = TRUE, pch = '.', main="乐丰村")
plot(shaanxi_chenggu_shp["value"], graticule=TRUE, axes=TRUE, add=TRUE, pal=pal)
plot(coords_village['geometry'], axes = TRUE, graticule=TRUE, pch = 16, cex=0.6, 
     col="red", add = TRUE)
intersect_test <- shaanxi_chenggu_shp[st_intersects(shaanxi_chenggu_shp, coords_village) %>% lengths > 0,]
intersect_test # 王家堡村

#NO DATA FOR THIS VILLAGE, the one it intersects with is already listed separately in csv.

# Zanjiazhuang 46 昝家庄村
for (i in 46:46) {
  name <- shaanxi_chenggu_names[i, 5]
  chinese_name <- shaanxi_chenggu_names[i, 4]
  chenggu_village <- subset(shaanxi_chenggu_shp, XZQMC %in% c(chinese_name))
  shaanxi_chenggu_village_intersects <- shaanxi_chenggu_data[st_intersects(shaanxi_chenggu_data, chenggu_village) %>% lengths > 0,]
  #saveRDS(shaanxi_chenggu_village_intersects, file = paste("shaanxi_village_chenggu_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(chenggu_village)
  print(shaanxi_chenggu_village_intersects)
}

coords_village <- shaanxi_chenggu_names[shaanxi_chenggu_names$Chinese_name=="昝家庄村", ]
coords_village <- st_as_sf(coords_village, coords=c("longitude", "lattitude"))
coords_village <- coords_village %>% st_set_crs(st_crs(shaanxi_chenggu_shp))
st_crs(shaanxi_chenggu_shp) == st_crs(coords_village)  # should return TRUE
shaanxi_chenggu_shp$value <- ifelse(shaanxi_chenggu_shp$XZQMC=="昝家庄村", 1, NA)
pal <- brewer.pal(3, "Dark2")
plot(shaanxi_chenggu_shp["geometry"], graticule=TRUE, axes = TRUE, pch = '.', main="昝家庄村")
plot(shaanxi_chenggu_shp["value"], graticule=TRUE, axes=TRUE, add=TRUE, pal=pal)
plot(coords_village['geometry'], axes = TRUE, graticule=TRUE, pch = 16, cex=0.6, 
     col="red", add = TRUE)
intersect_test <- shaanxi_chenggu_shp[st_intersects(shaanxi_chenggu_shp, coords_village) %>% lengths > 0,]
intersect_test # 口头营村



## shaanxi qishan 
# Xinhua 7 岳陈村
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shaanxi/qishan")
for (i in 7:7) {
  name <- shaanxi_qishan_names[i, 5]
  chinese_name <- shaanxi_qishan_names[i, 4]
  qishan_village <- subset(shaanxi_qishan_shp, XZQMC %in% c(chinese_name))
  shaanxi_qishan_village_intersects <- shaanxi_qishan_data[st_intersects(shaanxi_qishan_data, qishan_village) %>% lengths > 0,]
  #saveRDS(shaanxi_qishan_village_intersects, file = paste("shaanxi_village_qishan_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(qishan_village)
  print(shaanxi_qishan_village_intersects)
}

shaanxi_qishan_shp$XZQMC

coords_village <- shaanxi_qishan_names[shaanxi_qishan_names$Chinese_name=="岳陈村", ]
coords_village <- st_as_sf(coords_village, coords=c("longitude", "lattitude"))
coords_village <- coords_village %>% st_set_crs(st_crs(shaanxi_qishan_shp))
st_crs(shaanxi_qishan_shp) == st_crs(coords_village)  # should return TRUE
shaanxi_qishan_shp$value <- ifelse(shaanxi_qishan_shp$XZQMC=="岳陈村", 1, NA)
pal <- brewer.pal(3, "Dark2")
plot(shaanxi_qishan_shp["geometry"], graticule=TRUE, axes = TRUE, pch = '.', main="岳陈村")
plot(shaanxi_qishan_shp["value"], graticule=TRUE, axes=TRUE, add=TRUE, pal=pal)
plot(coords_village['geometry'], axes = TRUE, graticule=TRUE, pch = 16, cex=0.6, 
     col="red", add = TRUE)
intersect_test <- shaanxi_qishan_shp[st_intersects(shaanxi_qishan_shp, coords_village) %>% lengths > 0,]
intersect_test # 岳陈村


# Nanxing 21 南星村
setwd("/rds/general/user/syl416/home/MSc_project/Results/village_level/shaanxi/qishan")
for (i in 21:21) {
  name <- shaanxi_qishan_names[i, 5]
  chinese_name <- shaanxi_qishan_names[i, 4]
  qishan_village <- subset(shaanxi_qishan_shp, XZQMC %in% c(chinese_name))
  shaanxi_qishan_village_intersects <- shaanxi_qishan_data[st_intersects(shaanxi_qishan_data, qishan_village) %>% lengths > 0,]
  #saveRDS(shaanxi_qishan_village_intersects, file = paste("shaanxi_village_qishan_",name,"_subset.rds",sep=""))
  print(name)
  print(i)
  print(qishan_village)
  print(shaanxi_qishan_village_intersects)
}

coords_village <- shaanxi_qishan_names[shaanxi_qishan_names$Chinese_name=="南星村", ]
coords_village <- st_as_sf(coords_village, coords=c("longitude", "lattitude"))
coords_village <- coords_village %>% st_set_crs(st_crs(shaanxi_qishan_shp))
st_crs(shaanxi_qishan_shp) == st_crs(coords_village)  # should return TRUE
shaanxi_qishan_shp$value <- ifelse(shaanxi_qishan_shp$XZQMC=="南星村", 1, NA)
pal <- brewer.pal(3, "Dark2")
plot(shaanxi_qishan_shp["geometry"], graticule=TRUE, axes = TRUE, pch = '.', main="南星村")
plot(shaanxi_qishan_shp["value"], graticule=TRUE, axes=TRUE, add=TRUE, pal=pal)
plot(coords_village['geometry'], axes = TRUE, graticule=TRUE, pch = 16, cex=0.6, 
     col="red", add = TRUE)
intersect_test <- shaanxi_qishan_shp[st_intersects(shaanxi_qishan_shp, coords_village) %>% lengths > 0,]
intersect_test # 南星村


# Exploring duplicate village names ---------------------------------------
#load shapefile
setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
qishan_shp <- read_sf("shaanxi_qishan_village.shp")

#load province data (province subset)
setwd("/rds/general/user/syl416/home/MSc_project/Results/county_level/whole/shaanxi") 
qishan_data <- readRDS("shaanxi_county_qishan_whole.rds") 
qishan_data <- st_as_sf(qishan_data, coords=c("Longitude", "Latitude"))

#make sure coordinate systems projections are the same
qishan_shp <- st_transform(qishan_shp, 4326)
qishan_data <- qishan_data %>% st_set_crs(st_crs(qishan_shp))
#double check it using a different village subset
st_crs(qishan_shp) == st_crs(qishan_data)  # should return TRUE

#LOAD THE LATEST VERSION!!!!!!!!!!!
setwd("/rds/general/user/syl416/home/MSc_project")
village_csv <- read.csv("SSaSS_village_geo5.csv")
village_csv_county_only <- village_csv[village_csv$province=="Shaanxi" & 
                                         village_csv$county=="Qishan", ]

#check the villages in shapefile
for (i in 1:nrow(village_csv_county_only)) {
  chinese_name <- village_csv_county_only[i, 12]
  print(chinese_name)
  chinese_name_yn <- table(qishan_shp$XZQMC %in% c(chinese_name))
  print(chinese_name_yn)
}

# 红星村
coords_village_csv_红星村 <- village_csv[village_csv$Chinese_name=="红星村", ]
coords_village_csv_红星村 <- st_as_sf(coords_village_csv_红星村, coords=c("longitude", "lattitude"))
coords_village_csv_红星村 <- coords_village_csv_红星村 %>% st_set_crs(st_crs(qishan_shp))
st_crs(qishan_shp) == st_crs(coords_village_csv_红星村)  # should return TRUE
qishan_shp$value <- ifelse(qishan_shp$XZQMC=="红星村", 1, NA)

pal <- brewer.pal(3, "Dark2")
plot(qishan_shp["geometry"], graticule=TRUE, axes = TRUE, pch = '.', main="红星村")
plot(qishan_shp["value"], graticule=TRUE, axes=TRUE, add=TRUE, pal=pal)
plot(coords_village_csv_红星村['geometry'], axes = TRUE, graticule=TRUE, pch = 16, cex=0.6, 
     col="red", add = TRUE)

shpdetails <- qishan_shp[qishan_shp$XZQMC=="红星村",]
shpdetails
test_XZQDM <- subset(qishan_shp, BSM %in% c("3764", "6472"))
plot(test_XZQDM["geometry"], graticule=TRUE, axes = TRUE, main="红星村")
plot(test_XZQDM["BSM"], graticule=TRUE, axes=TRUE, key.pos=4, add=TRUE)
plot(coords_village_csv_红星村['geometry'], axes = TRUE, graticule=TRUE, pch = 16, cex=0.8,
     col="red", add = TRUE)
plot(test_XZQDM["BSM"], graticule=TRUE, axes=TRUE, key.pos=4) #plot again separately to get the key
test_XZQDM #3764

#change the name in shapefile and in csv to match
qishan_shp$XZQMC[qishan_shp$BSM == "3764"] <- "红星村1"
qishan_shp[qishan_shp$XZQMC=="红星村1",] #to check
village_csv$Chinese_name[village_csv$province == "Shaanxi" &
                           village_csv$county == "Qishan" &
                           village_csv$Chinese_name == "红星村"] <- "红星村1"
village_csv[village_csv$Chinese_name=="红星村1",] #to check

#then save the shp and csv as new docs!
setwd("/rds/general/user/syl416/home/MSc_project")
write.csv(village_csv,"SSaSS_village_geo5.csv")

setwd("/rds/general/user/syl416/home/MSc_project/Shapefile/Map_CAS_village/county_village_intersects")
sf::st_write(qishan_shp, "shaanxi_qishan_village1.shp", layer_options = "ENCODING=UTF-8", append=FALSE)




