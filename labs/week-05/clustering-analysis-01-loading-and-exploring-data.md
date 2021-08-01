#### Geog 315 T2 2021
# Loading and exploring data
## Load some libraries
First just make sure we have all libraries we need.
```{r message = FALSE}
library(sf)
library(tmap)
library(dplyr)
library(magrittr)
```

## A refresher on clustering
Clustering methods segment the observations in dataset into _clusters_ or _classes_ based on the differences and similarities between them. The idea of clustering analysis is to break the dataset into clusters or classes such that observations in the same class are similar to each other, and different from observations in other classes.

Unfortunately, there is no easy way to define clusters beyond recognising that clusters are the groups of observations identified by a clustering method! Clustering analysis depends a great deal on the interpretation of an analyst to give it meaning.

What do we mean by 'similar' and 'different'? We extend the basic idea of distance in (two dimensional) space where the distance between observation _i_ and observation _j_ is given by 

<img src="pythagoras.png" style="height:30px;">

that is the square root of the sum of the squared differences in each coordinate but apply it to many data dimensions. So if we have a dataset with (say) 15 attributes, we are in a 15 dimensional data space, and we take the sum of the squared differences in each of the 15 dimensions (i.e. on each variable) between every pair of observations, add them together and take the square root.

Other versions of the basic idea of 'total difference' in attribute values are possible.

An important consideration is that all the attributes be rescaled so that the differences in one particular attribute which happens to have large values associated with it don't 'drown out' differences in other variables. For example if one variable is mean income in dollars and has values like 25000 or 50000, while another variable is proportion of children under 5 and has values like 0.04 or 0.05, then if do not rescale things, the differences in income will swamp any differences in the demographic mix.

A similar concern is that we try not to include lots of strongly correlated variables in the analysis.

## Example data
For the example dataset, things have already been prepared so we can focus on the clustering itself. For the dataset in the assignment, you will are asked to consider doing some data preparation to rescale data values before applying cluster analysis.

The example data are a collection of demographic variables for San Francisco, California from the 2010 census. You can explore the dataset interactively [at this website](http://lucguillemot.com/bayareageodemo/) to get a feel for things.

Download the data from [this link](sf_demo.gpkg?raw=true), and open them in _R_

```{r}
sanfran <- st_read("sf_demo.gpkg")
```
If you run `summary(sanfran)` you'll see that all these variables have been scaled so that the values range from 0 to 1. We won't worry for the sake of the example exactly how this has been done for this dataset, but it's something we need to pay attention to for the assignment dataset.

### Make a data only copy
For some of what follows the existence of the `geometry` attribute causes errors, so it is helpful to make a data-only copy. It is convenient to designate this with `.d` on the name. Because it is a direct copy the rows of the data table stay in the same order, which is important later when we do the cluster analysis.

```{r}
sanfran.d <- sanfran %>%
  st_drop_geometry() %>%
  select(-id) # remove the ID variable since it is just an identifier
```

## Getting a feel for the data
This is a complicated dataset, with 24 attributes. We're likely to be interested lots of possible relationships and patterns in the data, but it's difficult to get a handle on things with so much going on. In this section I'll show you a few possibilities, which you may wish to try with the assignment data later. We don't really have the time to cover what is going on with all these optiosn in this course (I am happy to answer questions you may have).

### Univariate maps
The `plot()` function will make small maps of 9 or 10 of the variables. If you'd like it to map other than the first 9 or 10, then use select. Note that the colours are a rainbow palette with purple/blue for low values through to yellow/orange/red for high.

```{r}
plot(select(sanfran, 10:18))
```

Keep in mind, the `plot()` function is only showing you the first few variables, there are 15 more! If any variable is of particular interest map it with `tmap` in the usual way.

In the short sections that follow, I show some ways to examine all the data, using packages we haven't worked with before. There isn't really scope in this course to fully explain these operations, the focus is simply on getting an idea of the data.

### Boxplots of all the variables
To run the code in this section you need to install and load the `ggplot2` package.

```{r}
require(ggplot2)
require(tidyr)
library(ggplot2)
library(tidyr)
```

We can use the scatter plot and boxplot functionality in this package to get an overview of all the variables in a single graphic. It's unfortunately quite a complicated procedure because it involves transforming the data to a 'long' format, where every row is the observation id, a variable name, and a value. The code below will show each variable as row of dots. To change to boxplots change the `geom_point` to `geom_boxplot` and run it again. It's best just to copy and paste this code and run it to see the result. If you'd like to understand better how it works, just ask me!

```{r}
sanfran %>%
  st_drop_geometry() %>%
  pivot_longer(-id) %>%
  ggplot() +
    geom_point(aes(x = value, y = name)) +
    xlab("Value") +
    ylab("Attribute")
```

### Scatterplots of all the variables
With 24 variables a full scatterplot matrix is impractical. But we can easily do subsets

```{r}
plot(select(sanfran.d, 1:6)) # columns 1 to 6, change as required
```

Here, since we are only using this dataset to illustrate how to perform clustering analysis and aren't interested in its structure as such, we will not spend any more time on this data exploration. In a more realistic situation you would probably want to do so.

Go [back to the overview page](README.md) or [on to the next page](clustering-analysis-02-making-and-mapping-k-means-clusters.md).
