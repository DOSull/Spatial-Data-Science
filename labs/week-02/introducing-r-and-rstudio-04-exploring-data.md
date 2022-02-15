**Geog 315 T1 2022**

Reload the data, if you happen to have restarted.

```{r}
quakes <- read.csv('earthquakes.csv')
```

# Exploring the data
*R* provides many different ways to get a feel for the data you are working with. One option is to *plot* it.

```{r}
plot(quakes)
```

This might take a while...  It's also a bad case of *waaaay* too much information. *R* is trying to plot every possible pair of variables in the dataframe, and there is just not enough room to do it. Instead, we can plot a subset.

We need the `dplyr` package to perform tidy selections, so let's load that

```{r}
library(dplyr)
```

and use the `select()` function

```{r}
plot(select(quakes, NZMGE, NZMGN, MAG, DEPTH))
```

This time we have just picked out some columns in the dataset which gives the `plot` function a better chance. The relatively simple way in which *R* can be used to manipulate datasets seen here is a major strength of the platform.

## Looking at individual variables
It's probably more useful to examine some individual variables in isolation. We can refer to individual columns in the dataframe by calling them by dataframe and variable name, such as `quakes$MAG` (note the $ sign). So for example, if I want a summary of the magnitude of the aftershocks in this dataset I type

```{r}
summary(quakes$MAG)
```

or the mean northing coordinate

```{r}
mean(quakes$NZMGN)
```

and *R* will return the values in response. Many other simple results like these are available, such as `min`, `max`, `median` and also `quantile`.

Perhaps more informative is a boxplot or histogram, try:

```{r}
boxplot(quakes$MAG)
```

or

```{r}
hist(quakes$MAG)
```

### A handy shortcut
It gets tedious typing `quakes` all the time, so you can `attach` the dataframe so that the variable names are directly accessible without the `quakes$` prefix by typing

```{r}
attach(quakes)
```

and then you can access the attributes of the `quakes` dataset using their names alone, for example

```{r}
hist(MAG)
```

will plot the specified variable.

Be careful using `attach` as it can lead to ambiguity about what you are plotting if you are working with different datasets that include variables with the same names.

Try the above commands just to get a feel for things.

[&lArr; previous page](introducing-r-and-rstudio-03-meet-the-command-line.md) &bull; [up to overview](README.md) &bull; [next page &rArr;](introducing-r-and-rstudio-05-making-a-map.md)
