# Distribution of an invasive species
This project uses observational data on the occurrence of [_tradescantia fluminensis_](https://www.weedbusters.org.nz/what-are-weeds/weed-list/tradescantia/) and should focus on using overlay or related methods (e.g., regression!) to develop a model for the risk of invasion by this species.

## Commentary
### Datasets
The primary dataset for this project is

+ [Confirmed locations of _tradescantia_](tradescantia.gpkg?raw=true)

You will also want supplementary datasets some of them [here](../aotearoa-new-zealand-physical-geography-data.md).

### Ideas
Do some reading about _tradescantia_ and think about factors that might affect its distribution. These are likely to include climate, landcover, and soil. These factors are probably most conveniently modelled using the input layers to the LENZ / LRIS projects ([covered in class in week 5](https://dosull.github.io/Spatial-Data-Science/slides/classification-examples/)) and available [here](https://lris.scinfo.org.nz/).

Given the whole-country coverage of the provided data, it would be a good idea in this case to initially work with only a limited study area to refine ideas, before trying to scale up to the whole country (and if you don't get that far, then you will still have the more local analysis to show). For a different spin, you could focus on a limited area of the country (say the Wellington region) and try to develop a more detailed model&mdash;although this approach might imply focusing on different data layers with more localised variation given the relative climatic uniformity of smaller regions.

Note that you might also need **absence** locations for some kinds of analysis (e.g., logistic regression would require these). This is relatively easily accomplished in _R_ by making randomly located points in a region using `st_sample()`.

If you opt for logistic regression, don't forget that we are here to help! For example, see this explanation of [logistic regression for landslides](https://geocompr.robinlovelace.net/spatial-cv.html#case-landslide).
