library(sp)
#install.packages("rgdal", dependencies = TRUE)
library(rgdal)
library(broom)
library(ggplot2)
library(sf)
library(dplyr)


# liaoning ----------------------------------------------------------------
#load the shapefile
setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_county")
liaoning_shapefile <- readOGR(dsn=".", layer="辽宁")

#shapefile glimpse shows 5 slots: @data, @polygons, @plotOrder, @bbox and proj4string
glimpse(liaoning_shapefile)

#load the longitude latitude data SAMPLE
setwd("/rds/general/user/syl416/home/MScProject/Liaoning")
liaoning_sample <- readRDS("dataset_liaoning_sample_1000.rds")
#liaoning_sample <- readRDS("dataset_liaoning.rds")

#extract the longitude and latitudes
liaoning_lat_long <- liaoning_sample[,c("Longitude","Latitude")]
#liaoning_long_lat <- liaoning_lat_long %>% select(Longitude, everything())
ggplot(liaoning_lat_long, aes(x=Longitude, y=Latitude)) +
  geom_point(size=0.5)

#attempt1: using spatial points
nrow(liaoning_lat_long)
liaoning_lat_long <- liaoning_lat_long[!is.na(liaoning_lat_long$Latitude), ]
liaoning_lat_long <- liaoning_lat_long[!is.na(liaoning_lat_long$Longitude), ]
nrow(liaoning_lat_long)

liaoning_lat_long_sp = SpatialPoints(cbind(liaoning_lat_long$Longitude, liaoning_lat_long$Latitude), proj4string = CRS("+proj=longlat +datum=WGS84"))
class(liaoning_lat_long_sp)

liaoning_shapefile_sp <- spTransform(liaoning_shapefile, CRS("+proj=longlat +datum=WGS84"))

par(mar=c(4,4,2,2))
plot(liaoning_shapefile_sp, col="coral", bg="skyblue", lwd=0.8, border=0)
points(liaoning_lat_long_sp, col = "black", pch=19, cex=0.3)
axis(1)
axis(2)
title(main = "Liaoning", 
      xlab = "Longitude", ylab = "Latitude")

#plot(liaoning_lat_long_sp)

liaoning_intercept <- over(liaoning_lat_long_sp, liaoning_shapefile_sp)
liaoning_intercept <- liaoning_intercept[apply(!is.na(liaoning_intercept), 1, any), ]
dim(liaoning_intercept)
head(liaoning_intercept)
saveRDS(liaoning_intercept, file="liaoning_intercept.rds")



