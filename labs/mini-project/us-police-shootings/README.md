#### Geog 315 T2 2020
# US Police shootings 2015-20
These data were obtained from these [_Washington Post_](https://www.washingtonpost.com/graphics/investigations/police-shootings-database/) and [_Guardian_](https://www.theguardian.com/us-news/ng-interactive/2015/jun/01/the-counted-police-killings-us-database) projects to record (to the extent possible) all police-involved shootings in the United States from 2015 onwards. Specifically the data were downloaded from [this site](https://github.com/washingtonpost/data-police-shootings) around mid-June this year (so the most recent data are incomplete).

## Data
Here's [the dataset](us-police-shootings-2015-20.gpkg?raw=true). There are more shootings in the original dataset (at the above link) but these are the 5114 that have been geocoded (i.e. placed on a map).

Information about what the various attributes of the data mean can be found at the above web pages.

## Commentary
### The data
These data while they have been tidied up a little (specifically, I made them mappable so you would not have to) remain quite messy. Many attributes that you might consider numeric (such as the age of the victims) may be treated by some software as text due to the presence of NA values. This suggests you'll need to do some work in _R_ (or some other program) to clean the data up for further analysis.

### Explorations
The most obvious dimension to explore in relation to police shootings in the United States is with respect to the race of victims. Although there are a lot of shootings in these data (over 5000) that doesn't necessarily mean there are very many shootings in any one area (the US is a big place...), and that also means that drawing conclusions about the relative risks to different population groups is tricky. But this is a dimension that could certainly lead to some interesting results.

To explore the data with respect to general population patterns, you will need more general demographic and other data available [here](../README.md#us-datasets).
