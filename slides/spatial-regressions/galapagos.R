setwd('~/Documents/teaching/Geog315/lectures/spatial-regressions')

library(sf)
library(tmap)

g <- st_read('galapagos.shp')
gt <- read.csv('galapagos.txt', sep=',')

gtt <- g %>% 
  select(4) %>% 
  mutate(Name=as.character(name)) %>%
  mutate(name=Name) %>%
  select(1) %>%
  inner_join(gt, by=c('name'='ISLAND')) %>%
  select(-2)

as_tibble(gtt)

m1 <- lm(NATIVE ~ AREA + ELEV + NEAREST + S_CRUZ + AREA_ADJ, g.d)
summary(m1)

m2 <- lm(NATIVE ~ ELEV + AREA_ADJ, g.d)
summary(m2)

gtt <- gtt %>%
  mutate(m2.f = m2$fitted.values,
         m2.r = m2$residuals)

tm_shape(gtt) + tm_polygons(col='m2.r')
tm_shape(gtt) + tm_polygons(col='NATIVE')