# # Ningxia -----------------------------------------------------------------
# #load the shapefile
# setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_county")
# ningxia_shapefile <- readOGR(dsn=".", layer="宁夏")
# 
# #shapefile glimpse shows 5 slots: @data, @polygons, @plotOrder, @bbox and proj4string
# glimpse(ningxia_shapefile)
# 
# #load the longitude latitude data SAMPLE
# setwd("/rds/general/user/syl416/home/MScProject/Ningxia")
# ningxia_sample <- readRDS("dataset_ningxia_sample_1000.rds")
# 
# #extract the longitude and latitudes
# ningxia_lat_long <- ningxia_sample[,c("Latitude","Longitude")]
# ningxia_long_lat <- ningxia_lat_long %>% select(Longitude, everything())
# ggplot(ningxia_long_lat) +
#   geom_point(aes(x=Longitude, y=Latitude), size=0.5)
# 
# #attempt1: using spatial points
# nrow(ningxia_long_lat)
# ningxia_long_lat <- ningxia_long_lat[!is.na(ningxia_long_lat$Latitude), ]
# ningxia_long_lat <- ningxia_long_lat[!is.na(ningxia_long_lat$Longitude), ]
# nrow(ningxia_long_lat)
# 
# ningxia_long_lat_sp = SpatialPoints(cbind(ningxia_long_lat$Longitude, ningxia_long_lat$Latitude), proj4string = CRS("+proj=longlat +datum=WGS84"))
# class(ningxia_long_lat_sp)
# 
# ningxia_shapefile_sp <- spTransform(ningxia_shapefile, CRS("+proj=longlat +datum=WGS84"))
# 
# par(mar=c(4,4,2,2))
# plot(ningxia_shapefile_sp, col="coral", bg="skyblue", lwd=0.8, border=0)
# points(ningxia_long_lat_sp, col = "black", pch=19, cex=0.3)
# axis(1)
# axis(2)
# title(main = "Ningxia", 
#       xlab = "Longitude", ylab = "Latitude")
# 
# ningxia_intercept <- over(ningxia_long_lat_sp, ningxia_shapefile_sp)
# ningxia_intercept <- ningxia_intercept[apply(!is.na(ningxia_intercept), 1, any), ]
# dim(ningxia_intercept)
# ningxia_intercept
# 
# # Hebei -------------------------------------------------------------------
# #load the shapefile
# setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_county")
# hebei_shapefile <- readOGR(dsn=".", layer="河北")
# 
# #shapefile glimpse shows 5 slots: @data, @polygons, @plotOrder, @bbox and proj4string
# glimpse(hebei_shapefile)
# 
# #load the longitude latitude data SAMPLE
# setwd("/rds/general/user/syl416/home/MScProject/Hebei")
# hebei_sample <- readRDS("dataset_hebei_sample_1000.rds")
# 
# #extract the longitude and latitudes
# hebei_lat_long <- hebei_sample[,c("Latitude","Longitude")]
# hebei_long_lat <- hebei_lat_long %>% select(Longitude, everything())
# ggplot(hebei_long_lat) +
#   geom_point(aes(x=Longitude, y=Latitude), size=0.5)
# 
# #attempt1: using spatial points
# nrow(hebei_long_lat)
# hebei_long_lat <- hebei_long_lat[!is.na(hebei_long_lat$Latitude), ]
# hebei_long_lat <- hebei_long_lat[!is.na(hebei_long_lat$Longitude), ]
# nrow(hebei_long_lat)
# 
# hebei_long_lat_sp = SpatialPoints(cbind(hebei_long_lat$Longitude, hebei_long_lat$Latitude), proj4string = CRS("+proj=longlat +datum=WGS84"))
# class(hebei_long_lat_sp)
# 
# hebei_shapefile_sp <- spTransform(hebei_shapefile, CRS("+proj=longlat +datum=WGS84"))
# 
# par(mar=c(4,4,2,2))
# plot(hebei_shapefile_sp, col="coral", bg="skyblue", lwd=0.8, border=0)
# points(hebei_long_lat_sp, col = "black", pch=19, cex=0.3)
# axis(1)
# axis(2)
# title(main = "Hebei", 
#       xlab = "Longitude", ylab = "Latitude")
# 
# hebei_intercept <- over(hebei_long_lat_sp, hebei_shapefile_sp)
# hebei_intercept <- hebei_intercept[apply(!is.na(hebei_intercept), 1, any), ]
# dim(hebei_intercept)
# hebei_intercept
# 
# # Shanxi ------------------------------------------------------------------
# #load the shapefile
# setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_county")
# shanxi_shapefile <- readOGR(dsn=".", layer="山西")
# 
# #shapefile glimpse shows 5 slots: @data, @polygons, @plotOrder, @bbox and proj4string
# glimpse(shanxi_shapefile)
# 
# #load the longitude latitude data SAMPLE
# setwd("/rds/general/user/syl416/home/MScProject/Shanxi")
# shanxi_sample <- readRDS("dataset_shanxi_sample_1000.rds")
# 
# #extract the longitude and latitudes
# shanxi_lat_long <- shanxi_sample[,c("Latitude","Longitude")]
# shanxi_long_lat <- shanxi_lat_long %>% select(Longitude, everything())
# ggplot(shanxi_long_lat) +
#   geom_point(aes(x=Longitude, y=Latitude), size=0.5)
# 
# #attempt1: using spatial points
# nrow(shanxi_long_lat)
# shanxi_long_lat <- shanxi_long_lat[!is.na(shanxi_long_lat$Latitude), ]
# shanxi_long_lat <- shanxi_long_lat[!is.na(shanxi_long_lat$Longitude), ]
# nrow(shanxi_long_lat)
# 
# shanxi_long_lat_sp = SpatialPoints(cbind(shanxi_long_lat$Longitude, shanxi_long_lat$Latitude), proj4string = CRS("+proj=longlat +datum=WGS84"))
# class(shanxi_long_lat_sp)
# 
# shanxi_shapefile_sp <- spTransform(shanxi_shapefile, CRS("+proj=longlat +datum=WGS84"))
# 
# par(mar=c(4,4,2,2))
# plot(shanxi_shapefile_sp, col="coral", bg="skyblue", lwd=0.8, border=0)
# points(shanxi_long_lat_sp, col = "black", pch=19, cex=0.3)
# axis(1)
# axis(2)
# title(main = "Shanxi", 
#       xlab = "Longitude", ylab = "Latitude")
# 
# shanxi_intercept <- over(shanxi_long_lat_sp, shanxi_shapefile_sp)
# shanxi_intercept <- shanxi_intercept[apply(!is.na(shanxi_intercept), 1, any), ]
# dim(shanxi_intercept)
# shanxi_intercept
# 
# # Shaanxi -----------------------------------------------------------------
# #load the shapefile
# setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_county")
# shaanxi_shapefile <- readOGR(dsn=".", layer="陕西")
# 
# #shapefile glimpse shows 5 slots: @data, @polygons, @plotOrder, @bbox and proj4string
# glimpse(shaanxi_shapefile)
# 
# #load the longitude latitude data SAMPLE
# setwd("/rds/general/user/syl416/home/MScProject/Shaanxi")
# shaanxi_sample <- readRDS("dataset_shaanxi_sample_1000.rds")
# 
# #extract the longitude and latitudes
# shaanxi_lat_long <- shaanxi_sample[,c("Latitude","Longitude")]
# shaanxi_long_lat <- shaanxi_lat_long %>% select(Longitude, everything())
# ggplot(shaanxi_long_lat) +
#   geom_point(aes(x=Longitude, y=Latitude), size=0.5)
# 
# #attempt1: using spatial points
# nrow(shaanxi_long_lat)
# shaanxi_long_lat <- shaanxi_long_lat[!is.na(shaanxi_long_lat$Latitude), ]
# shaanxi_long_lat <- shaanxi_long_lat[!is.na(shaanxi_long_lat$Longitude), ]
# nrow(shaanxi_long_lat)
# 
# shaanxi_long_lat_sp = SpatialPoints(cbind(shaanxi_long_lat$Longitude, shaanxi_long_lat$Latitude), proj4string = CRS("+proj=longlat +datum=WGS84"))
# class(shaanxi_long_lat_sp)
# 
# shaanxi_shapefile_sp <- spTransform(shaanxi_shapefile, CRS("+proj=longlat +datum=WGS84"))
# 
# par(mar=c(4,4,2,2))
# plot(shaanxi_shapefile_sp, col="coral", bg="skyblue", lwd=0.8, border=0, xlim=c(102,112), ylim=c(30,42))
# points(shaanxi_long_lat_sp, col = "black", pch=19, cex=0.3)#, xlim=c(102,112), ylim=c(30,42))
# axis(1)
# axis(2)
# title(main = "Shaanxi", 
#       xlab = "Longitude", ylab = "Latitude")
# 
# #checking the scales
# plot(shaanxi_shapefile_sp, col="coral", bg="skyblue", lwd=0.8, border=0, xlim=c(107,108), ylim=c(32,35))
# points(shaanxi_long_lat, xlim=c(107,108), ylim=c(32,35))
# axis(1)
# axis(2)
# #
# 
# shaanxi_intercept <- over(shaanxi_long_lat_sp, shaanxi_shapefile_sp)
# shaanxi_intercept <- shaanxi_intercept[apply(!is.na(shaanxi_intercept), 1, any), ]
# dim(shaanxi_intercept)
# shaanxi_intercept
# 
# # VILLAGES ----------------------------------------------------------------
# 
# #####
# #Shaanxi villages
# #load the shapefile
# setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_village")
# shaanxi_v_shapefile <- readOGR(dsn=".", layer="陕西")
# 
# #shapefile glimpse shows 5 slots: @data, @polygons, @plotOrder, @bbox and proj4string
# glimpse(shaanxi_v_shapefile)
# 
# #load the longitude latitude data SAMPLE
# setwd("/rds/general/user/syl416/home/MScProject/Shaanxi")
# shaanxi_sample <- readRDS("dataset_shaanxi_sample_1000.rds")
# 
# #extract the longitude and latitudes
# shaanxi_lat_long <- shaanxi_sample[,c("Latitude","Longitude")]
# shaanxi_long_lat <- shaanxi_lat_long %>% select(Longitude, everything())
# ggplot(shaanxi_long_lat) +
#   geom_point(aes(x=Longitude, y=Latitude), size=0.5)
# 
# #attempt1: using spatial points
# nrow(shaanxi_long_lat)
# shaanxi_long_lat <- shaanxi_long_lat[!is.na(shaanxi_long_lat$Latitude), ]
# shaanxi_long_lat <- shaanxi_long_lat[!is.na(shaanxi_long_lat$Longitude), ]
# nrow(shaanxi_long_lat)
# 
# shaanxi_long_lat_sp = SpatialPoints(cbind(shaanxi_long_lat$Longitude, shaanxi_long_lat$Latitude), proj4string = CRS("+proj=longlat +datum=WGS84"))
# class(shaanxi_long_lat_sp)
# 
# shaanxi_v_shapefile_sp <- spTransform(shaanxi_v_shapefile, CRS("+proj=longlat +datum=WGS84"))
# 
# par(mar=c(4,4,2,2))
# plot(shaanxi_v_shapefile_sp, col="coral", bg="skyblue", lwd=0.8, border=0)
# points(shaanxi_long_lat_sp, col = "black", pch=19, cex=0.3)
# axis(1)
# axis(2)
# title(main = "Shaanxi Villages", 
#       xlab = "Longitude", ylab = "Latitude")
# 
# shaanxi_v_intercept <- over(shaanxi_long_lat_sp, shaanxi_v_shapefile_sp)
# shaanxi_v_intercept <- shaanxi_v_intercept[apply(!is.na(shaanxi_v_intercept), 1, any), ]
# dim(shaanxi_v_intercept)
# shaanxi_v_intercept
# 
# 
# # raster ------------------------------------------------------------------
# library(raster)
# library(terra)
# #library(rgeos)
# 
# # install.packages('terra', repos='https://rspatial.r-universe.dev')
# # install.packages('raster')
# liaoning_xyz <- liaoning_sample[,c("Longitude","Latitude","PM2.5")]
# liaoning_xy <-  liaoning_sample[,c("Longitude","Latitude")]
# head(liaoning_xyz)
# rasterFromXYZ(liaoning_xyz)
# rasterFromXYZ(liaoning_xy)
# 
# liaoning_vect <- vect(liaoning_xy, geom=c("Longitude", "Latitude"), crs="")
# rasterize(liaoning_xy)
# 
# 
# 
# #attempt2: using ggplot
# #use tidy to get the data into the right format for ggplot
# shapefile_tidy <- tidy(shapefile) #this removes the @data attributes but it can be added later with a left join.
# 
# ggplot(shapefile_tidy, aes(x = long, y = lat, group = group)) +
#   geom_polygon(color = "black", size = 0.1, fill = "lightgrey") +
#   coord_equal() +
#   theme_minimal()
# 
# #add back the data attributes
# shapefile$id <- row.names(shapefile)
# shapefile_tidy <- left_join(shapefile_tidy, shapefile@data)
# 
# #######
# #add in the pollution data!!
# #######
# 
# 
# 
