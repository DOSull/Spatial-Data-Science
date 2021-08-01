#### Geog 315 T2 2021
# Making and mapping k-means clusters
## Loading libraries and data
In case you are starting here not continuing on from the previous instructions, reload libraries and data:

```{r}
library(sf)
library(tmap)
library(dplyr)
library(magrittr)
require(ggplot2)
require(tidyr)
```

And the data:

```{r}
sanfran <- st_read("sf_demo.gpkg")
# don't forget the data-only copy
sanfran.d <- sanfran %>%
  st_drop_geometry() %>%
  select(-id)
```

## Making k-means clusters
Our chosen approach is k-means clustering. The method (or algorithm) is simple:

1. Decide on the number of clusters you want, call this *k*
2. Choose *k* cluster centres
3. Assign each observation to its nearest cluster centre
4. Calculate the mean centre of each cluster and move the cluster centre accordingly
5. Go back to 3 and repeat, until the cluster assignments stop changing

Here's an [illustration of this working](https://kkevsterrr.github.io/K-Means/) to help with following the description above.

It's important to realise that k-means clustering is _non-deterministic_, as the choice of intial cluster centres is usually random, and can affect the final assignment arrived at.

##
So here is how we accomplish this in _R_.
```{r}
km <- kmeans(sanfran.d, 5)
```

That's it! All the results for the chosen number of clusters (specified as 5 in the above example) are now contained in the dataset `km`. Take a look at it by selecting it from the Environment tab, or just type `km` at the console:

```{r}
km
```

Most of this is 'too much information'. The key information - which observation is in which cluster - is contained in the "cluster" component, which we can extract and add as a new variable to our dataset like this:

```{r}
sanfran %<>%
  mutate(k5 = km$cluster)
```

Note how I have given this new variable a name that reflects the number of clusters, and also that I have added it to the spatial dataset. That means we can map it:

```{r}
tm_shape(sanfran) +
  tm_polygons(col = 'k5', palette = "Set2", style = "cat") +
  tm_legend(legend.outside = TRUE)
```

I have set the map style to `"cat"` for categorical so that it treats the clusters as qualitatively different, not as numbers on an interval or ordinal scale.

### Notes
You can run the above code again and you will probably end up with a different (if similar) map. You can also run it specifying a different number of clusters in the `kmeans()` function.

If you do this you should make sure you give the new variable in the `mutate` operation a different name, reflecting the number of clusters.

The fact that the results may not always be the same means that interpretation of clusters can be quite challenging.

## Interpretation of clusters
The 'quality' of a particular clustering solution is dependent on how well we think we can interpret it. In this case, for an unfamiliar setting, you probably can't do much. Measures of the variance within and between clusters can be used to assess quality in a more technical sense and are available from the `kmeans` object produced by the function.

Here is some code you can use to compare a specific variable across clusters

```{r}
boxplot(PCwithKids ~ k5, data = sanfran)
```

You have to use this code one variable at a time. You can get an overview of which variables are particularly high or low in each cluster from the `centers` component of the `kmeans()` results:

```{r}
km$centers
```

This is quite difficult to interpret (all those numbers) but scanning the information should enable you to spot which cluster has particularly high or low values of particular variables.

For a more visual presentation of all the information we can use some more complicated plotting code, as shown below.

```{r}
sanfran %>%
  select(-id) %>%
  st_drop_geometry() %>%
  pivot_longer(-k5) %>%
  ggplot() +
    geom_point(aes(x = value, y = name, colour = as.factor(k5))) +
    facet_wrap(~ k5, nrow = 1)
```

Go [back to the overview page](README.md) or [on to the next page](clustering-analysis-03-wellington-commuter-data.md).
