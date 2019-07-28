#### Geog 315 T2 2019 Week 4
# Introducing the data
The data for this week are election results from the US Presidential Election of 2016 (the one that gave us president Trump). 

The data are at the county level for the US (over 3000 counties of wildly varying populations), with numbers of votes recorded for the two major parties &mdash;Democrat (`dem`) and Republican (`gop`)&mdash; along with some other minor parties: Libertarian (`lib`), Green (`grn`), Evan McMullin (`una`) and 'Other' (`oth`).

You will find the data in this [zip archive file](election.zip?raw=true). As before download and extract these data to a folder **on the H: drive** of your computer. Then open *RStudio* and use **Session - Set working Directory - Choose Working Directory...** to set the session working directory to the folder where you saved the data.

Then you can read the data using the `st_read` function as we did last week

```{r}
results <- st_read('election.shp')
```

To make sure all is as it should be, take a look at the first few rows of the data using the `head` function

```{r}
head(results)
```

[By the way, there is also a `tail` function.]

You can also see the dataset using 

```{r}
View(results)
```

and if you want to make sure the spatial aspects are working OK, then try

```{r}
plot(results)
```

OK... the goal eventually will be to make a map of the election results. Here, I'll explain the variables in the dataset.

The spatial units are US counties. Each county is in a particular state and has a name. This information is contained in the `state` and `name` attributes. The state's each have a two letter abbreviation, as shown on [this map](https://en.wikipedia.org/wiki/List_of_U.S._state_abbreviations#Postal_codes), so for example, California is 'CA'. Not all counties have unique names, so we need the state names to uniquely identify them. For example

```{r}
filter(results, name=='Washington')
```

will return a list of ten counties called Washington. There are also several Jefferson counties and a few other duplicates besides.

Of more relevance to the assignment are the vote and population information contained in the other variables as follows:

+ `population` an estimate of the county populations. Note that these vary widely (use `hist(results$population)` to see just how much)
+ `votes` the total number of votes cast in the presidential election in the county
+ `dem` votes cast for the Democratic Party candidate (i.e. Hillary Clinton)
+ `gop` votes cast for the Republican Party (GOP) candidate (i.e. Donald Trump)
+ `grn`, `lib`, `una`, `oth` votes case for respectively the Green, Libertarian, Independent, and 'Other' candidates - apart from Utah, these numbers are rather low across the country

In the assignment it is important to consider if these vote counts are what you want to map (and why) or if it makes more sense to make additional variables for the vote share of the different candidates.

To quickly map any one of these attributes, use the following (you can change the variable or the colours easily)

```{r}
tm_shape(results) + tm_polygons(col='dem', palette='Blues')
```

Now [go back to the overview](lab-03-00-overview.md)