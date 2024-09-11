library(sf)
library(tmap)
library(dplyr)

nz <- st_read('nz.gpkg')
quakes <- read.csv('earthquakes.csv')
quakes_sf <- quakes %>%
  st_as_sf(coords = c('NZMGE', 'NZMGN'), crs = st_crs(nz))

bigquakes <- filter(quakes_sf, MAG >= 4)

map <- tm_shape(nz, bbox = st_bbox(quakes_sf)) +
  tm_polygons(col = 'white', lwd = 0) +
  tm_layout(bg.color = 'powderblue') +
  tm_shape(bigquakes) +
  tm_bubbles(col = 'MAG', palette = 'Reds', alpha = 0.5) +
  tm_scale_bar()

map
