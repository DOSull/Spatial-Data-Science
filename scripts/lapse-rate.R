library(raster)
library(sf)
library(tmap)
library(ggplot2)
library(GGally) # for scatmat

# setwd("~/Documents/teaching/Geog315/slides/regression/data")

clim <- getData("worldclim", var = "tmin", res = 0.5, lon = 175, lat = -39)
elev <- getData("SRTM", lon = 175, lat = -39)

pts <- expand.grid(seq(175.5, 176.5, 0.05),
                   seq(-39, -38, 0.05))
pts.sf <- st_as_sf(pts, coords = 1:2, crs = 4326)

df <- data.frame(lon = pts[, 1],
                 lat = pts[, 2],
                 elevation = raster::extract(elev, pts),
                 t_min_july = raster::extract(clim[[7]], pts) / 10)


ggplot(df, aes(x = elevation, y = t_min_july)) + 
  geom_point() +
  xlab("Elevation, m") + 
  ylab("Minimum July temperature, C") +
  theme(text = element_text(size = 15))

ggplot(df, aes(x = elevation, y = t_min_july, colour = lat)) + 
  geom_point() +
  scale_colour_distiller(palette = "Spectral") + 
  xlab("Elevation, m") + 
  ylab("Minimum July temperature, C")


# crop the raster layers to make the mapping a bit easier
elev <- crop(elev, st_bbox(pts.sf %>% st_buffer(5000)))
clim <- crop(clim, st_bbox(pts.sf %>% st_buffer(5000)))

tmap_mode('view')
tm_shape(elev) + 
  tm_raster(style = "cont", title = "Elevation")+ 
  tm_shape(clim[[7]]) + 
  tm_raster(style = "cont", palette = "Blues", title = "Tmin, July") +
  tm_shape(pts.sf) + 
  tm_dots() + 
  tm_basemap("CartoDB.Voyager")

scatmat(df)

model <- lm(t_min_july ~ elevation, data = df)
model
summary(model)

ggplot(df, aes(x = elevation, y = t_min_july)) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  xlab("Elevation, m") + 
  ylab("Minimum July temperature, C") +
  theme(text = element_text(size = 15))

model2 <- lm(t_min_july ~ elevation + lat, data = df)
model2
summary(model2)
