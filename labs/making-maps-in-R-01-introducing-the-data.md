#### Geog 315 T2 2020
You can see what the results of running code in this page look like [here](https://southosullivan.com/geog315/labs/making-maps-in-R-01-introducing-the-data.html).

# Introducing the data
First you need to load the `sf` library for handling spatial data, `tmap` for mapping, and `dplyr` for data wrangling.

```{r}
library(sf)
library(tmap)
library(dplyr)
```

The data for this week are election results from the US Presidential Election of 2016 (the one that gave us president Donald J. Trump). 

The data are at the county level for the US (over 3000 counties of wildly varying populations), with numbers of votes recorded for the two major parties &mdash;Democrat (`dem`) and Republican (`gop`)&mdash; along with some other minor parties: Libertarian (`lib`), Green (`grn`), Evan McMullin (`una`) and 'Other' (`oth`).

You will find the data in the [this geopackage file](election.gpkg?raw=true). Download it to an accessible folder on the computer you are working on (this will be **on the H: drive** if you are on a lab computer). Then open *RStudio* and use **Session - Set working Directory - Choose Working Directory...** to set the session working directory to the folder where you saved the data.

Then you can read the data using the `st_read` function

```{r}
results <- st_read('election.gpkg')
```

To make sure all is as it should be, take a look at the first few rows of the data using the `head` function

```{r}
head(results)
```

[By the way, there is also a `tail` function.] You can also see the dataset by clicking on it in the **Environment** tab of *RStudio*. If you want to make sure the spatial aspects are working OK, then try

```{r}
plot(select(results, population))
```

OK... the goal eventually will be to make a map of the election results. Here, I'll explain the variables in the dataset.

The spatial units are US counties. Each county is in a particular state and has a name. This information is contained in the `state` and `name` attributes. The state's each have a two letter abbreviation, as shown on [this map](https://en.wikipedia.org/wiki/List_of_U.S._state_abbreviations#Postal_codes), so for example, California is 'CA'. Not all counties have unique names, so we need the state names to uniquely identify them. For example

```{r}
filter(results, name == 'Washington')
```

will return a list of 32 (yes 32!) counties called Washington. There are also several Jefferson counties and a few other duplicates besides.

Of more relevance to the assignment are the vote and population information contained in the other variables as follows:

+ `population` an estimate of the county populations. Note that these vary widely. Use `summary(results$population)` to see just how much
+ `votes` the total number of votes cast in the presidential election in the county
+ `dem` votes cast for the Democratic Party candidate (i.e. Hillary Clinton)
+ `gop` votes cast for the Republican Party (GOP) candidate (i.e. Donald Trump)
+ `grn`, `lib`, `una`, `oth` votes case for respectively the Green, Libertarian, Independent, and 'Other' candidates - apart from Utah, these numbers are rather low across the country

In the assignment it is important to consider if these vote *counts* are what you want to map (and why) or if it makes more sense to make additional variables for the vote *share* of the different candidates, or even of the margin of victory, or difference between various candidate's votes. To quickly map any one of these attributes, use the following (you can change the variable or the colours easily)

```{r}
tm_shape(results) + 
  tm_polygons(col='dem', palette='Blues')
```

Now [go back to the overview](making-maps-in-R-00-overview.md) or [on to the next page](making-maps-in-R-selecting-and-tidying-data.md).