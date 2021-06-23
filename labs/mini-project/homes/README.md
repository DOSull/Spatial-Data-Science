**Geog 315 T2 2021**

# Wellington house sales, July 2020
These data are from [homes.co.nz](https://homes.co.nz) scraped from their website on or around 16 June 2020, using the script at [this page](web-scrape-homes.co.nz.ipynb). You don't need to grab any more data for the purposes of this project.

## Commentary
### Dataset
Here are the data

+ [homes-data.csv](homes-data.csv?raw=true)

The dataset includes sales prices for many of the houses (although some are listed as `$TBC`), and the number of bedrooms, number of bathrooms, address, listed suburb and locational information (as latitude and longitude). The price data because they are formatted as `$xxx,xxx`, i.e. with a dollar sign and commas need a bit of processing before most software will treat them as numbers (the _R_ package `stringr` is useful for this, although you might prefer to work in Excel).

You can see the data on [this map](homes.geojson), but you'll need to do some additional data tidying to be able to analyse them spatially in _R_ or any other platform.

### Ideas
House prices are a clear candidate for applying regression modelling methods.

In this case, in addition to considering bedrooms and bathrooms, and obvious angle is neighbourhood, so you may want to make use of additional demographic data available [here](../aotearoa-new-zealand-census-data.md).
