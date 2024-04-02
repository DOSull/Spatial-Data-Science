# US COVID-19
These data were obtained using the _R_ package `COVID19`, which allows download of publicly available COVID-19 data from a large number of countries. New Zealand data on this subject are not very interesting for our purposes because no detailed spatial breakdown of the numbers is available. if you'd like to do something COVID related in a New Zealand setting, then take a look at the [vaccination project](../vaccination/../README.md).

This is an [interesting podcast](https://99percentinvisible.org/episode/pandemic-tracking-and-the-future-of-data/) about the complexities (and inadequacies) of COVID data collection in the US.

The US data are more interesting, partly because they handled things so badly, so that there was a lot going on, and also because there is detailed geographical information available down to the county level.

## Data
Here's an [example dataset](usa-covid19-220920.gpkg?raw=true). This was downloaded with essentially one line of code:

```{r}
library(COVID19)
usa <- covid19("USA", start = "2020-09-20", end = "2020-09-20", level = 3, raw = TRUE)
```

Some additional processing was needed to get the data into the spatial `gpkg` format, although none of that was very difficult (using the `st_as_sf()` function). Initially, you will have point data at the centroids of spatial units, but it is easy to spatially join polygon data to these if desired.

You also need to change the `start` and `end` date settings to get different dates, or even data for multiple days.

The COVID19 project is impressive and you can find out more about it at their website [https://covid19datahub.io](https://covid19datahub.io/index.html).

Information about what the various attributes of the data mean can be found at [the project website](https://covid19datahub.io/articles/doc/data.html).

## Commentary
### The data
Hopefully you can see potential in these data for interesting explorations. It may be possible to relate outcomes to government responses. Keep in mind that the nature of the COVID-19 pandemic is that outcomes today are a function of what happened weeks or perhaps even months earlier both in terms of disease prevalence as well as measures like school closures, etc.

### Additional data
To explore the data with respect to general population patterns, you will need more general demographic and other data available [here](../us-census-data.md).
