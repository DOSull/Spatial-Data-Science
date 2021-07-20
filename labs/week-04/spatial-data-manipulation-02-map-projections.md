#### Geog 315 T2 2021
Make sure you have the libraries we need loaded

```{r}
library(sf)
library(tmap)
library(dplyr)
```

In what follows, I assume that you have loaded the datasets, and that they are called `abb` (for the Airbnb data) and `sa2` (for the statistical areas).

```{r}
abb <- st_read("abb.gpkg")
sa2 <- st_read("sa2.gpkg")
```

# Map projections
As we might hope the `sf` package provides the ability to project spatial datasets, so that they can be properly aligned with one another for processing purposes, and so that reliable measurements of distances and areas in meaningful units (like metres) can be made.

We can't get into too many details in this class, since projections are a very large topic, but we can at least get a feel for how they work in this environment.

`sf` makes use of standard ways of specifying projections, namely *WKT* (well-known text) formatted information, or *EPSG codes*. These are also used in *ArcGIS* (well hidden from users) and *QGIS* (less well hidden!). In *R* they are right out in the open. This can be a bit intimidating, but has some advantages when it comes to quickly projecting and reprojecting data, as we often need to do early in a project.

## EPSG codes
EPSG codes are the easier of the two options to get a handle on. These are numeric codes that correspond with specific projections. For example

+ **New Zealand Transverse Mercator** (NZTM) is 2193
+ **New Zealand Map Grid** (NZMG, which preceded NZTM) is 27200
+ Plain **latitude longitude** coordinates (which you might get from a GPS) are 4326
+ **Web Mercator** (the basis of most web maps until recently) is 3857

The numbers are meaningless, they are just reference numbers, but they are all you need to know for some basic transformations of spatial data. Geospatial software is aware of the codes and knows how to deal with them.

If a dataset is in a standard projection system, it will probably have an EPSG code, and this is the most convenient format in which to examine the projection information. You can see the EPSG information about a particular dataset by using `st_crs()` and inspecting the `$epsg` property:

```{r}
st_crs(abb)$epsg
```

This tells us that the `abb` dataset is in plain lat lon coordinates.

```{r}
st_crs(sa2)$epsg
```

This tells us that these data are (for some reason) in the Web pseudo-Mercator projection.

## WKT projection information
We can find out more about the projection using `st_crs()`:

```{r}
st_crs(sa2)
```

This is the *WKT* information for the projection, which is much more verbose, and (supposedly!) more human readable. If you get deep in the weeds of dealing with mismatched coordinate reference systems then you may find yourself dealing with this kind of thing a lot, but for now, it's just good to know that this information exists.

## Useful resources on EPSG codes and WKT codes
For more information on EPSG codes and WKT codes, you may find the resources below helpful:

+ [epsg.io](https://epsg.io) from MapTiler has details and information about EPSG codes
+ [Projection Wizard](https://projectionwizard.org) can suggest suitable projections conforming with various properties for specified areas of Earth's surface

## Different map projections are a problem (even if it seems like they aren't)
To get a feel for the issue we are up against, try mapping these two datasets on top of one another.

```{r}
tm_shape(sa2) +
  tm_polygons() +
  tm_shape(abb) +
  tm_dots()
```

Well... that didn't go well. Because the Chatham Islands are in the data we have problems with the 'dateline' at longitude 180, and how various coordinate systems deal with that.

We can restrict the map to a *bounding box* for the Airbnb listings like this, which might help

```{r}
tm_shape(sa2, bbox = st_bbox(abb)) +
  tm_polygons() +
  tm_shape(abb) +
  tm_dots()
```

So what's the problem? `tmap` seems to cope completely fine with the two layers in different projections. This is pretty common in many geospatial tools today. They will happily layer differently projected data on top of one another. This is great, until ... it's not. Eventually we are going to want to whittle things down to just the tracts where there are listings and start doing things like checking where listings locations and tracts intersect. We might do this kind of thing, for example (try it) to find out which tracts intersect with which listings:

```{r}
st_intersects(sa2, abb)
```

That will produce an error. Look closely and you will see that the key phrase is `st_crs(x) == st_crs(y) is not TRUE` which is _R_'s not-very-friendly way of telling us that the two projections are not matched.

Fortunately we can fix that...

## Changing the coordinate reference system by reprojecting
OK. So, this should make it clear that an important spatial data wrangling task is **to get all the data you are working with into the same coordinate reference** and not only that, but to **choose a projection appropriate to the location of interest that uses sensible distance units**, such as metres (and not loopy ones like feet).

Note that if all we wanted to do was make a single map, reprojection wouldn't _necessarily_ be required, we could do temporary workarounds, and get by. But for serious further work it makes sense to reproject all the datasets we are dealing with.

Since we are working with Aotearoa New Zealand data, it makes sense to use New Zealand Transverse Mercator (NZTM), which has EPSG code 2193. Reprojection of these data is simple using the `st_transform` function. To project to a known code, do this

```{r}
abb_2193 <- abb %>%
  st_transform(2193)
```

And to project to match the projection of another dataset do this

```{r}
sa2_2193 <- sa2 %>%
  st_transform(st_crs(abb_2193))
```

You can check the projection information of the datasets again, just to make sure it all worked.

```{r}
st_crs(abb_2193)
st_crs(sa2_2193)
```

### **Question 1**
#### Explain to the best of your ability what is happening when you use the command `sa2_2193 <- sa2 %>% st_transform(st_crs(abb_2193))` with specific reference to how the projection to be used in the transformation is specified, that is the `st_crs(abb_2193)` part. (15%)

## That `st_intersects` operation again
To check this has fixed the problem, try the `st_intersects()` operation again, but this time using the reprojected datasets

```{r}
st_intersects(sa2_2193, abb_2193)
```

For now, don't worry about the output... the important thing is it worked because the two datasets are now in the same projection. You'll also find that you can make a sensible map with these new datasets (give it a try) because NZTM has a coordinate system continuous through the dateline.

So we don't lose all this good work, we should save the reprojected datasets. We will use geopackage files since these reliably record projection information in a single file format (unlike shapefiles). We will also include some information in the file name about the projection, just so we can keep track of things

```{r}
st_write(abb_2193, 'abb-2193.gpkg', delete_dsn = TRUE)
st_write(sa2_2193, 'sa2-2193.gpkg', delete_dsn = TRUE)
```

If you need to reload the data at any point you should **use these new files** and not the originals. The new projected coordinates are only made permanent when we write the data out to the file system like this.

Now [go back to the overview](README.md) or on to [the next page of instructions](spatial-data-manipulation-03-spatial-filters.md).
