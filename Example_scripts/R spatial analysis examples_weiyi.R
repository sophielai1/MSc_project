# useful packages for spatial analysis 
library(sp)
library(sf)
library(rgdal)
library(raster)
library(rgeos)
library(shapefiles)

#################
#### RASTERS ####
#################
# IMPORT RASTER 
roadlenmaj_1000 <- raster("2.raster/roadlenmaj_1000.tif")
crs(roadlenmaj_1000) <- crs('+init=EPSG:27700')
plot(roadlenmaj_1000)

# extract point values from raster
roadlenmaj_1000_pt <- extract(roadlenmaj_1000,pt.xy) 

# set up an 'empty' raster
day0 <- pred_result[pred_result[,1]==1,]
e <- extent(day0[,2:3])
ras.frame <- raster(e,res=25,crs="+init=epsg:27700") 
# create raster for each day
for (i in c(1:365)) {
  day <- pred_result[pred_result[,1]==i,]
  assign(paste0("ras.day",i), rasterize(day[, 2:3], ras.frame, day[,4]))
  
}

# crop raster/mask extract by polygon
raster_crop <- crop(raster, extent(area), snap="out")                    
ras.poly <- rasterize(area, raster_crop)   
result <- mask(x=raster_crop, mask=ras.poly)

##############################
####### CONVERT COORDS #######
##############################
pts <- read.csv("")
nrow(pts)
pts <- pts[!is.na(pts$lat), ]
pts <- pts[!is.na(pts$lon), ]

cord.dec = SpatialPoints(cbind(pts$lon, pts$lat), proj4string = CRS("+init=epsg:4326"))
cord.BNG <- spTransform(cord.dec, CRS("+init=epsg:27700")) # to BNG
pts.xy <- data.frame(cord.BNG@coords)

##############################
#### INTERSECT SHAPEFILES ####
##############################
### load shapefiles
pc <- read_sf("EDINA_PC/2019/pc_2019_GB_update.shp")
bdr_coa01 <- read_sf("Boundaries/COA2001_GB.shp")

### make sure coordinate systems projections are the same
pc <- st_transform(pc, "+init=epsg:27700")
bdr_coa01 <- bdr_coa01 %>% st_set_crs(st_crs(pc))
st_crs(pc) == st_crs(bdr_coa01)  # should return TRUE

# note: this is intersect, out-of-boundary points would be EXCLUDED
pc2019_01 <- st_intersection(pc,bdr_coa01)
names(pc2019_01)[1:13] <- c("year","postcode","xcoordinat","ycoordinat",
                            "oa11","coa11","lsoa11","msoa11",
                            "lad11","ed81","coa01","lsoa01","ladua01")
# save intersect output
sf::st_write(pc2019_01, "SAHSU_PC_2017/pc2019_810111_intersects_update.shp") 

#########################
#### JOIN SHAPEFILES ####
#########################
pc.join <- left_join(pc, data.frame(pc2019_11)[,c(1,5:8)], by='PC19')

