**Geog 315 T1 2022**

In case you have restarted the session, reload the libraries and data again

```{r}
library(sf)
library(tmap)
library(dplyr)
library(magrittr) # we need this for the %<>% operator

lower48 <- st_read('lower48.gpkg')
states <- st_read('states.gpkg')
```

# How to use the `tmap` package
The `tmap` package provides a straightforward way to make simple but effective thematic maps in *R*. It can't do all the things you might want in the realm of thematic mapping, but it can do most of the commonly required things, and more importantly do them in a flexible and straightforward way.

A good resource for understanding `tmap` is provided by this [book chapter](https://geocompr.robinlovelace.net/adv-map.html) online.

The idea of `tmap` is that we layer map elements onto a map object. We've already seen this last week, so a simple map is something like

```{r}
tm_shape(lower48) +
  tm_polygons()
```

The first part of the above command `tm_shape(lower48)` says something like "stand back! I am going to make a map, with input dataset `lower48`". `tm_shape` makes the map object, which we can then add more layers to. In the simple example above, we add to it `+ tm_polygons()`, which says something like "and you should style the map based on the fact the data are polygons". For the particular kind of map you are making in this assignment&mdash;a *choropleth* map&mdash; most of the critical information about how the map should look will be included in additional parameters we supply to the `tm_polygons` function.

The various aspects of this are discussed in the sections listed below
+ [Specifying the attribute to be mapped](#specifying-the-attribute-to-map)
+ [Specifying the colour palette](#specifying-the-colour-palette)
+ [Specifying the classification scheme](#specifying-the-classification-scheme)
+ [Adding more layers](#adding-more-layers)
+ [Other stuff](#other-stuff)

## Specifying the attribute to map
The most basic parameter of the `tm_polygons` function is the colour of the polygons. This can be a single colour for all polygons

```{r}
tm_shape(lower48) +
  tm_polygons(col = 'darkgrey', border.col = 'white')
```

I've also shown here how you can change the outline colour (`border.col`) for future reference.

A single colour isn't very interesting, if instead we want to base the colours on the value of one of the dataset attributes, we name that attribute in the call to `tm_polygons`:

```{r}
tm_shape(lower48) +
  tm_polygons(col = 'votes')
```

## Specifying the colour palette
Just like *Arc* used to `tmap` has a mysterious preference for a kind of muddy orange colour as the default. Just like *Arc* it also allows you to specify a very wide range of alternative colour palettes, and you should consider the choice of these carefully in making your map. We specify the colour palette by name. You reverse the direction of the palette by prefixing its name with a `-` sign.

```{r}
tm_shape(lower48) +
  tm_polygons(col = 'votes', palette = 'PRGn')
```

All the named palettes can be examined using the palette explorer in the `tmaptools` package. This might require you to install an additional library. If so use the **Tools - Install Packages...** menu option in *RStudio* to do so. After `tmaptools` is installed, you can do:

```{r}
library(tmaptools)
palette_explorer()
```

**Note that after you run the palette explorer you have to close it to do anything else!**

You can get a feel for what many of the available palettes will look like in an actual map at [this website](http://colorbrewer2.org).

Specifying your own palette is much trickier, and involves supplying the palette option of `tm_polygons` with a vector of colours that you want it to interpolate along.

```{r}
tm_shape(lower48) +
  tm_polygons(col = "votes", palette = c("orange", "purple"))
```

It is difficult to control the behaviour of this option precisely, so **I recommend you stick with the built-in named palettes to begin with**. They provide a lot of options, without trying to get too clever. It may still be interesting to explore this option, however.

## Specifying the classification scheme
Specifying the colours and the attribute is only half the choropleth map design problem. The other aspect is to specify both the number of colours to use, and more importantly how to divide the values of the mapped attribute into classes for colouring. This aspect of the design is determined by the `style` and `n` parameters. For example

```{r}
tm_shape(lower48) +
  tm_polygons(col = 'dem', palette = 'Blues', style = 'quantile', n = 9)
```

will produce a classification based on *quantiles* and 9 classes. There are a number of different possible classification styles:

+ `equal` will divide the data range into equal length intervals
+ `sd` is a variant of equal intervals where the intervals will be in some round number of *standard deviations*
+ `quantile` will divide the range so that each class has an approximately equal number of cases (in this case counties); depending on how the data are distributed, this may result in intervals of very different sizes
+ `kmeans`, `hclust`, `bclust`, `fisher` and `jenks` will attempt to cluster the data into groups that make sense with respect to the distribution of the data values
+ `cont` will not set up classes at all, but will assign colours to cases (i.e., counties) based on their exact values along a continuous range

The best way to get a feel for these is to experiment.

One thing you should do is examine the distribution of the attribute you are mapping to make sure that the chosen style of classification makes sense. You can do this using a histogram to see the distribution of the attribute you are mapping:

```{r}
hist(lower48$votes)
```

For example, in this case, the `votes` attribute is highly skewed, because there are a small number of very high population counties. This means that if we use `equal` intervals (say intervals of 200,000 as in the histogram) then almost all the counties will be in the first class and there will be lots of classes (i.e., colours) with no associated county. In such a case it would make more sense to use a `quantile` style, although we then have to be sure that the chosen class boundaries make sense. Of course, the design problem will change if you focus on mapping not numbers of votes, but shares of the vote, since these are more comparable across counties regardless of their population (since they are inherently limited to a range between 0 and 100%).

One option is the `pretty` style, which will choose data values that are easy to read at equally spaced intervals.

```{r}
tm_shape(lower48) +
  tm_polygons(col = 'votes', palette = 'viridis', style = 'pretty')
```

In preparing your final map for this assignment the choice of colour palette, number of classes and classification style are the most relevant aspects to consider, on which you will be expected to comment in writing up.

## Adding more layers
To add an additional layer to a map, you add another `tm_shape` function call. In this case, we could add state boundaries

```{r}
tm_shape(lower48) +
  tm_fill(col = 'population', palette = 'Reds', style = 'quantile', n = 9) +
  tm_shape(states) +
  tm_borders(col = 'black')
```

In this example, we use `tm_borders` because we're only interested in the state boundaries, and have ensured that there are no county boundaries by using `tm_fill` instead of `tm_polygons` for the `lower48` layer of the map. Notice that the order of adding layers is important. The `tm_fill` function applies to the most recently added data layer (`lower48`), then the `states` data layer is added, and so the `tm_borders` function which follows applies to it.

## Other stuff
There are many other map elements that can be controlled using `tmap` functions. We can add a north arrow and scale bar using `tm_compass()` and `tm_scale_bar()`. We can move the position of the legend around using `tm_legend()` options. We can add text using `tm_text()`. Here's an example with many options.

```{r}
tm_shape(lower48) +
  tm_fill(col = 'population', palette = 'Reds', style = 'quantile', n = 9, alpha = 0.75) +
  tm_legend(outside = TRUE, outside.position = 'right') +
  tm_shape(states) +
  tm_borders(col = 'black', lwd = 2) +
  tm_text(text = 'state', shadow = TRUE, remove.overlap = TRUE) +
  tm_compass() +
  tm_scale_bar(position = 'left')
```

Two options that are good to know about both used here are that the line thickness in plots is controlled by a `lwd` setting, and opacity of colours by an `alpha` setting.

This is not a perfect map by any means (maybe not even a good one). You may see duplicate labels on the states because some states have more than one polygon (for example California and Texas have offshore islands) and `tmap` may label each island (the `remove.overlap` option helps a bit). There are ways to fix this kind of problem, but we won't worry about that for now.

The best way to figure out all these options is to either ask for help in the lab sessions (or on slack), or to use the help available, by prefixing the command you want to know more about with a `?` mark, such as

```{r}
?tm_legend
```

Any of the functions in *R* has associated help that you can consult in this way. The explanations can be a little bit technical sometimes, but it is a good idea to get used to consulting the help.

Above all, you should not be afraid to experiment!

[&lArr; previous page](making-maps-in-R-02-selecting-and-tidying-data.md) &bull; [up to overview](README.md) &bull; [next page &rArr;](making-maps-in-R-04-assignment.md)
