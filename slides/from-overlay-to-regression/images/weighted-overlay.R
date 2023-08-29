library(spatstat)
library(sf)
library(ggplot2)
library(dplyr)


make_point_layer <- function(npts = 10) {
  rSSI(0.15, n = npts) %>% 
    st_as_sf() %>% 
    slice(-1) %>%
    select(-label)
}

make_binary_layer <- function(npts = 10) {
  bb <- list(
    matrix(c(-.05, -.05, 
             -.05, 1.05, 
             1.05, 1.05, 
             1.05, -.05, 
             -.05, -.05), byrow = TRUE, ncol = 2)) %>%
    st_polygon() %>%
    st_sfc()

  make_point_layer(n = npts) %>%
    st_union() %>%
    st_voronoi() %>%
    st_cast() %>%
    st_intersection(bb) %>%
    st_as_sf() %>%
    rename(geom = x)  %>% 
    mutate(value = sample(c(rep("FALSE", 4), rep("TRUE", 6)), npts, replace = TRUE)) %>%
    group_by(value) %>%
    summarise()
}

n_points_in_polygons <- function(polys, pts) {
  polys %>% st_contains(pts) %>%
  lengths
}

pts <- rThomas(5, 0.1, 20) %>%
  st_as_sf() %>%
  slice(-1)
npts <- dim(pts)[1]

A <- make_binary_layer(25) %>%
  filter(value == TRUE) %>%
  mutate(Region = "A") %>%
  mutate(n = n_points_in_polygons(., pts))
B <- make_binary_layer(25) %>%
  filter(value == TRUE) %>%
  mutate(Region = "B") %>%
  mutate(n = n_points_in_polygons(., pts))
C <- make_binary_layer(25) %>%
  filter(value == TRUE) %>%
  mutate(Region = "C") %>%
  mutate(n = n_points_in_polygons(., pts))

ABC <- A %>%
  bind_rows(B) %>%
  bind_rows(C) %>%
  select(-value) %>%
  mutate(area = st_area(geom),
         in_density = n / area,
         out_density = (npts - n) / (1.1^2 - area),
         weight = in_density / out_density,
         log_w = log10(weight))

ggplot(ABC) + 
  geom_sf(aes(fill = Region), linewidth = 0) + 
  geom_sf(data = pts) +
  scale_fill_manual(values = c("#ff0000a0", "#0000ff80", "#00000080")) +
  facet_wrap(~ Region) +
  theme_minimal()

ABC %>% st_drop_geometry()
