**Geog 315 T2 2021 - materials still to be finalised for T1 2022**

Reload the data, if you happen to have restarted.
```{r}
quakes <- read.csv('earthquakes.csv')
```

# Making a map
To mentally prepare you for what's coming, the next few paragraphs walk you through making a map of these data, using some packages that we will look at more closely in the coming weeks. I think it is helpful to do this just to get a feeling for what is going on before we dive into details in the coming weeks.

First, we need to load some relevant libraries
```{r}
library(sf)
library(tmap)
library(dplyr)
```

We us the `sf` pacakge to read data in spatial formats like geopackages, or shapefiles, with the `st_read` function:

```{r}
nz <- st_read('nz.gpkg')
```

To make a map with this, we use the `tmap` package. We'll learn more about this package in the next couple of weeks. Basically it lets you make a map by progressively adding layers of data. To start a map you tell it the dataset to use

```{r}
map <- tm_shape(nz)
```

and then add information to tell *R* how to display the map. In this case, we are mapping polygons, so the `tm_polygons` function provides the needed information (to find out more about the available options, type `?tm_polygons` at the command prompt.

```{r}
map +
  tm_polygons(col = 'green', border.col = 'black')
```

If we want to add a few more cartographic frills like a compass rose and scale bar, we can do that too:
```{r}
map +
  tm_polygons(col = 'darkseagreen2', border.col = 'skyblue', lwd = 0.5) +
  tm_layout(main.title = 'Aotearoa New Zealand',
            main.title.position = 'center',
            main.title.size = 1,
            bg.color = 'powderblue') +
  tm_compass() +
  tm_scale_bar()
```

For a list of named colours in *R* see [this document](http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf). Try experimenting with changing a few things in the above map. Consult the help on `tm_layout` using `?tm_layout` to see what options are available.

## Adding another layer
The `quakes` dataset is not in a spatial format, although it include spatial information (the easting and northing coordinates). The `sf` package provides the required functions to convert the dataframe to a *simple features* dataset, which *is* a spatial data format. The following command will do the necessary conversion (you need to be careful to type it exactly as shown).
```{r}
quakes.s <- quakes %>%
  st_as_sf(coords = c('NZMGE', 'NZMGN'), crs = st_crs(nz))
```

What's happening here? `st_as_sf` is the function that does the conversion. The *parameters* in parentheses tell the function what to work on. First is the input dataframe `quakes` which is piped into the function with the `%>%` or *pipe* operator. Next the `coords` parameter tells the function which variables in the dataframe are the *x* and *y* coordinates in the dataframe. the `c()` structure concatenates the two variable names into a single *vector* which is required by `st_as_sf`. Finally, we also specify the *coordinate reference system* or map projection of the data. These data are in New Zealand Map Grid, which I made sure the `nz` data layer is also in. We use `st_crs(nz)` to retrieve this information from the `nz` dataset and apply it to the new spatial `quakes.s` layer we are making.

Now we have two datasets we can make a layered map including both of them.
```{r}
tm_shape(nz) +
  tm_polygons(col = 'darkseagreen2') +
  tm_shape(quakes.s) +
  tm_dots()
```

That's OK, although not very useful, we really need to zoom in on the extent or *bounding box* of the earthquake data:

```{r}
tm_shape(nz, bbox = st_bbox(quakes.s)) +
  tm_polygons(col = 'darkseagreen2') +
  tm_shape(quakes.s) +
  tm_dots() +
  tm_scale_bar()
```

An alternative to `tm_dots` is `tm_bubbles` which allows us to scale the symbols by some variable:

```{r}
tm_shape(nz, bbox = st_bbox(quakes.s)) +
  tm_polygons(col = 'white', lwd = 0) +
  tm_layout(bg.color = 'powderblue') +
  tm_shape(quakes.s) +
  tm_bubbles(size = 'MAG', perceptual = TRUE, alpha = 0.5) +
  tm_scale_bar()
```

This isn't a great map. It might be easier to see if we only showed the larger aftershocks.

```{r}
bigq <- filter(quakes.s, MAG >= 4)
```

Try again, this time also making the bubbles transparent:

```{r}
tm_shape(nz, bbox = st_bbox(bigq)) +
  tm_polygons(col = 'white', lwd=0) +
  tm_layout(bg.color = 'powderblue') +
  tm_shape(bigq) +
  tm_bubbles(size = 'MAG', perceptual = T, alpha=0) +
  tm_scale_bar()
```

Alternatively, we might use colour to show the different magnitudes:

```{r}
tm_shape(nz, bbox = st_bbox(bigq)) +
  tm_polygons(col = 'white', lwd = 0) +
  tm_layout(bg.color = 'powderblue') +
  tm_shape(bigq) +
  tm_bubbles(col = 'MAG', palette = 'Reds', alpha = 0.5) +
  tm_scale_bar()
```

That's probably enough experimenting to give you the general idea.

## A web basemap
One other thing we can do with the `tmap` package is make it a web map instead. We no longer need the `nz` layer, we just have to switch modes

```{r}
tmap_mode('view')
```

[To switch back use `tmap_mode('plot')`]

Then make a map as before, but no need for the `nz` layer

```{r}
tm_shape(quakes.s) +
  tm_dots(col = 'MAG', palette = 'Reds')
```

Go to the [review page](introducing-r-and-rstudio-05-review.md) or [back to the overview page](README.md).
