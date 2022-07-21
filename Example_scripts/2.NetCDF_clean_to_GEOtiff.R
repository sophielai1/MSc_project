# read in shapefile 

# import all points, clip on WGS 84

# read in netcdf reading

# clip the readings to shapefile


### ------

# change strategy completely 
# clean the netcdf data in R and show it in ArcGis 

# load packages
library(ncdf4) # package for netcdf manipulation
library(raster) # package for raster manipulation
library(rgdal) # package for geospatial analysis
library(ggplot2) # package for plotting
library(fields)
library(oce)

# nc_data <- read.netcdf("data/ECHAP_PM2.5_Y1K_2016_V3.nc")
nc_data <- read.netcdf("data/ECHAP_PM2.5_Y1K_2017_V3.nc")

pm<-nc_data@data$PM2.5
pm[pm==-999]<-NA
range(pm[!is.na(pm)])
lat<-nc_data@data$Lat
lon<-nc_data@data$Lon

r <- raster(t(pm), ymn=min(lat), 
            ymx=max(lat), xmn=min(lon), 
            xmx=max(lon), 
            crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))

# writeRaster(r, filename = 'output-maps/ECHAP_PM2.5_Y1K_2016_V3.tiff', format = 'GTiff', overwrite = T)
writeRaster(r, filename = 'output-maps/ECHAP_PM2.5_Y1K_2017_V3.tiff', format = 'GTiff', overwrite = T)

# export the cleaned netcdf dataset 
filename <- "data/ECHAP_PM2.5_Y1K_2016_V3.nc"
dim <- ncdim_def( "X", "inches", 1:12 )

# try to do a loop 

dir.nc <- 'data/PM25_1k/'
files.nc <- list.files(dir.nc, full.names = T, recursive = T)
dir.output <- 'output-maps/'

for (i in 1:length(files.nc)) {
  nc_data <- read.netcdf(files.nc[i])
  pm<-nc_data@data$PM2.5
  pm[pm==-999]<-NA
  lat<-nc_data@data$Lat
  lon<-nc_data@data$Lon
  r <- raster(t(pm), ymn=min(lat), 
              ymx=max(lat), xmn=min(lon), 
              xmx=max(lon), 
              crs=CRS("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs+ towgs84=0,0,0"))
  
  writeRaster(r, paste(dir.output, substr(files.nc[i],14,36), '.tiff', sep = ''), format = 'GTiff', overwrite = T)
}

files.nc <-files.nc[19:21]
