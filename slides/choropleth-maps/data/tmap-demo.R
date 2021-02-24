# Load some libraries
library(sf)
library(tmap)
library(dplyr)

# set the working directory
setwd("~/Documents/teaching/Geog315/lectures/choropleth-maps/data")

# read Auckland data set
ak <- st_read("ak-region-ethnicity.gpkg")

# take a look at the data table
as_tibble(ak)

# basic map
tm_shape(ak) + 
  tm_polygons()

# map of the percentage European population

# default colours and breaks
# but put the legend top left, and make the lines a bit thinner (with lwd)
tm_shape(ak) +
  tm_polygons(col = "EUR_P_06", lwd = 0.35) +
  tm_legend(legend.position = c("LEFT", "TOP"))

# change the number of classes
tm_shape(ak) +
  tm_polygons(col = "EUR_P_06", n = 9, lwd = 0.35) +
  tm_legend(legend.position = c("LEFT", "TOP"))

# change the colours
tm_shape(ak) +
  tm_polygons(col = "EUR_P_06", palette = "Reds", lwd = 0.35) +
  tm_legend(legend.position = c("LEFT", "TOP"))

# Again but reverse the direction
tm_shape(ak) +
  tm_polygons(col = "EUR_P_06", palette = "-Reds", lwd = 0.35) +
  tm_legend(legend.position = c("LEFT", "TOP"))

# Other colour palettes are available
library(tmaptools)
palette_explorer()

# Finally we can classify the data differently
tm_shape(ak) +
  tm_polygons(col = "EUR_P_06", style="quantile", palette = "YlGnBu", lwd = 0.35) +
  tm_legend(legend.position = c("LEFT", "TOP"))

tm_shape(ak) +
  tm_polygons(col = "EUR_P_06", style="quantile", palette = "YlGnBu", lwd = 0.35) +
  tm_legend(legend.position = c("LEFT", "TOP"))

tm_shape(ak) +
  tm_polygons(col = "EUR_P_06", style="fisher", palette = "YlGnBu", lwd = 0.35) +
  tm_legend(legend.position = c("LEFT", "TOP"))

tm_shape(ak) +
  tm_polygons(col = "EUR_P_06", style="jenks", palette = "YlGnBu", lwd = 0.35) +
  tm_legend(legend.position = c("LEFT", "TOP"))

# and we can put all this in a web map (when we may want to make the layer transparent)
tmap_mode('view')
tm_shape(ak) +
  tm_polygons(col = "EUR_P_06", style="quantile", palette = "YlGnBu", lwd = 0.35, alpha = 0.65) +
  tm_legend(legend.position = c("LEFT", "TOP"))
