
##### load packages and libraries --------
install.packages("ncdf4")
install.packages("raster")
install.packages("rgdal")
install.packages("ggplot2")
install.packages("fields")
install.packages("oce")


library(ncdf4) # package for netcdf manipulation
library(raster) # package for raster manipulation
library(rgdal) # package for geospatial analysis
library(ggplot2) # package for plotting
library(fields)
library(oce)


#### read in the netCDF file ----
# fn<- "C:\\Users\\localuser\\Downloads\\ECHAP_PM2.5_Y1K_2017_V3.nc"
# getwd()
#nc_data <- nc_open("ECHAP_PM2.5_Y1K_2017_V3.nc")
nc_data <- read.netcdf("data/ECHAP_PM2.5_Y1K_2016_V3.nc")
print(nc_data)

pm<-nc_data@data$PM2.5
pm[pm==-999]<-NA
range(pm[!is.na(pm)])
lat<-nc_data@data$Lat
lon<-nc_data@data$Lon

r <- raster(t(pm), ymn=min(lon), 
            ymx=max(lon), xmn=min(lat), 
            xmx=max(lat), 
            crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
# r <- flip(r, direction='y')
plot(r)

#########target area extraction
lat_rng = c(37.752169,39.174854)
lon_rng = c(114.199888,115.724241)

lat_ind = which(lat >= lat_rng[1]
                & lat <= lat_rng[2])
lon_ind = which(lon >= lon_rng[1]
                & lon <= lon_rng[2])

pm_new<-pm[lon_ind,lat_ind]

r1 <- raster(t(pm_new), xmn=min(lon[lon_ind]), 
            xmx=max(lon[lon_ind]), 
            ymn=min(lat[lat_ind]), 
            ymx=max(lat[lat_ind]), 
            crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
# r1 <- flip(r1, direction='y')
plot(r1)

## ----- second create a China/provincial shapefile via osm
## ----- as we look at rural areas of a certain Chinese 
## ----- provinces, such shapefiles are not easily avialable 
### ---- try method 1, create shapefile from osm data
install.packages("osmdata")
install.packages("sf")
library(sf)
library(osmdata)
library(ggplot2)

bb <- getbb ("Beijing", format_out = "polygon")
dim(bb[[1]][[1]])

bb_sf <- getbb ("Pingluo", format_out = "sf_polygon")
sf:::plot.sf(bb_sf)

my_bbox <- c(106.110809,38.642558,106.820734,39.356312)

roads_to_import <- c('primary', 'secondary', 'motorway', 'trunk', 'tertiary', 'unclassified', 'residential', 
                            'primary link','trunk link', 'motorway link', 'secondary link')

q <- opq(bbox = my_bbox) %>% 
  add_osm_feature(key = "highway", value = roads_to_import) %>% 
  osmdata_sf()

ggplot() +
  
  geom_sf(data = q$osm_lines)

install.packages("maptools")
library(maptools)
q_shp <- as_sp(q, "lines")

## summary: I have again confused with sp, sf pacakges and
## how these can help produce shapefiles 

### ---- try method 2, create kml file from google earth 
##  then convert the kml file into shapefile via GIS/QGIS
##  I always know this will work but it does not incorporate
##  into R coding very well 
##  but the map quality looks better than osm 

## ----- third clip raster data (exposure) to the shapefile 
library(raster)
library(rgdal)
library(sf)

r1_crop <- crop(r1,q$osm_lines)

plot (r1_crop)

## ----- fourth add village coordinate points 

## ----- lastly create leaflet plot

# lat = ncvar_get(nc_data,"Lat")
# lon = ncvar_get(nc_data,"Lon")
# #tm = ncvar_get(nc_data,"time")
# 
# anom = ncvar_get(nc_data,"PM2.5",
#                  start=c(1000,1000), 
#                  count =c(100,100))
 
# #### check provincial/city data by GPS box -------------
# ## Hebei & Shanxi 
## Luquan study site - industrial level & urbanisation
## also cover anguo
lat_rng = c(37.752169,39.174854)
lon_rng = c(114.199888,115.724241)
# 
# lat_ind = which(lat >= lat_rng[1]
#                 & lat <= lat_rng[2])
# lon_ind = which(lon >= lon_rng[1] 
#                 & lon <= lon_rng[2])
# 
# pm25 = ncvar_get(nc_data,"PM2.5",start=c(lon_ind[1],lat_ind[1]), 
#                  count =c(length(lon_ind),length(lat_ind)))
# 
# fillvalue <- ncatt_get(nc_data, "PM2.5", "fill_Value")
# fillvalue # fill_value is TRUE, -999, but not shown here? 
# 
# pm25[pm25 == "-999"] <- NA
# 
# 
# dim(pm25)
# image.plot(pm25)
# r <- raster(t(pm25), xmn=min(lon_rng), 
#             xmx=max(lon_rng), ymn=min(lat_rng), 
#             ymx=max(lat_rng), 
#             crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
# # r <- flip(r, direction='y')
# plot(r)
# 
## take a look at whole Hebei
lat_rng = c(30.752169,42.174854)
lon_rng = c(110.199888,120.724241)
# 
# ## take a look at Luquan 
lat_rng = c(37.807525,38.337260)
lon_rng = c(114.130983,114.941225)
# 
# ## take a look at Shanxi
lat_rng = c(35.429239,36.434439)
lon_rng = c(112.292265,113.561186)
# 
# ## take a look at changzhi 
lat_rng = c(36.023299,36.358564)
lon_rng = c(112.812066, 113.316751)
# 
# ## take a look at finer 
lat_rng = c(36.1,36.2)
lon_rng = c(113.1,113.2)
# 
# # Ningxia shizuishan site 
lat_rng = c(38.642558,39.356312)
lon_rng = c(106.110809,106.820734)
# 
# # liaoning shizuishan site 
# lat_rng = c(38.842558,41.068767)
# lon_rng = c(106.110809,106.5)
# 
# lat_ind = which(lat >= lat_rng[1]
#                 & lat <= lat_rng[2])
# lon_ind = which(lon >= lon[1] 
#                 & lon <= lon_rng[2])
# 
# pm25 = ncvar_get(nc_data,"PM2.5",start=c(lon_ind[1],lat_ind[1]), 
#                  count =c(length(lon_ind),length(lat_ind)))
# 
# # fillvalue <- ncatt_get(nc_data, "PM2.5", "fill_Value")
# # fillvalue # fill_value is TRUE, -999, but not shown here? 
# # 
# pm25[pm25 == "-999"] <- NA
# 
# dim(pm25)
# image.plot(pm25)
# r <- raster(t(pm25), xmn=min(lon_rng), 
#             xmx=max(lon_rng), ymn=min(lat_rng), 
#             ymx=max(lat_rng), 
#             crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
# # r <- flip(r, direction='y')
# plot(r)
