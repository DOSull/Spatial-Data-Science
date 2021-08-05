#### Geog 315 T2 2021
Make sure you have the libraries we need loaded

```{r}
library(sf)
library(tmap)
library(dplyr)
```

In what follows, I assume that you have processed the datasets as described in [the previous page](spatial-data-manipulation-02-map-projections.md), and that they are called `abb_2193` (for the Airbnb data) and `sa2_2193` (for the census data). In case that's not the case, reload the data:

```{r}
abb_2193 <- st_read('abb-2193.gpkg')
sa2_2193 <- st_read('sa2-2193.gpkg')
```

# Filtering data by attribute and spatially
There's a lot to get through in this section.

## Narrowing things down with a `filter` operation
The all of Aotearoa census dataset is kind of a pain to work with, so the first thing we should do is ditch a bunch of it with a `filter` operation. Take a look at the data

```{r}
as_tibble(sa2_2193)
```

Like most statistical reporting systems worldwide, the NZ census is organised into a hierarchy of spatial levels. There are many more than shown here, but you'll see `sa2_id` and `sa2_name` which refer to the ID number and name of these _Statistical Area 2_ units, and `ta_name` which refers to Territorial Authority names. If you map the data using the `ta_name` you can see what these look like.

```{r}
tm_shape(sa2_2193) +
  tm_fill(col = "ta_name") +
  tm_layout(legend.outside = TRUE)
```

Not the greatest map but you get the general idea. As always, if you want a closer look, the easiest approach is to switch to `tmap_mode("view")` and make a zoomable web-map.

*Anyhoo*...

For our purposes the important thing about these codes is that we can do a selection to limit things to a specific area of interest. For example

```{r}
sa2_welly <- sa2_2193 %>%
  filter(ta_name == "Wellington City" | ta_name == "Lower Hutt City")
```

This should immediately make dealing with the data at least a little bit easier:

```{r}
tm_shape(sa2_welly) +
  tm_polygons() +
  tm_shape(abb_2193) +
  tm_dots()
```

It's still not right, because... well... because the Airbnb listings extend to Upper Hutt, Porirua, and Kapiti Coast also. So...

### **Question 2**
#### Change the code above to extend the selection to all the territorial authorities mentioned, and show you succeeded *by including a simple map illustrating your answer*. (20%)

## A spatial filter
We can narrow things down further to focus on statistical areas where there are Airbnb listings, using a *spatial filter*.

```{r}
sa2_abb <- sa2_2193 %>%
  st_filter(abb_2193)
```

Try mapping these two layers (`sa2_abb` and `abb_2193`) and then answer the following question.

### **Question 3**
#### This spatial filter selects only statistical areas that include at least one Airbnb listing. Looking at a map of the selected areas, why might it not be a be very satisfactory way to narrow down a study? (20%)

It seems clear we need to be a bit cleverer about the selection of areas of interest. This gets us into applying various methods that are considered in more detail in class, and in the [associated material here](https://github.com/DOSull/Geog315/blob/master/labs/week-04/spatial-data-manipulation-03B-spatial-relations.md).

For now here is a possible approach using the convex hull

```{r}
hull <- abb_2193 %>%
  st_union() %>%
  st_convex_hull()

sa2_abb <- sa2_2193 %>%
  st_filter(hull)
```

### **Question 4**
#### In your own words explain what the code above is doing to filter the SA2 data to match the study area of Airbnb listings (you'll find it helpful to refer to lecture materials about the convex hull) (15%)

## Saving our work
We've made some more progress, so let's save the data so far to new files

```{r}
st_write(sa2_abb, "sa2-abb-2193.gpkg", delete_dsn = TRUE)
```

Now [go back to the overview](README.md) or on to [the next page](spatial-data-manipulation-04-counting-points-in-polygons.md).
