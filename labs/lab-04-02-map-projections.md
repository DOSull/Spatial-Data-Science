#### Geog 315 T2 2019 Week 5
For reference, results of running the code in this page can be found [here](https://southosullivan.com/geog315/labs/lab-04-02-map-projections.html).

Make sure you have the libraries we need loaded

```{r}
library(sf)
library(tmap)
library(dplyr)
```

In what follows, I assume that you have loaded the datasets, and that they are called `abb` (for the Airbnb data) and `ca_tracts` (for the census tracts).

```{r}
abb <- st_read('la-abb.geojson')
ca_tracts <- st_read('ca-tracts.shp')
```

# Map projections
As we might hope the `sf` package provides the ability to project spatial datasets, so that they can be properly aligned with one another for processing purposes, and so that reliable measurements of distances and areas in meaningful units (like metres) can be made.

We can't get into too many details in this class, since projections are a very large topic, but we can at least get a feel for how they work in this environment.

`sf` makes use of standard ways of describing projections, namely the *EPSG codes* and/or *proj strings*. These are also used in *ArcGIS* (well hidden from users) and *QGIS* (not particularly well hidden!). In *R* they are right out in the open.

EPSG codes are numeric codes that correspond with specific projections. For example
+ **New Zealand Transverse Mercator** is 2193
+ **New Zealand Map Grid** (which preceded NZTM) is 27200
+ Plain **latitude longitude** coordinates (which you might get from a GPS) are 4326
+ **Web Mercator** (the basis of most web maps until recently) is 3857

The codes are arbitrary, but geospatial software is aware of the codes and knows how to deal with them

You can see the EPSG information about a particular dataset by using `st_crs` (CRS stands for coordinate reference system)

```{r}
st_crs(abb)
```

This tells us that the `abb` dataset is in plain lat lon coordinates.

```{r}
st_crs(ca_tracts)
```

This tells us that these data are in some projected coordinate system althought the EPSG code has not been recorded.

Also shown in these examples is a *proj4string* associated with the projection. Sometimes you get both the EPSG code and the proj4string other times (as in the `ca_tracts`) you only get the proj4string. This is actually the command associated with the [PROJ]() program used by almost all geospatial software to handle projections. You don't need to worry about what it all means, but it is good to know such strings exist, and the role they play in defining the projection of a dataset for display in maps or in GIS. When you get used to interpreting them (this should come with time working on geospatial data) you can tell that the `ca_tracts` dataset is in a Lambert Conformal Conic projection (`+proj=lcc`) and that the units are feet (`+units=ft`). 

## Useful resources on EPSG codes and proj strings
For more information on EPSG codes and proj strings, you will find the resources below helpful:
+ [epsg.io](https://epsg.io) from MapTiler has details and information about EPSG codes
+ [Projection Wizard](https://projectionwizard.org) can suggest suitable projections conforming with 
various properties for specified areas of Earth's surface

## Different map projections
To see the problem we are up against, try mapping these two datasets on top of one another.

```{r}
tm_shape(ca_tracts) +
  tm_polygons() +
  tm_shape(abb) + 
  tm_dots()
```

That worked fine. You should be able to see the dots of the Airbnb listings in roughly the right spot in southern California. But imagine that we want to make our map only across the area covered by the Airbnb dataset. We might try this

```{r}
tm_shape(ca_tracts, bbox=st_bbox(abb)) +
  tm_polygons() +
  tm_shape(abb) + 
  tm_dots()
```

Here, using the `bbox` option when I map the tracts layer, I have tried to restrict the map area to just the bounding box (i.e. the max/min x and y coordinate range) of the Airbnb data, but something seems to have gone wrong. That leads to the first question, which you should answer in your response to this lab:

### **Question 1** 
#### Explain to the best of your ability what has gone wrong in the mapping that we just attempted. Look back to when you loaded the two datasets at the bounding box information provided when each dataset was loaded. (15%)

## Changing the coordinate reference system by reprojecting
OK. So, this should make it clear that an important spatial data wrangling task is to get all the data you are working with into the same coordinate reference system (i.e. map projection), preferably one appropriate to the location of interest, and that uses sensible distance units, such as metres (and not loopy ones like feet). 

**Note that if all we wanted to do was make a single map, reprojection wouldn't necessarily be required, we could do temporary workarounds, and get by. But for serious further work it makes sense to reproject all the datasets we are dealing with.**

Since we are in Los Angeles, I did a search on that place at `epsg.io` and it gave me a number of relevant options. I picked California zone 5, in a metric system which has EPSG code 2770. Reprojection of these data is simple using the `st_transform` function:

```{r}
abb <- st_transform(abb, 2770)
ca_tracts <- st_transform(ca_tracts, st_crs(abb))
```

You can check the projection information of the datasets again, just to make sure it all worked.

```{r}
st_crs(abb)
st_crs(ca_tracts)
```

### **Question 2** 
#### Explain to the best of your ability what is happening when you use the command above
    ca_tracts <- st_transform(ca_tracts, **st_crs(abb)**)
#### with specific reference to how we specify the projection to be used in the transformation, that is the part in **bold** text. (10%)

## That map again
To check this has fixed the problem, make that map again:

```{r}
tm_shape(ca_tracts, bbox=st_bbox(abb)) +
  tm_polygons() +
  tm_shape(abb) + 
  tm_dots()
```

Nice!

OK, so we don't lose all this good work, we should save the now reprojected datasets. We will use shapefiles since these reliable record projection information, and we will include some information in the file name about the projection, just so we can keep track of things

```{r}
st_write(abb, 'la-abb-p2770.shp', delete_layer=TRUE)
st_write(ca_tracts, 'ca-tracts-p2770.shp', delete_layer=TRUE)
```

If you need to reload the data at any point you should use these new shapefiles and not the originals. The new projected coordinates are only made permanent when we write the data out to the file system like this.

**Now [go back to the overview](lab-03-00-overview.md)**
