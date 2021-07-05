#### Geog 315 T2 2021
Make sure you have the libraries we need loaded

```{r}
library(sf)
library(tmap)
library(dplyr)
```

In what follows, I assume that you have processed the datasets as described in [the previous page]((spatial-data-manipulation-03-spatial-filters.md)), and that they are called `abb_2770` (for the Airbnb data) and `tracts__la_2770` (for the census tracts). In case that's not the case, reload the data:

```{r}
abb_2193 <- st_read('abb-2193.gpkg')
sa2_2193 <- st_read('sa2-abb-2193.gpkg')
```

## Counting points in polygons
We've narrowed the census area down. But there are still a lot of Airbnb listings, and for the analysis we want to do in the next lab, we only need the _number_ of listings in each census area. There are various ways we might get that information. The most reliable is to use one of the _spatial predicate_ functions. This is less scary than it sounds!

In this case, we want to count how many Airbnb listings are contained in each SA2 polygon. The spatial predicate of interest is therefore `st_contains`. We run the function like this

```{r}
st_contains(sa2_2193, abb_2193)
```

This gives us a list of lists where each list is for the corresponding polygon, a list of the Airbnb listings contained by it. To count these, we use the `lengths()` function

```{r}
lengths(st_contains(sa2_2193, abb_2193))
```

That's great, but to save this in the SA2 dataframe, we need to assign the result to a variable. The end result is

```{r}
num_listings <- lengths(st_contains(sa2_2193, abb_2193))
sa2_abb_counts <- sa2_2193 %>%
  mutate(n = num_listings)
```

There are other possible approaches to this, but this is by far the cleanest. Although it's two steps, it avoids a lot of confusing merging of tables and so on, which is what can happen if you try to use spatial join approaches.

So anyway...

### **Question 4**
#### Finally, make a map of the listings (as points) overlaid on the census SA2 areas coloured by the number of listings in each? Include a short write up explaining what the map shows. (30%)

## Saving our work
We've accomplished a lot, so best to save the results.

```{r}
sa2_abb_counts %>%
  st_write("sa2-abb-2193.gpkg", delete_dsn = TRUE)
```

Now [go back to the overview](README.md) or on to [the next page](spatial-data-manipulation-05-counting-points-in-polygons.md).
