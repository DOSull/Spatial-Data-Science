#### Geog 315 T2 2021
Make sure you have the libraries we need loaded

```{r}
library(sf)
library(tmap)
library(dplyr)
```

# Introducing the data
The data this week are Census geographies at Statistical Area 2 level for New Zealand, and also data obtained from [Inside AirBnB](http://insideairbnb.com/new-zealand) a site dedicated to understanding the impacts of Airbnb on local housing markets using data obtained from the Airbnb website.

Our aim in this assignment is to organise these data so we can do some analysis (in a later lab) on the relationships (if any) between Airbnb rentals in neighbourhoods and the socioeconomic and demographic character of those neighbourhoods. This week we focus on organising the Airbnb side of things. In a later lab we will add some actual census data (not just the geographies).

You will find the data in this [zip archive file](airbnb.zip?raw=true). As you have done before, download and extract these data to a folder **on the H: drive** of your lab computer (or anywhere accessible on your own computer). 

Then open *RStudio* and use **Session - Set working Directory - Choose Working Directory...** to set the session working directory to the folder where you saved the data. It is important to navigate to the directory you put the data in from the **This PC** location in the Explorer, to avoid the `setwd('~/')` error that many of you will encounter. You can also do this using the **Files** tab in the panel to the lower right in *RStudio*.

You can use the usual approaches to exploring these data, so you know what is going on, although I recommend, that rather than mapping them (they are quite large and may cause issues on some machines) you simply look at the table structure using the `as_tibble` function.

Once you have an understanding of the data [go back to the overview](README.md) or go on [to the next page](spatial-data-manipulation-02-map-projections.md).


