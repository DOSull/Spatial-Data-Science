**Geog 315 T2 2021**

# Wellington house sales, July 2020
These data are from [homes.co.nz](https://homes.co.nz) scraped from their website on or around 1 September 2021. These are about 800 or so recent house sales in the Wellington region.

## Dataset
Here are the data: [homes-2021.gpkg](homes-2021.gpkg?raw=true)

The dataset includes sales prices for the houses (the `price` attribute) along with the number of bedrooms, number of bathrooms, listed suburb and some other bits and pieces. Some attributes which you might expect to be numeric are stored as text and might need additional processing to clean them up.

### Ideas
House prices are a clear candidate for applying regression modelling methods.

In this case, in addition to considering bedrooms and bathrooms, and obvious angle is neighbourhood, so you may want to make use of additional demographic data available [here](../aotearoa-new-zealand-census-data.md).
