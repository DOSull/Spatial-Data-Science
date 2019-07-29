#### Geog 315 T2 2019 Week 4
# Some data preparation
The spatial data we just loaded has some quirks, so in this document, I explain how you can tidy it up to make it more suitable for the assignment. To do this, we will be using the `dplyr` package (which you should already have loaded) which provides functions for selecting, filtering and combining data in various ways. This week we'll just be seeing these in action, but in later weeks we'll be looking more closely at their operation.

The tasks covered in this document are
+ [Filtering data](#filtering-data) to remove Alaska and Hawai'i
+ [Saving data to spatial data files](#saving-data) to make the filtering we did permanent
+ [Grouping data](#grouping-data) to make a states shapefile
+ [Adding new attributes](#adding-new-attributes) to a dataset

## Filtering data
The data in the `election.shp` file is a bit odd in that it has Alaska and Hawai'i where Mexico is in real life. 

To show how easy it is to select data in *R* we will use the `filter` function from the `dplyr` package to get rid of these. The variable we need to do the selection on is `state`. Say we wanted just to map California, we could do this:

```{r}
plot(filter(results, state=='CA'))
```

How does this work? The `filter` function takes as its first argument the full dataset (in this case `results`), and as its second argument a *condition* telling which cases to retain in the filtered dataset. Here we want all those cases with the `state` value 'CA' (i.e., California). If we wanted all those states *NOT* California, we can use *not equals* which is designated by `!=`

```{r}
plot(filter(results, state!='CA'))
```

So, to get rid of Alaska and Hawai'i we *could* do this:

```{r}
lower48 <- filter(results, state!='AK' & state!='HI')
```

Here we've used a more complicated conditional combining the requirement that the state not be Alaska (AK) *and* not be Hawai'i (HI) using the `&` operator. This works fine and is there is nothing wrong with this approach. 

However, an approach that is beginning to be used more widely makes use of *pipe* operations symbolise by `%>%` to pass an input dataset through a series of operations. This looks like the following:


```{r}
lower48 <- results %>% filter(state!='AK') %>% filter(state!='HI')
```

First, check we got what we wanted:

```{r}
plot(lower48)
```

Because filtering data is not our primary focus right now, we will worry more about exactly how this works in later assignments. 

For now, it is enough to know that we can do this kind of filtering to make new datasets, that the `filter` function is how we do it, and that the *pipe operator* `%>%` is a neat way to do it. 

The way you read the the command above is start with `results` as the input, then pipe it into the first filter (which throws away Alaska, `AK`) then pipe it into a second filter (which throws away Hawai'i, `HI`). Pipe functions are a big feature of the *R* **tidyverse**.

Either way, we now we have a dataset with only the contiguous ('lower 48') states of the US.

## Saving data
Saving a dataset is easy. Just as there is a `st_read` function, there is an `st_write` function. We tell it the dataset to save, and the filename to use, and that's pretty much it. 

The only complication is that if the file already exists, then we also have to tell it that it is OK to delete the existing file, using a `delete_layer` parameter. So here goes:

```{r}
st_write(lower48, 'lower48.shp', delete_layer=TRUE)
```

That's it. You should find that there is now a new shapefile in the folder you are working in.

We can also save to other data formats. For example

```{r}
st_write(lower48, 'lower48.geojson', driver='GeoJSON')
```

will save a GeoJSON file. However, this can get a little tricky if projections are not carefully considered, so for now just *note the possibility*.

## Grouping data
The `lower48` dataset includes an attribute `state` which tells us the US state in which each county is found. We can use this information to make a new shapefile by *dissolving* counties together based on the value of this attribute. In *ArcGIS* you may have seen this already as a 'dissolve' operation. It would be nice if exactly that function was available in `sf` we actually use the `dplyr` function `group_by` instead. Again we make use of pipes:

```{r}
states <- lower48 %>% group_by(state) %>% summarise_if(is.numeric, sum)
```

Here we pass the `lower48` dataset to the `group_by` function, which will use the `state` attribute to group counties. The second pipe sends this result to the `summarise_if` function, which checks if attributes are numeric (the `is.numeric` parameter), and if they are combines values by using a `sum` operation. 

This more or less works, with one exception, the `FID` attribute, which although it is numeric, it is meaningless to sum together. 

We can get rid of the now meaningless `FID` attribute with a `select` operation

```{r}
states <- states %>% select(-"FID")
```

Again, note the pipe operator `%>%`. The `select` function is pretty complicated, so I won't explain it here. Just notice how I use a `-` sign and the variable name of the attribute we want to drop. You should check things look OK

```{r}
head(states)
tm_shape(states) + tm_polygons(col='population')
```

With all that done, we can write the `states` dataset out to a new shapefile

```{r}
st_write(states, 'states.shp', delete_layer=TRUE)
```

## Adding new attributes
Often the attributes we are provided with in a dataset are not quite what we want. Perhaps we want proportions or percentages rather than counts. Or maybe we want densities per unit area, or maybe we want the differences or sums of the original attributes.

It is easy to add new attributes to an existing dataset using the `mutate` function from the `dplyr` package. For example, to create a new variable showing the percentage of population in each state that voted we can do:

```{r}
states <- states %>% mutate(turnout = votes / population * 100)
hist(states$turnout)
```

```{r}
tm_shape(states) + tm_polygons(col='turnout')
```

Try adding some other new variables, such as (say) the margin between the Republican (`gop`) and Democratic (`dem`) votes in each state, or the percentage of votes cast for one of the parties.

Generally speaking it is easier to add new attributes to a dataset, and then when you are happy you have all the attributes you need you can tidy things up a bit by dropping ones you don't need using `select`.

Keep in mind if you add new attributes or make new datasets in this way that (i) they are just as valid as the original datasets and attributes, and (ii) they aren't permanently remembered until you use `st_write` to save them to a file. 

Now [go back to the overview](lab-03-00-overview.md).