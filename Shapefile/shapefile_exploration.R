#install.packages("maptools")
library(maptools) #will be replaced by sp package by end of 2023
#install.packages("sp")
library(sp)
#install.packages("rgdal")
library(rgdal)
#install.packages("broom")
library(broom)
#install.packages("ggplot2")
library(ggplot2)


# county data -------------------------------------------------------------
setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_county")
shanxi <- readOGR("山西.shp")

#summary tells you the max and min coordinates, the kind of projection in use
summary(shanxi)

#length tells you how many regions you have
length(shanxi) #29

#head shows the first few rows of the data slot associated with the regions
head(shanxi@data)

#basic plot of this shape file:
par(mar=c(0,0,0,0))
plot(shanxi, col="coral", bg="skyblue", lwd=1, border=0 )

#'fortify' the data to get a dataframe format required by ggplot2
shanxi_fortified <- tidy(shanxi, region="省")

#plots the villages within the province?
ggplot() +
  geom_polygon(data = shanxi_fortified, aes( x = long, y = lat, group = group), fill="#69b3a2", color="white") +
  theme_void() 


# village data ------------------------------------------------------------
setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_village")
shanxi_village <- readOGR("山西.shp")
summary(shanxi_village)
length(shanxi_village) #861
head(shanxi_village@data)
#basic plot of this shape file:
par(mar=c(0,0,0,0))
plot(shanxi_village, col="coral", bg="skyblue", lwd=0.5, border=0 )

#'fortify' the data to get a dataframe format required by ggplot2
shanxi_village_fortified <- tidy(shanxi_village, region="BSM")
ggplot() +
  geom_polygon(data = shanxi_village_fortified, aes( x = long, y = lat, group = group), fill="#69b3a2", color="white") +
  theme_void() 

