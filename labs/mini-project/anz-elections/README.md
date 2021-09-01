**Geog 315 T2 2021**

# Aotearoa New Zealand General Elections 2017 and 2020
These data are for the general elections held in September 2017 and September 2020, and have been obtained from the [Electoral Commission website](https://www.electionresults.govt.nz).

## Data
The specific election datasets are as follows

### 2017
+ [Locations of polling places](voting-places-2017.gpkg?raw=true). These are direct from the Electoral Commission website, so any errors and omissions are per their data.
+ [General electorate party vote results](non-maori-electorate-detailed-party-results-2017.csv?raw=true) and [Māori electorate party vote results](maori-electorate-detailed-party-results-2017.csv?raw=true) detailed by polling places. These do not include special and postal votes (e.g. votes from serving military or others overseas).

### 2020
+ [Locations of polling places](voting-places-2020.gpkg?raw=true). These are direct from the Electoral Commission website, so any errors and omissions are per their data.
+ [General electorate party vote results](non-maori-electorate-detailed-party-results-2020.csv?raw=true) and [Māori electorate party vote results](maori-electorate-detailed-party-results-2020.csv?raw=true) detailed by polling places. These do not include special and postal votes (e.g. votes from serving military or others overseas).

### Electorate boundaries
You won't necessarily need these, since party votes are proportional and unrelated to electorates, but here is where to find them:
+ [2014 Māori electorates as used in 2017](https://datafinder.stats.govt.nz/layer/104063-maori-electoral-district-2014/)
+ [2014 General electorates as used in 2017](https://datafinder.stats.govt.nz/layer/104062-general-electoral-district-2014/)
+ [2020 Māori electorates](https://datafinder.stats.govt.nz/layer/104579-maori-electorates-2020/)
+ [2020 General electorates](https://datafinder.stats.govt.nz/layer/104580-general-electorates-2020/)

## How I made these
In case you are interested, I assembled the detailed results from the electorate-by-electorate details, using <a target="_blank" href="https://github.com/DOSull/Geog315/blob/master/labs/mini-project/anz-elections/pull-elections-data.ipynb">this python notebook</a>.

If you'd like even more election data, try the Electoral Commission website, or for compiled data from earlier elections, use the [`nzelect` package](https://cran.r-project.org/web/packages/nzelect/vignettes/README.html).

## Commentary
### Data preparation
You'll have to do some preliminary work to make any kind of election maps from these data, attaching the voting information to the polling places and/or then aggregating the votes up to electorates. It's important to keep in mind that the results provided are party votes, not local MP votes, so electorates may not be the most relevant way to look at these data.

### Analysis and/or visualization
In fact, because electorates don't really matter when it comes to party votes, you may want to aggregate to other area units (see generally useful data available [here](../aotearoa-new-zealand-census-data.md)).

You may want to explore the relationship between these voting outcomes and various demographic factors such as age, income, ethnicity, deprivation, etc.

Voting data are famously difficult to map well given widely varying population densities between urban and rural areas. You may want to explore options for cartograms as a way to address this challenge. See for example [ScapeToad](http://scapetoad.choros.place/).
