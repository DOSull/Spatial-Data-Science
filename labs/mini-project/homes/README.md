**Geog 315 T1 2022 for T1 2022**

# Wellington house sales, early 2022
These data are from [homes.co.nz](https://homes.co.nz) scraped from their website on or around 30 April 2022. These are 800 or so recent house sales in the Wellington region.

## Dataset
Here are the data: [homes-2022.gpkg](homes-2022.gpkg?raw=true)

The dataset includes sales prices for the houses (the `price` attribute) along with the number of bedrooms, number of bathrooms, listed suburb and quite a few other attributes, some of which may be useful (but certainly not all of them...).

Many of the attributes are also incomplete (it's hard to source good housing data for free in New Zealand, unfortunately).

Take care to check that all the attributes you want to use are stored as the data type you expect&mdash;you *might* need additional processing to clean them up. You may also want to get rid of some attributes that are just clogging up the data table (homes.co.nz have a need for them, you probably don't).

### Ideas
House prices are a clear candidate for applying regression modelling methods.

In this case, in addition to considering bedrooms and bathrooms, an obvious angle are neighbourhoods, and their characteristics and amenities so you may want to make use of additional demographic data available [here](../aotearoa-new-zealand-census-data.md).

You could also revisit the amenities and shops data from the Airbnb assignment, or even get some more using the `osmdata` package or the QuickOSM plugin in QGIS. There are also additional potentially relevant datasets available from Wellington City Council's [open data portal](https://data-wcc.opendata.arcgis.com/).
