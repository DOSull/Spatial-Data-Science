# Wellington house sales, 2021-23
These data are from [homes.co.nz](https://homes.co.nz) scraped from their website in July 2021, April 2022, and September 2023. There are several hundred recent sales at each of those times in each dataset.

## Datasets
Here are the data: 

+ [homes-2023.gpkg](homes-2023.gpkg?raw=true)
+ [homes-2022.gpkg](homes-2022.gpkg?raw=true)
+ [homes-2021.gpkg](homes-2021.gpkg?raw=true)

The dataset includes sales prices for the houses (the `price` attribute) along with the number of bedrooms, number of bathrooms, listed suburb and some other attributes, some of which may be useful (but certainly not all of them...). 

Each year's data contains different variables, because web-scraping is a messy business, and online data sources like these often change formats, variable names, etc. What this means is that the thress datasets aren't easily combined into a single tabular dataset, in case you are tempted to try!

Many of the attributes in all three datasets are incomplete (it's hard to source good housing data for free in New Zealand, unfortunately).

Take care to check that all the attributes you want to use are stored as the data type you expect&mdash;you *might* need additional processing to clean them up. You may also want to get rid of some attributes that are just clogging up the data table (homes.co.nz have a need for them, you probably don't).

### Ideas
House prices are a clear candidate for applying regression modelling methods. This would probably most easily be done for one, two or all three datasets _independently_, i.e., don't combine the data, but make similar models at each 'snapshot', and see if the apparent drivers of prices have changed.

If you are pursuing this angle, then in addition to considering bedrooms and bathrooms, an obvious angle are neighbourhoods, and their characteristics and amenities so you may want to make use of additional demographic data available [here](../aotearoa-new-zealand-census-data.md).

You could also revisit the amenities and shops data from the Airbnb assignment, or even get some more using the `osmdata` package or the QuickOSM plugin in QGIS. There are also additional potentially relevant datasets available from Wellington City Council's [open data portal](https://data-wcc.opendata.arcgis.com/).

Another possibility would be to use each snapshot to estimate mean or median prices in each suburb (using SA2s as a proxy for suburbs), and then use these results to look at how prices may have changed in different suburbs over this two year period.

Keep in mind that these data are not especially consistent over time&mdash; they don't even cover exactly the same geographical extent each year!