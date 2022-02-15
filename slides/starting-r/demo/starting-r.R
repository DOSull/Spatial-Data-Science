setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

x <- 3 
y <- c(2, 4, 7, 11, 17) 
z <- data.frame(a = 1:1000, b = rep(5, 1000), c = rnorm(1000))

x ^ 2 
x 
x <- x ^ 2 
x

z$a

plot(z$a, z$a ^ 2, type = "line") 
plot(z) 
boxplot(z$c) 
hist(z$c)

library(sf) 
library(tmap)

welly <- st_read("welly.geojson") 
plot(welly) 
names(welly)

tm_shape(welly) + 
  tm_polygons(col = "Median_Age_UR13")

tm_shape(welly) + 
  tm_polygons(col = "PopUR13", palette = "YlGnBu")

tmap_mode('view') 
tm_shape(welly) + 
  tm_polygons(col = "PopUR13", palette = "YlGnBu", 
              alpha = 0.5, title = "Population 2013")
