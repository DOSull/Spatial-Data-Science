# Readings
Details of any additional readings or useful links will be provided on this page. Links should redirect to the library if you need to be logged into the university to access them. Please let me know if you have problems accessing any of the links.

## General
There is no course text, but this one:

  + Brunsdon C and L Comber. 2018. [*An Introduction to R for Spatial Analysis and Mapping*](https://au.sagepub.com/en-gb/oce/an-introduction-to-r-for-spatial-analysis-and-mapping/book258267 "Brunsdon and Comber Introduction to R book") 2nd edn. Sage, London.

might be useful for anyone who wants to extend their *R* knowledge. Also very useful (and freely available online) is

  + Lovelace R, J Nowosad and J Münchow. 2019. [*Geocomputation with R*](https://geocompr.robinlovelace.net/ "Lovelace et al. Geocomputation with R book"). Boca Raton: Taylor & Francis

---

## Week 1 General background
These papers

+ Harris R, D O’Sullivan, M Gahegan, M Charlton, L Comber, P Longley, C Brunsdon, N Malleson, A Heppenstall, A Singleton, D Arribas-Bel, and A Evans. 2017. [More bark than bytes? Reflections on 21+ years of geocomputation](https://dx.doi.org/10.1177/2399808317710132). *Environment and Planning B: Urban Analytics and City Science* **44**(4) 598-617.

+ Brunsdon C and A Comber. 2020. [Opening practice: supporting reproducibility and critical spatial data science](http://link.springer.com/10.1007/s10109-020-00334-2). *Journal of Geographical Systems*.

give a sense of the current state of GIS in relation to broader trends in open data science.

These may also be useful:

+ [R spatial resources](https://www.r-spatial.org/projects/ "R spatial stuff")
+ [A short article on the history of _R_](https://doi.org/10.1111/j.1740-9713.2018.01169.x)

---

## Week 2 Data
+ Online material for [_Data Feminism_](https://mitpressonpubpub.mitpress.mit.edu/data-feminism "Data feminism stuff")
+ Podcast with  the [authors discussing data feminism](https://newbooksnetwork.com/catherine-dignazio-and-lauren-klein-data-feminism-mit-press-2020/ "data feminism on the new books network podcast")
+ Hadley Wickham's article on ['Tidy data'](https://dx.doi.org/10.18637/jss.v059.i10)

---

## Week 3
### Colour and map design
#### The grammar of graphics
Hadley Wickham's article about a [layered grammar of graphics](https://vita.had.co.nz/papers/layered-grammar.pdf)

#### Some resources on choropleth maps
Here are some reasonably useful resources on choropleth mapping
+ [What to consider when creating choropleth maps](https://blog.datawrapper.de/choroplethmaps/)
+ [Choropleth maps in `tmap`](https://michaelgastner.com/DAVisR2021/choropleth-world-maps-and-the-tmap-package.html)

#### Data measurement scales
+ Stevens' 1946 [article on scales of measurement](https://www.jstor.org/stable/1675368 "On the theory of scales of measurement") (nominal, ordinal, interval etc.)
+ Velleman and Wilkinson's 1993 article suggesting that [the typology is limiting and misleading](https://www.jstor.org/stable/2684788 "Nominal, ordinal, interval and ratio typologies are misleading")
+ Nick Chrisman's 1998 article [relating all this to geographical data](https://dx.doi.org/10.1559/152304098782383043 "Rethinking Levels of Measurement for Cartography")

#### Colour
+ The [ColorBrewer](https://colorbrewer2.org) website is a nice way to get familiar with different colour palettes
+ This [colour blindness simulator](https://www.color-blindness.com/coblis-color-blindness-simulator/) is really useful for getting an idea of how your maps will look with various kinds of colour blindness
+ This [video about the viridis colour palette](https://www.youtube.com/watch?v=xAoljeRJ3lU) project is a great primer about how incredibly complicated colour is
+ and if you think that's complicated, [look at what happens when you take colour blindness seriously](https://dx.doi.org/10.1371/journal.pone.0199239) (which you should)

---

## Week 4
### Table joins
+ [This page](https://statisticsglobe.com/r-dplyr-join-inner-left-right-full-semi-anti) provides a nice quick summary of how the various `_join` operations work, with a very simple example dataset
+ [Details of the table join operations](https://rstudio-education.github.io/tidyverse-cookbook/transform-tables.html#joins) in the tidyverse cookbook

### Spatial operations
+ [A more complete (also more technical) take on `sf`'s geometry operations](https://keen-swartz-3146c4.netlify.app/geometries.html#opgeom) in Pebesma and Bivand's _Spatial Data Science_
+ [A more 'GIS-y' take on spatial joins](https://gisgeography.com/spatial-join/)

---
## Week 5
### Visualizing clustering
It is well worth playing with these clustering visualizations:
+ [K-means](https://www.naftaliharris.com/blog/visualizing-k-means-clustering)
+ [DBscan](https://www.naftaliharris.com/blog/visualizing-dbscan-clustering/)

The important thing to keep in mind is that the space in which the points are displayed is not a map, it's a 'data-space', and also, that it is not two-dimensional, it is as-many-dimensional as there are attributes in your dataset (which might be a lot).

### LENZ
The LENZ project data are available to download from [here](https://www.naftaliharris.com/blog/visualizing-dbscan-clustering/). If you are really interested in the technical details, you can find it all [here](https://www.landcareresearch.co.nz/uploads/public/Tools-And-Resources/Maps/LENZ/LENZ_Technical_Guide.pdf).

### Geodemographics
On the history from the perspective of some enthusiasts:

+ Spielman SE and A Singleton. 2015. [Studying Neighborhoods Using Uncertain Data from the American Community Survey: A Contextual Approach](https://www.tandfonline.com/doi/full/10.1080/00045608.2015.1052335). *Annals of the Association of American Geographers* **105**(5) 1003–1025.

And a critical perspective from an innocent time when geodemographics seemed like the most appalling invasion of privacy (things have got a lot worse since those innocent days):

+ Goss, J. 1995. ["We Know Who You Are and We Know Where You Live": The Instrumental Rationality of Geodemographic Systems](https://www.jstor.org/stable/10.2307/144357). *Economic Geography* **71**(2) 171–198.


### Monopoly
Not exactly relevant, but the history of the boardgame Monopoly is pretty wild, if you haven't heard it. This [podcast](https://99percentinvisible.org/episode/the-landlords-game/) and [this one](https://www.wnycstudios.org/podcasts/anthropocene-reviewed/episodes/anthropocene-reviewed-monopoly-academic-decathlon) both have nice overviews (they're also generally great podcasts...)
