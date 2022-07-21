# start_time <- Sys.time()
# end_time <- Sys.time()
# end_time - start_time

library(sf)
library(dplyr)

# county ------------------------------------------------------------------
##load the longitude latitude data 
setwd("/rds/general/user/syl416/home/MScProject/Liaoning")
province <- readRDS("6_dataset_liaoning_sample_1000.rds")
lon_lat_pm25 <- province
dim(lon_lat_pm25)
head(lon_lat_pm25)

##convert to an object of class sf
lon_lat_pm25_sp <- st_as_sf(lon_lat_pm25, coords=c("Longitude", "Latitude"))

setwd("/rds/general/user/syl416/home/MScProject/Shapefile/Map_CAS_county")
shp <- read_sf("辽宁.shp")
dim(shp)
head(shp)

## make sure coordinate systems projections are the same
shp <- st_transform(shp, crs="+proj=longlat +datum=WGS84")
lon_lat_pm25_sp <- lon_lat_pm25_sp %>% st_set_crs(st_crs(shp))
st_crs(shp) == st_crs(lon_lat_pm25_sp)  # should return TRUE

#st_intersection
start_time <- Sys.time()
intersect <- st_intersection(shp, lon_lat_pm25_sp)
end_time <- Sys.time()
st_intersection_time <- end_time - start_time #0.01571941 secs
print(st_intersection_time)
dim(intersect)
head(intersect)

#st_intersects then st_intersection on smaller subset
start_time <- Sys.time()
lon_lat_pm25_sp_subset <- lon_lat_pm25_sp[st_intersects(lon_lat_pm25_sp, shp) %>% lengths > 0,]
intersect_subset <- st_intersection(shp, lon_lat_pm25_sp_subset)
end_time <- Sys.time()
st_intersects_subset_time <- end_time - start_time #0.04073143 secs
print(st_intersects_subset_time)
dim(intersect_subset)
head(intersect_subset)











##load shapefiles
#only needed for village
sf::sf_use_s2(FALSE)




