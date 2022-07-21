library(sf)
library(dplyr)

##load the longitude latitude data 
setwd("/rds/general/user/syl416/home/MScProject/Liaoning")
province <- readRDS("6_dataset_liaoning_sample_1000.rds")
#lon_lat_pm25 <- province[,c("Longitude","Latitude", "PM2.5")]
lon_lat_pm25 <- province
dim(lon_lat_pm25)
head(lon_lat_pm25)

##convert to an object of class sf
lon_lat_pm25_sp <- st_as_sf(lon_lat_pm25, coords=c("Longitude", "Latitude"))

##load shapefiles
#only needed for village
sf::sf_use_s2(FALSE)

setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_village")
shp <- read_sf("辽宁.shp")
dim(shp)
head(shp)
## make sure coordinate systems projections are the same
shp <- st_transform(shp, crs="+proj=longlat +datum=WGS84")
lon_lat_pm25_sp <- lon_lat_pm25_sp %>% st_set_crs(st_crs(shp))
st_crs(shp) == st_crs(lon_lat_pm25_sp)  # should return TRUE

## note: this is intersect, out-of-boundary points would be EXCLUDED
intersect <- st_intersection(shp, lon_lat_pm25_sp)
#the below is quicker but only either gives back a subset of the shapefile
#or a subset of the PM2.5 file.
intersect2 <- lon_lat_pm25_sp[st_intersects(shp, lon_lat_pm25_sp) %>% lengths > 0,]
intersect3 <- st_intersection(lon_lat_pm25_sp, intersect2)

dim(intersect2)
head(intersect2)

dim(intersect3)
head(intersect3)

head(intersect)
dim(intersect)
class(intersect)

## save intersect output
setwd("/rds/general/user/syl416/home/MScProject/Liaoning/Archive")
sf::st_write(intersect, "liaoning_subset_test_plot_village.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 

##plot
#read new subset shapefile
subset_pm25 <- read_sf("liaoning_subset_test_plot_village.shp")

#convert to dataframe
subset_pm25_df <- data.frame(subset_pm25)
head(subset_pm25_df)

#check how many points are in each area
table(table(unique(subset_pm25_df$XZQMC)))

#aggregate the points
#group by town and year
group_pm25 <- subset_pm25_df %>%
  group_by(XZQMC, year) %>%
  summarise(PM2_5_avg=mean(PM2_5))
head(group_pm25)

group_pm25_2015 <- group_pm25[group_pm25$year==2015,]
group_pm25_2016 <- group_pm25[group_pm25$year==2016,]
group_pm25_2017 <- group_pm25[group_pm25$year==2017,]
group_pm25_2018 <- group_pm25[group_pm25$year==2018,]
group_pm25_2019 <- group_pm25[group_pm25$year==2019,]
group_pm25_2020 <- group_pm25[group_pm25$year==2020,]

#add in GridID, TileID, day, date
group_pm25_2015 <- left_join(group_pm25_2015, subset_pm25_df[,c(3,6,7,8:10)], by="XZQMC")
group_pm25_2016 <- left_join(group_pm25_2016, subset_pm25_df[,c(3,6,7,8:10)], by="XZQMC")
group_pm25_2017 <- left_join(group_pm25_2017, subset_pm25_df[,c(3,6,7,8:10)], by="XZQMC")
group_pm25_2018 <- left_join(group_pm25_2018, subset_pm25_df[,c(3,6,7,8:10)], by="XZQMC")
group_pm25_2019 <- left_join(group_pm25_2019, subset_pm25_df[,c(3,6,7,8:10)], by="XZQMC")
group_pm25_2020 <- left_join(group_pm25_2020, subset_pm25_df[,c(3,6,7,8:10)], by="XZQMC")

#join dataframes
group_pm25_join_2015 <- left_join(shp, group_pm25_2015, by='XZQMC')
group_pm25_join_2016 <- left_join(shp, group_pm25_2016, by='XZQMC')
group_pm25_join_2017 <- left_join(shp, group_pm25_2017, by='XZQMC')
group_pm25_join_2018 <- left_join(shp, group_pm25_2018, by='XZQMC')
group_pm25_join_2019 <- left_join(shp, group_pm25_2019, by='XZQMC')
group_pm25_join_2020 <- left_join(shp, group_pm25_2020, by='XZQMC')

#save the above
setwd("/rds/general/user/syl416/home/MScProject/Liaoning/Archive/Village_shapefile")
sf::st_write(group_pm25_join_2015, "liaoning_subset_village_2015.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
sf::st_write(group_pm25_join_2016, "liaoning_subset_village_2016.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
sf::st_write(group_pm25_join_2017, "liaoning_subset_village_2017.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
sf::st_write(group_pm25_join_2018, "liaoning_subset_village_2018.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
sf::st_write(group_pm25_join_2019, "liaoning_subset_village_2019.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 
sf::st_write(group_pm25_join_2020, "liaoning_subset_village_2020.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 

#plots
pdf("liaoning_plot_test_2015_village.pdf")
plot(group_pm25_join_2015["PM2_5_avg"], axes=TRUE, main="Liaoning Village PM2.5: 2015")
dev.off()

pdf("liaoning_plot_test_2016_village.pdf")
plot(group_pm25_join_2016["PM2_5_avg"], axes=TRUE, main="Liaoning Village PM2.5: 2016")
dev.off()

pdf("liaoning_plot_test_2017_village.pdf")
plot(group_pm25_join_2017["PM2_5_avg"], axes=TRUE, main="Liaoning Village PM2.5: 2017")
dev.off()

pdf("liaoning_plot_test_2018_village.pdf")
plot(group_pm25_join_2018["PM2_5_avg"], axes=TRUE, main="Liaoning Village PM2.5: 2018")
dev.off()

pdf("liaoning_plot_test_2019_village.pdf")
plot(group_pm25_join_2019["PM2_5_avg"], axes=TRUE, main="Liaoning Village PM2.5: 2019")
dev.off()

pdf("liaoning_plot_test_2020_village.pdf")
plot(group_pm25_join_2020["PM2_5_avg"], axes=TRUE, main="Liaoning Village PM2.5: 2020")
dev.off()


######
# #join shapefiles
# shp_subset <- left_join(shp, subset_pm25_df[,c(3,6,7,8:10)], by='XZQMC')
# head(shp_subset)
# dim(shp_subset)
# 
# #plot and save plot
# pdf("liaoning_plot_test_village.pdf")
# plot(shp_subset["PM2_5"], axes=TRUE, main="Liaoning Village PM2.5")
# dev.off()


