#### Geog 315 T2 2020
# Aoteroa New Zealand physical geography data
The two major categories of data likely to be of interest for the mini-projects are elevation and various biophysical indicators.

## Elevation data
Elevation data are available for New Zealand at a wide range of scales and levels of accuracy. Unfortunately the most accurate data (LiDAR) is often extremely large and unwieldy for practical use even for relatively small study area extents (for example, the [Wellington region LiDAR dataset]() is 32GB).

### Relatively low resolution, but manageable
The [SRTM dataset](https://en.wikipedia.org/wiki/Shuttle_Radar_Topography_Mission) has global coverage at around 90m resolution. SRTM tiles can be downloaded using function the _R_ package `raster` with the following command

    dem <- raster::getDate("SRTM", lon = 175, lat = -40)

where you can change the tile, by changing the longitude and latitude. You then save it out to a GeoTIFF or other file format for reuse.

If you want the whole country in one, then a convenient download has been provided by Kim Ollivier and is available through [koordinates.com](https://koordinates.com/layer/1418-nz-80m-digital-elevation-model/) (you'll need to sign up for an account, but it's free and convenient).

### Higher resolution
It's conceivable that you'd want higher resolution if you are doing any of the [Wellington house prices](homes), [landslides](landslides) or [_tradescantia_](tradescantia) projects (although for latter only if you are doing it for a regional extent). Here are useful options (both around 100MB)

+ [Wellington region 15m DEM](https://koordinates.com/layer/3743-16-wellington-15m-dem-nzsosdem-v10/)
+ [South Taranaki district 25m DEM](https://southosullivan.com/geog315/data/taranaki-dem.zip) (right-click save as) which includes coverage of the Waitotara area.

Or there are North and South Island datasets at 25m resolution close to 1GB each (the Taranaki one is in the North Island one):

+ [North Island LRIS 25m DEM](https://lris.scinfo.org.nz/layer/48131-nzdem-north-island-25-metre/)
+ [South Island LRIS 25m DEM](https://lris.scinfo.org.nz/layer/48127-nzdem-south-island-25-metre/)

Note that these are compressed (`zip`) files containing several tiles of elevation grid, which you may need to stitch together into a single raster. You can do this using `raster::merge` in _R_ but may prefer to use tools in a desktop GIS.

## Biophysical data
If you are interested in other biophysical indicators the best bet are the layers that were assembled as inputs to the LENZ project discussed in [clustering applications lecture](https://southosullivan.com/geog315/classification-examples/#/). These are available as individual layers from [here](https://lris.scinfo.org.nz/search/?q=LENZ).

Another resource here is the Landcover Database for New Zealand (LCDB5) available from [here](https://lris.scinfo.org.nz/layer/104400-lcdb-v50-land-cover-database-version-50-mainland-new-zealand/data/). Note that different from the other examples on this page, this is a vector dataset of polygons.

# Data handling
A major challenge with any of these datasets is their size, so figuring out how to deal with that is an initial challenge. Note that the platforms linked above allow you to crop layers _before_ you download them which can save some headaches dealing with huge file and download sizes.

In some cases you'll want to clip the data to a more restricted study area. This can be accomplished in _R_ using the `raster::crop` function or in any GIS with 'clip' or similarly named tools.

In other cases you are not interested in the whole layer at all, but rather in the values of the layer at a collection of point locations. The process of assigning values to points from a raster data layer is usually called 'extraction' and you can do this using `raster::extract` or with the relevant tools in any GIS.

If you are unsure about any of this, just ask!

#### And again: **don't leave downloading them until the last minute!**
