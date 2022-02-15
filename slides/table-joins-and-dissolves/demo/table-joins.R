setwd("~/Documents/teaching/Geog315/slides/table-joins-and-dissolves/data")

library(dplyr)
library(sf)
library(tmap)

x <- st_read("extent.gpkg")

pts <- st_sample(x, 20) %>% 
  st_sf(crs = 2193)

p1 <- pts %>%
  slice(1:14) %>%
  st_union() %>%
  st_voronoi() %>%
  st_cast()  %>%
  st_as_sf() %>%
  rename(geometry = x) %>%
  st_intersection(x) %>%
  mutate(id = 1:14, 
         x1 = 100 + id)

p1c <- p1 %>%
  st_centroid() %>%
  select(-x1) %>%
  mutate(xc = 300 + id)

p2 <- pts %>%
  slice(7:20) %>%
  mutate(id = 7:20, 
         x2 = 200 + id)

df1 <- p1 %>%
  st_drop_geometry()

df2 <- p2 %>%
  st_drop_geometry()

# check them out
as_tibble(df1)
as_tibble(df2)

## Various joins

# inner_join only retains the matching cases.
inner_join(df1, df2)

# left_join retains all records from the first table, 
# regardless of whether there is a matching record in the second.
left_join(df1, df2)

# right_join` is the opposite - all rows in the second 
# table are retained whether or not there is a match.
right_join(df1, df2)

# Finally (not really there are a couple of other obscurities...),
# full_join retains all records across both tables regardless of matches.
full_join(df1, df2)

## If variable names don't match
# Either change them, or tell the function what to use explicitly
df3 <- df2 %>%
  rename(ID = id) # a copy of df2 but wth a no matching variable name

inner_join(df1, df3) # this will error

# to make it work, do this:
inner_join(df1, df3, by = c("id" = "ID"))


# if the types of the match variable don't match, it won't work:
df4 <- df2 %>% 
  mutate(id = as.character(id))
inner_join(df1, df4)


# Spatial joins
as_tibble(p1)
as_tibble(p1c)

tm_shape(p1) + 
  tm_polygons(col = "id", palette = "Reds", alpha = 0.5) + 
  tm_shape(p2) + 
  tm_dots(col = "id", palette = "Blues", alpha = 0.5) +
  tm_text(text = "id", just = c(0, 1))

# where there's a one-to-one match it's simple
st_join(p1, p1c)

# when there are one-to-many matches, you get duplicates
p1_p2 <- st_join(p1, p2)
p2_p1 <- st_join(p2, p1)


