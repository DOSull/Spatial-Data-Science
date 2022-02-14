**Geog 315 T2 2021 - materials still to be finalised for T1 2022**

## Landslides in South Taranaki
This project is based on data for over 13000 landslides recorded north of Waitotara in South Taranaki. The aim would be to produce landslide risk maps for the provided study area, based on some kind of overlay analysis of the provided data in combination with other datasets.

## Commentary
### Datasets
Two project-specific datasets are provided

+ [Landslides data](landslides.gpkg?raw=true) captured as polygons which provides some indication of landslide severity (big landslides are more severe...)
+ [Study area](study-area.gpkg?raw=true) an area appropriate for restricting the analysis

You will also want supplementary datasets some of them [here](../aotearoa-new-zealand-physical-geography-data.md). Others may be accessible locally through the university, and you should ask me for more information on this if necessary.

### Ideas
Think about the factors that influence landslide incidence, from landform to landcover, soil and geology. These should determine the additional datasets that you draw on in the analysis. Given the relatively small size of the study area you probably don't need to consider meteorological variation.

Depending on the approach you opt for you may need to convert the landslide polygons to points. This is relatively easy to do in _R_ or any GIS.

You might also need **non-landslide** locations for some kinds of analysis (for example, both weights-of-evidence overlay and logistic regression would require these). This is also relatively easily accomplished in _R_ although you may find it even more straightforward in _ArcGIS_ or _QGIS_.

If you opt for logistic regression, don't forget that we are here to help! The workflow might involve some back and forth between _R_ and various GIS tools, although a lot can be accomplished in _R_ alone. For example, see this explanation of [logistic regression for landslides](https://geocompr.robinlovelace.net/spatial-cv.html#case-landslide).
