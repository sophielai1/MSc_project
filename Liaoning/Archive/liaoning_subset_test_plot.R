library(sf)
library(dplyr)

##load the longitude latitude data 
setwd("/rds/general/user/syl416/home/MScProject/Liaoning")
province <- readRDS("6_dataset_liaoning_sample_1000.rds")
#lon_lat_pm25 <- province[,c("Longitude","Latitude", "PM2.5")]
lon_lat_pm25 <- province
dim(lon_lat_pm25)

##convert to an object of class sf
lon_lat_pm25_sp <- st_as_sf(lon_lat_pm25, coords=c("Longitude", "Latitude"))

##load shapefiles
setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_county")
shp <- read_sf("辽宁.shp")
dim(shp)

## make sure coordinate systems projections are the same
shp <- st_transform(shp, crs="+proj=longlat +datum=WGS84")
lon_lat_pm25_sp <- lon_lat_pm25_sp %>% st_set_crs(st_crs(shp))
st_crs(shp) == st_crs(lon_lat_pm25_sp)  # should return TRUE

## note: this is intersect, out-of-boundary points would be EXCLUDED
intersect <- st_intersection(shp, lon_lat_pm25_sp)

head(intersect)
dim(intersect)
class(intersect)

## save intersect output
setwd("/rds/general/user/syl416/home/MScProject/Liaoning/Archive")
sf::st_write(intersect, "liaoning_subset_test_plot.shp", layer_options = "ENCODING=UTF-8", append=FALSE) 

##plot
#read new subset shapefile
subset_pm25 <- read_sf("liaoning_subset_test_plot.shp")

#convert to dataframe
subset_pm25_df <- data.frame(subset_pm25)
head(subset_pm25_df)

#check how many points are in each area
table(table(unique(subset_pm25_df$乡)))

#aggregate the points
#group by town and year
group_pm25 <- subset_pm25_df %>%
  group_by(乡, year) %>%
  summarise(PM2_5_avg=mean(PM2_5))
head(group_pm25)

group_pm25_2015 <- group_pm25[group_pm25$year==2015,]
group_pm25_2016 <- group_pm25[group_pm25$year==2016,]
group_pm25_2017 <- group_pm25[group_pm25$year==2017,]
group_pm25_2018 <- group_pm25[group_pm25$year==2018,]
group_pm25_2019 <- group_pm25[group_pm25$year==2019,]
group_pm25_2020 <- group_pm25[group_pm25$year==2020,]

#join dataframes
group_pm25_join_2015 <- left_join(shp, group_pm25_2015, by='乡')
group_pm25_join_2016 <- left_join(shp, group_pm25_2016, by='乡')
group_pm25_join_2017 <- left_join(shp, group_pm25_2017, by='乡')
group_pm25_join_2018 <- left_join(shp, group_pm25_2018, by='乡')
group_pm25_join_2019 <- left_join(shp, group_pm25_2019, by='乡')
group_pm25_join_2020 <- left_join(shp, group_pm25_2020, by='乡')

pdf("liaoning_plot_test_2015.pdf")
plot(group_pm25_join_2015["PM2_5_avg"], axes=TRUE, main="Liaoning PM2.5: 2015")
dev.off()

pdf("liaoning_plot_test_2016.pdf")
plot(group_pm25_join_2016["PM2_5_avg"], axes=TRUE, main="Liaoning PM2.5: 2016")
dev.off()

pdf("liaoning_plot_test_2017.pdf")
plot(group_pm25_join_2017["PM2_5_avg"], axes=TRUE, main="Liaoning PM2.5: 2017")
dev.off()

pdf("liaoning_plot_test_2018.pdf")
plot(group_pm25_join_2018["PM2_5_avg"], axes=TRUE, main="Liaoning PM2.5: 2018")
dev.off()

pdf("liaoning_plot_test_2019.pdf")
plot(group_pm25_join_2019["PM2_5_avg"], axes=TRUE, main="Liaoning PM2.5: 2019")
dev.off()

pdf("liaoning_plot_test_2020.pdf")
plot(group_pm25_join_2020["PM2_5_avg"], axes=TRUE, main="Liaoning PM2.5: 2020")
dev.off()


######
#join shapefiles
shp_subset <- left_join(shp, subset_pm25_df[,c(4,8:13)], by='乡')
head(shp_subset)
dim(shp_subset)

#plot and save plot
pdf("liaoning_plot_test.pdf")
plot(shp_subset["PM2_5"], axes=TRUE, main="Liaoning PM2.5")
dev.off()


