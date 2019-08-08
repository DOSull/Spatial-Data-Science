#### Geog 315 T2 2019 Week 5
For reference, results of running the code in this page can be found [here](https://southosullivan.com/geog315/labs/lab-04-03-spatial-joins.html).

Make sure you have the libraries we need loaded

```{r results=FALSE}
library(sf)
library(tmap)
library(dplyr)
```

In what follows, I assume that you have loaded the datasets, and that they are called `abb` (for the Airbnb data) and `ca_tracts` (for the census tracts).

```{r results=FALSE}
abb <- st_read('la-abb-p2770.shp')
ca_tracts <- st_read('ca-tracts-p2770.shp')
```

# Spatial joins, summarising data, and throwing away spatial information
There's a lot to get through in this section.

## Narrowing things down with a `filter` operation
The all of California dataset is kind of a pain to work with, so the first thing we should do is ditch a bunch of it with a `filter` operation. Take a look at the data

```{r}
as_tibble(ca_tracts)
```

Unlike New Zealand data, there is a nice hierarchical organisation to how geographic areas in the US census are labelled. The full `GEO_ID` is a long code, which consists (I kid you not) of an internationally recognised country level identifier (that's the `US` bit), then the state (`06` for California), then the county (the next three digits), then the tract (the next six digits). The first part (`1400000`) conforms with an internationally agreed standard that tells us the level of these spatial units. If you really want to nerd out on this stuff you can read more than ever wanted to know at [this wikipedia page](https://en.wikipedia.org/wiki/FIPS_county_code) and various other linked pages.

*Anyhoo*... 

For our purposes the important thing about these codes (and something we can't do with New Zealand census codes, where the numbering scheme has no obvious internal logic) is that each country has a specific code. The code for Los Angeles county, where all the data of interest are concentrated is `06037` (I looked it up [here](https://en.wikipedia.org/wiki/List_of_United_States_FIPS_codes_by_county)). In the data table that corresponds to the condition that `COUNTY=='037'`, so we can filter our data (remember how this works?) like this:

```{r}
la_tracts <- ca_tracts %>% 
  filter(COUNTY=='037')
```

This should immediately make dealing with the data at least a little bit quicker:

```{r}
tm_shape(la_tracts) + 
  tm_polygons() +
  tm_shape(abb) +
  tm_dots()
```
It's still a lot more information than we need, but it's a start, and we are going to do more tidying up in a little bit.

Before we get to that:

### **Question 3** 
#### How would you change the code above to restrict the data to a different county, say Alameda (code `001`, in the Bay Area across from San Francisco). *Demonstrate that you know how to do this, by including a simple map of the census tracts for Alameda County in your answer*. (20%)

## A spatial join
We've narrowed the tract data down a bit. There are still a lot of Airbnb listings, and for the analysis we want to do next week, we only need the number of listings in each tract. There are various ways we might get that information. One is to spatially join the tracts to the listings, so that for every listing we know the tract that it is in. We'll then be able to count them and join them back to the tracts.

The first step then is a spatial join, using the `st_join` function. We'll make a new dataset called `abb.counts` for this purpose

```{r}
abb.counts <- abb %>%
  st_join(la_tracts)
```

Inspect what we got

```{r}
as_tibble(abb.counts)
```

You know the drill:

### **Question 4** 
#### Describe in words what has been accomplished in the preceding step. Which TRACT information is now associated with each Airbnb listing, and on what basis? (20%)

To give some reassurance that we have made progress, we can try mapping the `TRACT` information now associated with the listings. This is a little bit messy for slightly complicated reasons. The original source of the tract information came from a dataset for all of California, which included several thousand unique tract IDs, or in *R* terms *levels* of the *factor* variable `TRACT`. To save time even as we have whittled down the data, first to just Los Angeles county, and now to only those tracts in which there are Airbnb listings in our data, the information about *all* those levels has been retained. You can confirm this

```{r results=FALSE}
abb.counts$TRACT
```

which is telling us 6522 levels. We can tidy this up, by making a new factor from the old one using a mutate operation. This is not essential (it would be fine to keep all the old information most of the time), but it will make for a nicer map at the next step.

```{r}
abb.counts <- abb.counts %>% 
  mutate(TRACT=factor(TRACT))
```

You can check the new information associated, with the `TRACT` factor now. And we can also make quite a pretty map

```{r}
tm_shape(abb.counts) +
  tm_dots(col='TRACT', scale=2, legend.show=FALSE)
```

## Counting the listings in each tract
OK... hopefully you are still following what is happening.

At this point, we have a dataset `abb.counts` that has for each Airbnb listing information about which tract it is in. We can now use `group_by` and `summarise` to collate this information into counts using a powerful function with a tiny name called `n`

```{r}
abb.counts <- abb.counts %>%
  group_by(TRACT) %>%
  summarise(n=n())
```

Again, inspect the result

```{r}
as_tibble(abb.counts)
```

Now for a slightly more challenging question:

### **Question 5** 
#### Make a simple map from the `abb.counts` dataset using the new count variable `n` to colour the dots associated with the listings. You've already used the `tm_dots` function in previous steps, and it will work here also. You can use all the same options available in the `tm_polygons` function for making choroplethm maps that you have seen previously (palettes, styles, etc.). If you are feeling adventurous you could instead use `tm_bubbles` which will let you scale symbols according to a number with a `size` option. Include your map output and a short write up explaining what you think the map shows. (35%)

## Another join, also, dropping geometries
Hopefully you had fun making that map, but really, it's kind of a dumb map. The counts it contains are meaningfully associated with the tracts, not with the listings, so we need another this time of the counts we have worked so hard to create, back on to the tract dataset. 

We could do a spatial join, but just so you know how to do it, here is how we drop the geometry from a spatial dataset, so it becomes a plain dataframe, and then we can apply a plain `inner_join` instead. Tthis is really just so you know how to do this, if needed, although it makes sense, since as we have seen the spatial information in `abb.counts` is kind of meaningless now anyway, and the information we really need is contained in the `n` and `TRACT` attributes.

You might think if you have been paying attention that a `select` operation would work here, but `select` will fail to drop a `geometry` attribute even if you tell it to

```{r}
abb.counts <- abb.counts %>%
  select(-'geometry')
```

Worse than that, it doesn't even report an error or warn you. But you can check, and you'll see the geometry is still in the table. What we need here is `st_drop_geometry`

```{r}
abb.counts <- abb.counts %>%
  st_drop_geometry()
```

and then we can do the simple `inner_join` we originally tried

```{r}
abb.tracts <- la_tracts %>%
  inner_join(abb.counts)
```

You might get a warning here about a slight mismatch between the levels of the `TRACT` attribute we are joining on, but it's not something to worry about. And finally we can map the numbers of listings in each tract.

```{r}
tm_shape(abb.tracts) + 
  tm_polygons(col='n', palette='Purples', n=10)
```

## Just to put in a word for pipes...
Just to reinforce the advantages of the pipe approach below is *all* the steps in this document in a couple of multistep pipeline operations!

```{r}
# Narrowing down to LA county
la_tracts <- ca_tracts %>%
  filter(COUNTY=='037')

# Making the tract listings counts 
abb.counts <- abb %>%
  st_join(la_tracts) %>%
  group_by(TRACT) %>% 
  summarise(n=n()) %>%
  st_drop_geometry()

# Joining them to the tracts
abb.tracts <- la_tracts %>%
  inner_join(abb.counts)
```

## Saving our work
We've accomplished a lot, so best to save the results, although not without some tidying up first

```{r}
abb.tracts <- abb.tracts %>%
  select('GEO_ID', 'TRACT', 'n')

st_write(abb.tracts, 'la-abb-tracts-p2770.shp', delete_layer=TRUE)
```

**Now [go back to the overview](lab-03-00-overview.md)**

