# Regularly updated maps of COVID in the US
# Demonstration of open data for Geog 315, 2021

# grab the data see: 
library(COVID19)
c19_us <- covid19(country = "US", level = 3, start = Sys.Date() - 2) 

# process it into spatial form
library(sf)
library(dplyr)
c19_us <- c19_us %>%
  filter(!is.na(latitude), !(administrative_area_level_2 %in% c("Alaska", "Hawaii"))) %>%
  st_as_sf(coords = c("longitude", "latitude"), crs = 4326) %>%
  st_transform(5070)
  
# add prevalence and death rate attributes
library(dplyr)
c19_us <- c19_us %>%
  mutate(prevalence = confirmed / population,
         death_rate = deaths / population)

# make a map
## with tmap - static map
library(tmap)
tmap_mode('plot')
tm_shape(c19_us) + 
  tm_dots(col = "death_rate", size = "prevalence", scale = 1,
             palette = "viridis", style = "quantile", alpha = 0.5) +
  tm_layout(legend.position = c("RIGHT", "BOTTOM"))

## with tmap - web map
tmap_mode('view')
tm_shape(c19_us) + 
  tm_dots(col = "death_rate", size = "prevalence", scale = 0.5,
          palette = "viridis", style = "quantile", alpha = 0.5)

## with ggplot and plotly
library(ggplot2)
library(plotly)
ggmap <- ggplot(c19_us) + 
  geom_sf(aes(color = death_rate, size = prevalence), alpha = 0.5) + 
  scale_color_viridis_c() +
  theme_minimal()
ggmap
ggplotly(ggmap)
