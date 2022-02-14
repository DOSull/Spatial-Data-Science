**Geog 315 T1 2022**

In case you have restarted the session, reload the libraries and data again

```{r}
library(sf)
library(tmap)
library(dplyr)

results <- st_read('election.gpkg')
```

# Some data preparation
The spatial data we just loaded has some quirks, so in this document, I explain how you can tidy it up to make it more suitable for the assignment. To do this, we will be using the `dplyr` library which provides functions for selecting, filtering and combining data in various ways. This week we'll just be seeing these in action, but in later weeks we'll be looking more closely at their operation.

The tasks covered in this document are
+ [Filtering data](#filtering-data) to remove Alaska and Hawai'i
+ [Saving data to spatial data files](#saving-data) to make the filtering we did permanent
+ [Grouping data](#grouping-data) to make a states dataset
+ [Adding new attributes](#adding-new-attributes) to a dataset using `mutate`

## Filtering data
The data in the `election.gpkg` file is a bit odd in that it has Alaska and Hawai'i where Mexico is in real life. To show how easy it is to select data in *R* we will use the `filter` function from the `dplyr` package to get rid of these. (You might not want to do this in your map, this is just to demonstrate filtering). 

The variable we need to do the selection on is `state`. Say we wanted just to map California, we can do this by filtering the `results` dataset then plotting it:

```{r}
results %>% 
  filter(state == 'CA') %>% 
  plot()
```

How does this work? You read the command above something like "take the `results` dataset, _then_ `filter` it, _then_ `plot`". The _pipe_ `%>%` directs whatever is before it, into whatever function comes after it. the `filter` function specifies a *condition* for which cases to retain in the filtered dataset. Here we want all those cases with the `state` value 'CA' (i.e., California). If we wanted all those states *NOT* California, we can use *not equals* which is designated by `!=`

```{r}
results %>% 
  filter(state != 'CA') %>% 
  plot()
```

So, to get rid of Alaska and Hawai'i we can do this:

```{r}
lower48 <- results %>% 
  filter(state != 'AK' & state != 'HI')
```

Here we've combined the requirement that the state not be Alaska (AK) *and* not be Hawai'i (HI) using the `&` operator. This works fine and there is nothing wrong with this way of doing things.

This time, because we might want to retain the result we assign the output to a new variable called `lower48` using `<-`.

We could also use the pipe operation to filter the data twice like this:

```{r}
lower48 <- results %>%
  filter(state != 'AK') %>%
  filter(state != 'HI')
```

Which will give us the same result:

```{r}
plot(lower48)
```

Because filtering data is not our primary focus right now, we will worry more about exactly how this works in later lectures and assignments.

For now, it is enough to know that we can do this kind of filtering to make new datasets, that the `filter` function is how we do it, and that the *pipe operator* `%>%` is a neat way to do it.

Again, the way to read the the command above is "start with `results` as the input, pipe it into the first `filter` (which throws away Alaska, `AK`) then pipe it into a second `filter` (which throws away Hawai'i, `HI`)". Pipe functions are central to the *R* **tidyverse**.

Either way, we now we have a dataset with only the contiguous ('lower 48') states of the US.

## Saving data
Saving a dataset is easy. Just as there is a `st_read` function, there is an `st_write` function. We tell it the dataset to save, and the filename to use, and that's pretty much it.

The only complication is that if the file already exists, then we also have to tell it that it is OK to delete the existing file, using a `delete_dsn` parameter (`delete_dsn` denotes 'delete datasource named'). 

So here goes with `delete_dsn` set to `TRUE` just in case you end up running this command again later.

```{r}
st_write(lower48, 'lower48.gpkg', delete_dsn = TRUE)
```

That's it. You should find that there is now a new geopackage file in the folder you are working in. We can also save to other data formats. For example

```{r}
st_write(lower48, 'lower48.geojson', driver = 'GeoJSON', delete_dsn = TRUE)
```

will save a GeoJSON file.

## Grouping data
The `lower48` dataset includes an attribute `state` which tells us the US state in which each county is found. We can use this information to make a new shapefile by *dissolving* counties together based on the value of this attribute. In ESRI *Arc* products you may have seen this already as a 'dissolve' operation. It would be nice if exactly that function was available in `sf` but we actually use the `dplyr` function `group_by` instead. Again we use pipes:

```{r}
states <- lower48 %>%
  group_by(state) %>%
  summarise(across(where(is.numeric), sum)) %>%
  as.data.frame() %>%
  st_as_sf()
```

The last two lines here should not be required, but are a workaround for a problem reported on some combinations of package versions that seems to be affecting the lab computers.

Here we pass the `lower48` dataset to the `group_by` function, which will use the `state` attribute to group counties. The second pipe sends this result to the `summarise` function, which uses `across` with a `where` clause to check if attributes are numeric (the `is.numeric` parameter), and if they are, combines values by using a `sum` operation.

```{r}
tm_shape(states) +
  tm_polygons(col = 'population')
```

With all that done, we can write the `states` dataset out to a new file to save our work

```{r}
st_write(states, 'states.gpkg', delete_dsn = TRUE)
```

## Adding new attributes
Often the attributes we are provided with in a dataset are not quite what we want. Perhaps we want proportions or percentages rather than counts. Or maybe we want densities per unit area, or maybe we want the differences or sums of the original attributes.

It is easy to add new attributes to an existing dataset using the `mutate` function from the `dplyr` package. For example, to create a new variable showing the percentage of population in each state that voted we can do:

```{r}
states <- states %>%
  mutate(turnout = votes / population * 100)
```

Note that we have to assign the result of the mutate back to the same variable to add it to the dataset. This seems like a nuisance at first, but you'll get used to it.

```{r}
tm_shape(states) +
  tm_polygons(col = 'turnout')
```

Try adding some other new variables, such as (say) the margin between the Republican (`gop`) and Democratic (`dem`) votes in each state, or the percentage of votes cast for one of the parties.

Generally speaking it is easier to add new attributes to a dataset, and then when you are happy you have all the attributes you need you can tidy things up a bit by dropping ones you don't need using `select`.

Keep in mind if you add new attributes or make new datasets in this way that

+ they are just as valid as the original datasets and attributes, and
+ **they aren't permanently stored until you use `st_write` to save them to a file**

Now [go back to the overview](README.md) or [on to the next page](making-maps-in-R-03-using-tmap.md).
