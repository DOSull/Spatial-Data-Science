#### Geog 315 T2 2020
# Aotearoa New Zealand General Election 2017
These data are for the general election held in September 2017, and have been obtained from the Electoral Commission website, particularly [this page](https://www.electionresults.govt.nz/electionresults_2017/statistics/index.html).

## Data
The specific election datasets are as follows

+ [Locations of polling places](voting-places-2017.gpkg?raw=true). These are direct from the Electoral Commission website, so any errors and omissions are per their data.
+ [General electorate boundaries](non-maori-electorates-2017.gpkg?raw=true) and [Māori electorate boundaries](maori-electorates-2017.gpkg?raw=true)
+ [General electorate party vote results](non-maori-electorate-detailed-party-results-2017.csv?raw=true) and [Māori electorate party vote results](non-maori-electorate-detailed-party-results-2017.csv?raw=true) detailed by polling places. These do not include special and postal votes (e.g. votes from serving military or others overseas).

In case you are interested, I assembled the detailed results from the electorate-by-electorate details, using [this python code](collate-election-2017.ipynb).

## Commentary
First of all, remember that these are the 2017 election, nothing to do with the forthcoming election,which will happen more or less while you are working on this, but is likely to see a significantly different result.

### Data preparation
You'll have to do some preliminary work to make any kind of election maps from these data, attaching the voting information to the polling places and/or then aggregating the votes up to electorates. It's important to keep in mind that the results provided are party votes, not local MP votes, so electorates may not be the most relevant way to look at these data.

### Analysis and/or visualization
In fact, because electorates don't really matter when it comes to party votes, you may want to aggregate to other area units (see generally useful data available [here](../aotearoa-new-zealand-census-data.md)).

You may also want to explore the relationship between these voting outcomes and various demographic factors such as age, income, ethnicity, deprivation, etc.

Voting data are famously difficult to map well given widely varying population densities between urban and rural areas. You may want to explore options for cartograms as a way to address this challenge. See for example [ScapeToad](https://scapetoad.choros.place/).
