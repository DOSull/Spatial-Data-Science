setwd('~/Documents/teaching/Geog315/lectures/spatial-regressions')

library(sf)
library(tmap)
library(spatstat)
library(SDraw)


f <- factor(c('A', 'B', 'C', 'D'))

pp2 <- rpoispp(20/10000, win=owin(c(0, 100), c(0,100)))
pp2.sf <- st_as_sf(pp2) %>%
  filter(label!='window')

pp2.v <- voronoi.polygons(as(pp2.sf, 'Spatial')) %>% 
  st_as_sf() %>%
  mutate(label = sample(f, n(), replace=TRUE)) %>%
  group_by(label) %>%
  summarise() %>%
  mutate(area = st_area(.))

plot(pp2.v)

pp1 <- rThomas(10/10000, 5, 10, win=owin(c(0, 100), c(0,100)))
pp1.sf <- st_as_sf(pp1) %>%
  filter(label!='window')

pp1.counts <- pp1.sf %>%
  st_join(pp2.v) %>%
  group_by(label.y) %>%
  summarise(n=n()) %>%
  st_drop_geometry()

pp2.v <- pp2.v %>%
  left_join(pp1.counts, by=c('label'='label.y'))

pp2.v <- pp2.v %>%
  mutate(in_density = n / area) %>%
  mutate(out_density = (sum(n) - n) / (sum(area) - area)) %>%
  mutate(weight = in_density / out_density)

as_tibble(pp2.v)

tm_shape(pp2.v) + tm_fill(col='label') + tm_shape(pp1.sf) + tm_dots(scale=3) + tm_legend(outside=TRUE)
as_tibble(st_drop_geometry(pp2.v))
