# Aoteroa New Zealand Census data
The primary data source for social data is the census of population.

## Some pre-packaged Census data cleaned up by me
I can't vouch entirely for the quality of these datasets, but they are reasonably convenient, and ready to go:
+ [Statistical Area 1 units for the 2006-18 censuses many variables](datasets/sa1.gpkg.zip?raw=true) - I sourced these data from [this link](https://datafinder.stats.govt.nz/data/category/census/2018/sa1-dataset/sa1/), and have done some tidying to remove inlets and lakes etc.
+ [Statistical Area 2 units, built from the above](datasets/sa2.gpkg.zip?raw=true) summing counts where possible, and dropping other variables

Building other units from SA1 (or SA2) data by dissolving polygons with the `group_by() %>% summarise()` operation requires you to join concordance data to the source layer. SA1 and higher level concordance data are [available here](datasets/sa1_concordance.zip?raw=true) in a CSV file.

+ The SA1 and SA2 layers above are very detailed geographically, perhaps more so than you need depending on the scale you are working at. A generalised SA2 dataset which is much more manageable to work with (but has almost no attributes, so you'll have to join those from the SA2 dataset above) is [available here](datasets/sa2-generalised.gpkg?raw=true).

## If you need more...
You can find other source data here: 

+ [datafinder.stats.govt.nz/data/category/census/](https://datafinder.stats.govt.nz/data/category/census/), 

or try building your own tables here: 

+ [nzdotstat.stats.govt.nz](https://nzdotstat.stats.govt.nz/wbos/Index.aspx)

although this is not the easiest tool to use, unfortunately (apparently they are improving it, but that's still [work-in-progress](https://www.stats.govt.nz/tools/we-are-changing-our-data-tools/)).

## Lower or higher levels of detail
For lower levels of detail at Electorate level or Territorial Authority or whatever, you should be able to aggregate up by spatially joining the SA1 or SA2 data to boundaries data for the larger units (which you can make from the SA1 or SA2 dataset and the concordance table provided above).

For more detailed data, you may be out of luck. You can get meshblock boundaries (i.e. the polygons) level [here](https://datafinder.stats.govt.nz/layer/92197-meshblock-2018-generalised/) but the data to populate the meshblocks with are trickier to get hold of and due to small numbers many entries in meshblock data tables are suppressed.

Honestly, for most purposes, meshblock level data are more trouble than they are worth.

# Data tidying
You will almost certainly need to tidy up and reduce any census dataset you use so that its coverage is better aligned with your area of interest, and you retain only attributes you are interested in. You will also want to do things like get rid of sea areas, and so on. You will certainly need time to get a handle on working with census data, and organising and cleaning them, so they can be sensibly included in your project.

#### So again: **don't leave downloading them until the last minute!**
