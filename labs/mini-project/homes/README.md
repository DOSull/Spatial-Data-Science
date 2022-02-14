**Geog 315 T2 2021 - materials still to be finalised for T1 2022**

# Wellington house sales, July-August 2021
These data are from [homes.co.nz](https://homes.co.nz) scraped from their website on or around 1 September 2021. These are about 800 or so recent house sales in the Wellington region.

## Dataset
Here are the data: [homes-2021.gpkg](homes-2021.gpkg?raw=true)

The dataset includes sales prices for the houses (the `price` attribute) along with the number of bedrooms, number of bathrooms, listed suburb and many other attributes, some of which may be useful (many will not...).

Many of the attributes are also incomplete (it's hard to source good housing data for free in New Zealand, unfortunately).

Some attributes which you might expect to be numeric are stored as text and might need additional processing to clean them up. You will probably want to get rid of a lot of attributes that are just clogging up the data table (homes.co.nz have a need for them, you probably don't).

### Ideas
House prices are a clear candidate for applying regression modelling methods.

In this case, in addition to considering bedrooms and bathrooms, an obvious angle are neighbourhoods, and their characteristics and amenities so you may want to make use of additional demographic data available [here](../aotearoa-new-zealand-census-data.md).

You could also revisit the amenities and shops data from the Airbnb assignment, or even get some more using the `osmdata` package or the QuickOSM plugin in QGIS. There are also additional potentially relevant datasets available from Wellington City Council's [open data portal](https://data-wcc.opendata.arcgis.com/).
