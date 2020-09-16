#### Geog 315 T2 2020
# Distribution of an invasive species
This project uses observational data on the occurrence of [_tradescantia fluminensis_](https://www.weedbusters.org.nz/what-are-weeds/weed-list/tradescantia/) and should focus on using overlay or related methods to develop a model for the risk of invasion by this species.

## Commentary
### Datasets
The primary dataset for this project is

+ [tradescantia.gpkg?raw=true](Confirmed locatios of _tradescantia_)

You will also want supplementary datasets some of them [here](../README.md#aotearoa-new-zealand-datasets). Others may be accessible locally through the university, and you should ask Andrew Rae for more information on this.

### Ideas
Do some reading about _tradescantia_ and think about factors that might affect its distribution. These are likely to include climate, landcover, and soil. These factors are probably most conveniently modelled using the input layers to the LENZ / LRIS projects ([covered in class just before semester break](https://southosullivan.com/geog315/classification-examples/)) and available [here](https://lris.scinfo.org.nz/).

Given the whole-country coverage of the provided data, it would be a good idea in this case to initially work with only a limited study area to refine ideas, before trying to scale up to the whole country. For a different spin, you could focus on a limited area of the country (say the Wellington region) and try to develop a more detailed model&mdash;although this may not work particularly well given the relative uniformity of smaller regions. 

Note that you might need **absence** locations for some kinds of analysis (for example, both weights-of-evidence overlay and logistic regression would require these). This is relatively easily accomplished in _R_ although you may find it even more straightforward in _ArcGIS_ or _QGIS_.

If you wind up trying logistic regression, don't forget that Andy and I are here to help! The workflow will most likely involve some back and forth between _R_ and various GIS tools.
