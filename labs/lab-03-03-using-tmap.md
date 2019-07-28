#### Geog 315 T2 2019 Week 4
## How to use the `tmap` package
The `tmap` package provides a straightforward way to make simple but effective thematic maps in *R*. It can't do all the things you might want in the realm of thematic mapping, but it can do most of the commonly required things, and more importantly do them in a flexible and straightforward way.

A good resource for understanding `tmap` is provided by this [book chapter](https://geocompr.robinlovelace.net/adv-map.html) online.

The idea of `tmap` is that we layer map elements onto a map object. We've already seen this last week, so a simple map is something like

```{r}
tm_shape(lower48) + tm_polygons()
```

The first part of the above command `tm_shape(lower48)` says something like "I am going to make a map, and the input dataset is `lower48`". `tm_shape` makes the map object, which we can then add more information to. In the simple example above, we add to it `+ tm_polygons()`, which says something like "and you should style the map based on the fact the data are polygons". For the particular kind of map you are making in this assignment&mdash;a *choropleth* map&mdash; most of the critical information about how the map should look will be included in the parameters we supply to the `tm_polygons` function. 

The various aspects of this are discussed in the sections listed below
+ [Specifying the attribute to be mapped](#specifying-the-attribute-to-map)
+ [Specifying the colour palette](#specifying-the-colour-palette)
+ [Specifying the classification scheme](#specifying-the-classification-scheme)
+ [Adding more layers](#adding-more-layers)
+ [Other stuff](#other-stuff)

## Specifying the attribute to map
The most basic parameter of the `tm_polygons` function is the colour of the polygons. This can be a single colour for all polygons

```{r}
tm_shape(lower48) + tm_polygons(col='darkgrey', border.col='white')
```

I've also shown here how you can change the outline colour (`border.col`) for future reference.

A single colour isn't very interesting, if instead we want to base the colours on the value of one of the dataset attributes, we name that attribute in the call to `tm_polygons`:

```{r}
tm_shape(lower48) + tm_polygons(col='votes')
```

## Specifying the colour palette
Just like *ArcGIS* `tmap` has a mysterious preference for a kind of muddy orange colour as the default. Just like *ArcGIS* it allows you specify a very wide range of alternative colour palettes, and you should consider the choice of these carefully in making your map. We specify the colour palette by name. You reverse the direction of the palette by prefixing its name with a `-` sign.

```{r}
tm_shape(lower48) + tm_polygons(col='votes', palette='PRGn')
```

All the named palettes can be examined using the palette explorer in the `tmaptools` package:

```{r}
library(tmaptools)
palette_explorer()
```

If `palette_explorer()` doesn't work, then you can inspect mny of the available palettes at [this website](http://colorbrewer2.org).

## Specifying the classification scheme
Specifying the colours and the attribute is only half the choropleth map design problem. The other aspect is to specify both the number of colours to use, and more importantly how to divide the values of the mapped attribute into classes for colouring. This aspect of the design is determined by the `style` and `n` parameters. For example

```{r}
tm_shape(lower48) + 
  tm_polygons(col='dem', palette='Blues', style='quantile', n=11)
```

will produce a classification based on *equal intervals* and 10 classes. There are a number of different possible classification styles:
+ `equal` will divide the data range into equal length intervals
+ `sd` is a variant of equal intervals where the intervals will be in some round number of *standard deviations*
+ `quantile` will divide the range so that each class has an approximately equal number of cases (in this counties); depending on how the data are distributed, this may result in intervals of very different sizes
+ `kmeans`, `hclust`, `bclust`, `fisher` and `jenks` will attempt to cluster the data into groups that make sense with respect to the distribution of the data values
+ `cont` will not set up classes at all, but will assign colours to cases (i.e., counties) based on their exact values along a continuous range

The best way to get a feel for these is to experiment.

One thing you should do is examine the distribution of the attribute you are mapping to make sure that the chosen style of classification makes sense. You can do this using `hist` to make a histogram of the attribute:

```{r}
hist(lower48$votes)
```

For example, in this case, the `votes` attribute is highly skewed, because there are a small number of very high population counties. This means that if we use `equal` intervals in this case (say intervals of 200,000 as in the histogram) then almost all the counties will be in the first class and there will be lots of classes (i.e., colours) with no associated county. In such a case it would make more sense to use a `quantile` style, although we then have to be sure that the chosen class boundaries make sense. 

One option is the `pretty` style, which will choose data values that are easy to read at equally space intervals.

```{r}
tm_shape(lower48) + tm_polygons(col='votes', palette='viridis', style='pretty')
```

In preparing your final map for this assignment the choice of colour palette, number of classes and classification style are the most relevant aspects to consider, on which you will be expected to comment in writing up.

## Adding more layers
To add an additional layer to a map, you add another `tm_shape` function call. In this case, we could add state boundaries

```{r}
tm_shape(lower48) + tm_fill(col='population', palette='Reds', style='quantile', n=9) + 
  tm_shape(states) + tm_polygons(alpha=0, border.col='black')
```

In this example, I have used `alpha=0` to make the states transparent, so only see their borders, and I have ensured that there are no county boundaries by using `tm_fill` instead of `tm_polygons` for the `lower48` layer of the map.

## Other stuff
There are many other map elements that can be controlled using `tmap` functions. We can add a north arrow and scale bar using `tm_compass` and `tm_scale_bar`. We can move the position of the legend around using `tm_legend` options. We can add text using `tm_text`. Here's an example with many options.

Two options that are good to know about are that the line thickness in plots is controlled by a `lwd` setting, and opacity of colours by an `alpha` setting (these are both used in the example below).

```{r}
tm_shape(lower48) + 
  tm_fill(col='population', palette='Reds', style='quantile', n=9, alpha=0.75) + 
  tm_legend(outside=TRUE, outside.position='right') +
  tm_shape(states) + tm_polygons(alpha=0, border.col='black', lwd=2) +
  tm_text(text='state', shadow=TRUE, remove.overlap=TRUE) + 
  tm_compass() +
  tm_scale_bar(position='left')
```

This is not a perfect map by any means. The duplicate labels on the states happen because some states have more than one polygon (for example California and Texas have offshore islands) and it seems to be impossible to stop `tmap` labelling each island (the `remove.overlap` option helps a bit). The best way to figure out all these options is to either ask for help in the lab session, or to use the help available, by prefixing the command with a `?` mark, such as

```{r}
?tm_legend
```

Any of the functions in *R* has associated help that you can consult in this way. The explanations can be a little bit technical sometimes, but it is a good idea to get used to consulting the help in this way.

Above all, you should not be afraid to experiment!

[Back to the overview](lab-03-00-overview.md)