#### Geog 315 T2 2021
# The assignment data: Wellington region commutes, 2018
OK... you will be relieved to know that the assignment is based on a dataset you probably know a bit more about (and which is actually pretty relevant to thinking about geographies of lockdowns), namely data from the 2018 census concerning travel to work and travel to education.

Before loading those data and examining them, make sure you have necessary libraries loaded

```{r message = FALSE}
library(sf)
library(tmap)
library(dplyr)
library(magrittr)
require(ggplot2)
require(tidyr)
```

Now we load the data, and make a data-only copy

```{r}
commutes <- st_read("welly-commutes.gpkg")
commutes.d <- commutes %>%
  st_drop_geometry() %>%
  select(-id)
```

These data are a subset of Statistics New Zealand's 2018 commuter data which they recently made available for the [There and back again](https://www.stats.govt.nz/2018-census/there-and-back-again-data-visualisation-competition) visualization challenge. I entered [this web-application](https://dosull.github.io/commute-viewer/commute-viewer-app/) in that contest, and would encourage you to explore it to get a feel for the kind of information contained in these data. I like my visualization even though I didn't win the contest. Here is [the winning entry](https://commuter.waka.app/).

Specifically the variables in this dataset are as follows:

name | meaning
-- | --
`pop` | usually resident population
`work` | total number working in the area (whether they live there or not)
`study` | total number studying in the area (whether they live there or not)
`w_home` | people working at home
`w_loc_car` | people travelling to work by car within the area (i.e. they live and work in the area)
`w_loc_pt` | people travelling to work by public transport within the area
`w_loc_active` | people travelling to work by an active mode (walking, biking etc) within the area

The other variables are similar, but with `s_` indicating the total refers to study not work (this includes school age children); `_in_` indicating the trip is from some other area into this one, and `_out_` indicating the trip is from this local area to some other local area.

So, for example an area like Wellington CBD which has many inbound work trips will have high values of `w_in_` variables while Kelburn around the university will have a high value for `s_in_` variables. An area with not much employment where most people commute elsewhere to work will have a high values of the `w_out_` variables.

If you are unsure about any of this then ask.

Note that all the attributes are provided as total counts. You may decide that you need to change variables to proportions or percentages of totals, but this can get quite complicated rather quickly, so consider your options carefully. To begin with you may find it easier simply to run clustering analysis to arrive at results and depending on interpretation then later return to do some data tidying.

I advise you to make some maps to get a feel for the data before attempting to do cluster analysis.

Go [back to the overview page](README.md) or [on to the next page](clustering-analysis-04-assignment.md).
