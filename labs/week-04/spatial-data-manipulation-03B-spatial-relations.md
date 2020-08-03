#### Geog 315 T2 2020
# Other spatial relations in `sf`
```{r}
library(sf)
library(tmap)
library(dplyr)
library(magrittr)
library(tidyr)
```
The `sf` package supports a wide range of spatial operations both on individual layers, and between layers. These are discussed in this document, for your reference, and may be particularly useful when it comes to the mini-project later in the semester.

I have split operations into those which transform an existing dataset, and those which are performed between two datasets.

I will use three small datasets to demonstrate the various operations. These are loaded as follows:
```{r}
pts <- st_read("points.gpkg")
lines <- st_read("lines.gpkg")
polys <- st_read("polys.gpkg")
```

And make a map to see what we are dealing with

```{r}
tm_shape(polys) +
  tm_polygons(col = "pop2013", alpha = 0.5) +
  tm_shape(lines) +
  tm_lines(col = 'purple') +
  tm_shape(pts) +
  tm_dots()
```

These data are:

+ `polys` 2013 Census meshblocks with the population count
+ `lines` street and path network segments
+ `pts` road crash locations in 2017

All for an area around 1.6km from Victoria University. If you make a web map you can see the general context better.

## Spatial operations on single objects
The _unary_ operations we can apply to geometries in a dataset are [listed here](https://www.rdocumentation.org/packages/sf/versions/0.9-5/topics/geos_unary) (and you can look up any of them in the help in the usual way). Some examples are discussed below. First we consider operations that apply to all objects in a dataset inidividually.

### Operations applied to each object individuually
### Buffering with `st_buffer`
Buffering expands spatial objects by some specified distance out from the objects. You have to specify a `dist`.

```{r}
pts.buf <- st_buffer(pts, dist = 50)
polys.buf <- st_buffer(polys, dist = -10)
lines.buf <- st_buffer(lines, dist = 20)
```

This function preserves any variables associated with the dataset in the buffered dataset. A set of points will become a set of circles when buffered, whereas lines become 'lozenge' shapes, and polygons become larger, smoothed versions of themselves. Buffering is frequently used to explore topics like the spatial relationship between (for example) liquor outlets and schools, or accessibility to public transport and so on.

```{r}
tm_shape(polys.buf) +
  tm_polygons(col = "pop2013", alpha = 0.5) +
  tm_shape(lines.buf) +
  tm_polygons(col = 'purple', alpha = 0.5) +
  tm_shape(pts.buf) +
  tm_polygons(alpha = 0.5)
```

If `dist` is negative (as it is here for the meshblocks) it will shrink the geometry in on itself. This only makes sense for polygons, and if the shrinking is too large it may cause errors (think of it turning a small polygon inside-out on itself!).

### Centroid with `st_centroid`
The centroid of a geometry is a point at its geometric centre.

```{r}
tm_shape(polys) +
  tm_polygons() +
  tm_shape(st_centroid(polys)) +
  tm_dots()
```


The centroid is not guaranteed to be inside the geometry. There is at least one example of this in the example data - and most likely more.

If you need a representative point guaranteed to be inside a polygon, then use `st_point_on_surface()` instead, although be aware that the location of this point is not guaranteed to be the same every time your run the function!

#### Convex hull
The _convex hull_ of a set of points is the shape you would get if you stretch an elastic band around the outer edge of the set of points that define the object. If we extract a single polygon from the `polys` dataset, that's the easiest way to illustrate this.

```{r}
poly <- polys %>%
  filter(MB2013 == 2124300)
```

Now plot this and its convex hull

```{r}
tm_shape(poly) +
  tm_polygons(alpha = 0.5) +
  tm_shape(st_convex_hull(poly)) +
  tm_polygons(col = 'blue', alpha = 0.5, border.col = 'red')
```

The convex hull of a geometry is a nice simplified summary of its location. It is particularly useful for representing a collection of points. However, if you apply it to a point dataset, you will just get a collection of points, because the function is applied to each point individually. To create the convex hull of the whole set of points, you have to first merge them into a _multipoint_ with the `st_union` operation:

```{r}
tm_shape(pts) +
  tm_dots() +
  tm_shape(st_convex_hull(st_union(pts))) +
  tm_polygons(alpha = 0.5, border.col = 'red')
```

### Operations applied to a collection of objects
Some operations only make sense when applied to a collection of geometries, not one object at a time. Two in particular that are widely used at `st_voronoi()` and `st_triangulate()`.

#### Voronoi
The Voronoi region associated with a geometry is the region of space closer to that geometry than to any other geometry in a set of geometries. This is easiest to understand for points. Unfortunately, the `st_voronoi` operation applied to a point dataset behaves rather unexpectedly, so a series of transformations are required to convert it to a useable polygon dataset:

```{r}
voronoi <- pts %>%
  st_union() %>% # combine potnts into a multipoint
  st_voronoi() %>%
  st_cast() %>% # no idea!
  st_as_sf() # convert to a sf dataset
```

And now let's plot them along with the originating points.

```{r}
tm_shape(voronoi) +
  tm_polygons(alpha = 0.5) +
  tm_shape(pts) +
  tm_dots()
```

By default the function adds a large buffer region to the points before doing the Voronoi calculation. You can reduce this effect by intersecting the result with a bounding box or convex hull:

```{r}
pts.hull <- pts %>%
  st_union() %>%
  st_convex_hull() %>%
  st_buffer(dist = 100)

tm_shape(st_intersection(voronoi, pts.hull)) +
  tm_polygons()
```

The Voronoi polygons of a set of points can be considered 'service areas' of the points. Imagine the points are (say) bus stops, then each polygon is the area closer to a given bus stop than to any other bus stop, so other things being equal, it is the 'service area' of that bus stop. Of course... the areas are determined without reference to movement on street networks or hills or anything else, so they are too simplistic for application in an unprocessed form. Alternative methods involve calculating distances over networks not just using straight point-to-point calculations. An interesting example of the simple form of Voronoi, but applied to true great circle distances on Earth surface is [this one by Jason Davies for world airports](https://www.jasondavies.com/maps/voronoi/airports/).

#### Triangulation
The triangulation of a set of points connects the points together into a mesh of triangles. Similar to the Voronoi operation, some annoying additional conversions are required.

```{r}
tri <- pts %>%
  st_union() %>% # combine potnts into a multipoint
  st_triangulate() %>%
  st_cast() %>% # no idea!
  st_as_sf() # convert to a sf dataset

tm_shape(tri) +
  tm_polygons(alpha = 0.5) +
  tm_shape(pts) +
  tm_dots()
```

The triangulation, the Voronoi polygons, and the convex hull are all closely related. The convex hull of the points is also the outer perimeter of the triangulation. An alternative way to summarise the locations of a collection of points is called the _alphashape_ and these are based on removing edges from the triangulation until the remaining triangles more closely fit the shape of the set of points. However alphashapes are not supported by any functions in the `sf` package. An _R_ package that supports alphashapes is `alphahull` but it is not directly compatible with `sf`. If you want to see what this looks likes try running the following code:

```{r}
library(alphahull)
xy <- st_coordinates(pts)
xy <- unique(xy) # there are some duplicate points in the data, which we need to remove
plot(ashape(xy, alpha = 350), asp = 1)
```

## Operations between layers
There are two kinds of operations between layers in `sf`. One set is similar to the above set of operations on a layer, where layers are transformed in some way. We call these _binary operations_. The other category is determining the relations between two layers, based on which we might determine other relations. We call these _binary predicates_. I  will cover each of these in turn, but in reverse order, because the predicates are more fundamental.

### Binary predicates
The binary predicates determine whether or not various spatial conditions are met between two datasets. The binary predicates available in `sf` are [listed here](https://www.rdocumentation.org/packages/sf/versions/0.9-5/topics/geos_binary_pred). These vary in their exact interpretation depending on whether the layers involved are points or lines or polygons, but an illustration of them for polygons is shown below, to give you the idea.

<img src="spatial-predicates.png" width="30%" style="position:relative; left:35%;">

These are as discussed in the paper

Egenhofer MJ & Franzosa RD 1991 [Point-set topological spatial relations](https://dx.doi.org/10.1080/02693799108927841) International Journal of Geographical Information Systems 5(2) 161-174.

One minor difference with the operations supported by `sf` is that 'meets' is called 'touches' in `sf`.

The various binary spatial predicate functions in `sf` return for two datasets which geometries in the first dataset are related to which in the second based on the particular relation specified. For example, if we want to know which points in the crashes dataset are in which meshblocks, so we can do

```{r}

st_within(pts, polys)
```

That list is which of the polygons in the `polys` dataset the first 10 of the points in the `pts` data layer is within. If we do the equivalent test in reverse

```{r}
st_contains(polys, pts)
```

we get which points are contained by each of the polygons. In this case the first four polygons in `polys` contain no points from `pts`, the next one contains point 326, the next one contains several points, and so on.

The results we see here show only the first few rows of the results. They are also in a 'sparse' format showing only the relations which are `TRUE` if we request the complete results by setting the option `sparse` to `FALSE` then we see a matrix which shows for every combination of object in the first dataset (the rows) which objects in the second dataset (the columns) satisfies the required spatial relationship.

```{r}
st_contains(polys, pts, sparse = FALSE)[1:10, 1:10]
```

Usually the sparse form (the default) is less of a pain to deal with. In that form, the result is a `list` and extracting the information it contains may require some additional processing.

As an example, we can use the `st_contains()` operation to count points in polygons. For example, perhaps we want to count the number of crashes in different areas, then the `lengths()` function applied to the result of `st_contains()` gives us that information.

```{r}
num_crashes <- lengths(st_contains(polys, pts))
polys.n <- polys %>%
  mutate(n = num_crashes)
tm_shape(polys.n) +
  tm_polygons(col = "n")
```

If we want the actual information from the output list, then we use the `unlist()` function to get at it. So for example, a list of the polygons that contain a crash is provided by

```{r}
unlist(st_within(pts, polys))
```

This can then be used to make a selection from the polygons dataset

```{r}
polys_with_crashes <- polys %>%
  filter(row_number() %in% st_within(pts, polys))
tm_shape(polys_with_crashes) +
  tm_polygons()
```

This is probably not the best way to do this kind of selection, however.

### Binary operations
The two key spatial operations between two datasets are _spatial filter_ (`st_filter`) and _spatial join_ (`st_join`).

#### Spatial filter
A spatial filter operation is like the non-spatial `filter` function in `dplyr` and will pick out only those rows in the data that meet some criterion, where the criterion is a spatial one, based on the relationship to some other dataset. The So for example, we can do a selection as in the previous section simply with

```{r}
tm_shape(st_filter(polys, pts)) +
  tm_polygons()
```

`st_filter` applies some spatial predicate to the relationship between two layers to perform the filtering. By default the predicate is `st_intersects` which in most cases will pick out where two spatial layers coincide with one another. As a difference example, consider a situation where we have selected one polygon in the dataset

```{r}
poly <- polys[1, ] # this selects just row 1
tm_shape(polys) +
  tm_polygons() +
  tm_shape(poly) +
  tm_polygons(col = 'red')
```

Now we can get the neighbouring polygons like this, byt specifying an appropriate `predicate`:

```{r}
npolys <- polys %>%
  st_filter(poly, predicate = st_touches)
tm_shape(polys) +
  tm_polygons() +
  tm_shape(npolys) +
  tm_polygons(col = 'orange')
```
It doesn't arise in this simple example, but this capability can be used to perform complicated multistep spatial manipulations of datasets.

#### Spatial join
A spatial join not only applies some spatial predicate to the relation between two layers, but will append the data from the second layer to the data table of the first. This is an effective way of spatially merging datasets for further analysis. An example of `st_join` has been shown in the [main lab materials](spatial-data-manipulation-02-map-projections.md). The trickiest aspect to spatial joins is that when more than one object meets the join criterion. For example, if we are joining data from points to polygons then many points may intersect with each polygon:

```{r}
st_join(polys, pts)
```

There are only 406 polygons in the `polys` dataset, but the joined dataset has 789! This is because a duplicate entry is made each time a crash point occurs inside a polygon. Notice also that where a polygon has no point we get a lot of `<NA>` entries in the table, because no data was found in the `pts` layer that intersected with the `polys` layer. If we simply don't want the `<NA>` values we can specify an `inner_join` so that only records where a match was found are retained.

```{r}
st_join(polys, pts, left = FALSE)
```

This still leaves the question of how to combine the multiple pieces of information that are now associated with each polygon derived from multiple crashes. There is no one solution here as it will depend on the interpretation of the data what makes sense. Usually we have to group the joined data based on some unique identifier of the original data, and then use `summarise` to calculate appropriate new variables. For example

```{r}
crash_counts <- polys %>%
  st_join(pts) %>%
  group_by(MB2013) %>%
  summarise(num_crashes = n(),
            fatalities = sum(as.integer(as.character(FATAL_COUN))),
            serious = sum(as.integer(as.character(SERIOUSINJ))),
            minor = sum(as.integer(as.character(MINORINJ_C))),
            pop = first(pop2013)) %>%
  select(MB2013, pop, num_crashes, fatalities, serious, minor)

as_tibble(crash_counts)
```

The biggest problem this leaves us with is a lot of `NA` values. The best way to deal with these is to use the `replace_na()` funcion in the `summarise()` calculation to replace NA values with an appropriate alternative. For example, we can do

```{r}
crash_counts <- polys %>%
  st_join(pts) %>%
  group_by(MB2013) %>%
  summarise(num_crashes = n(),
            fatalities = replace_na(sum(as.integer(as.character(FATAL_COUN))), 0),
            serious = replace_na(sum(as.integer(as.character(SERIOUSINJ))), 0),
            minor = replace_na(sum(as.integer(as.character(MINORINJ_C))), 0),
            pop = first(pop2013)) %>%
  select(MB2013, pop, num_crashes, fatalities, serious, minor)

as_tibble(crash_counts)
```

#### Spatial intersection or overlay
Finally, you may want to clip one layer with another. We already saw this when I showed how to clip the Voronoi polygon with the points convex hull, using the `st_intersection` operation. Here are two examples.

```{r}
# Clipping the polygons by the convex hull of the points
hull <- pts %>%
  st_union() %>%
  st_convex_hull()

plot(st_intersection(polys, hull))
```

```{r}
# This one uses the bounding box instead
bbox <- pts %>%
  st_bbox(pts) %>%
  st_as_sfc() %>%
  st_as_sf()

plot(st_intersection(polys, bbox))
```

## Finally
```{r}
library(RXKCD)
getXKCD(627)$img
```
