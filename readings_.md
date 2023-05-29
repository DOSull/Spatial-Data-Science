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

+ Harris R, D O’Sullivan, M Gahegan, M Charlton, L Comber, P Longley, C Brunsdon, N Malleson, A Heppenstall, A Singleton, D Arribas-Bel, and A Evans. 2017. [More bark than bytes? Reflections on 21+ years of geocomputation](https://dx.doi.org/10.1177/2399808317710132 "More bark than bite..."). *Environment and Planning B: Urban Analytics and City Science* **44**(4) 598-617.

+ Brunsdon C and A Comber. 2021. [Opening practice: supporting reproducibility and critical spatial data science](http://link.springer.com/10.1007/s10109-020-00334-2 "Reproducible science"). _Journal of Geographical Systems_ **23** 477-496.

give a sense of the current state of GIS in relation to broader trends in open data science.

These may also be useful:

+ [R spatial resources](https://www.r-spatial.org/projects/ "R spatial stuff")
+ Thieme N. 2018. [R Generation](https://doi.org/10.1111/j.1740-9713.2018.01169.x "short article on the history of R"). _Significance_ **15**(4): 14–19.

---

## Week 2 Data
+ Online material for [_Data Feminism_](https://mitpressonpubpub.mitpress.mit.edu/data-feminism "Data feminism online stuff")
+ Podcast with  the [authors discussing data feminism](https://newbooksnetwork.com/catherine-dignazio-and-lauren-klein-data-feminism-mit-press-2020/ "data feminism on the new books network podcast")
+ Wickham H. 2014. [Tidy Data](https://dx.doi.org/10.18637/jss.v059.i10 "Hadley Wickham's article on 'tidy data'"). _Journal of Statistical Software_ **59**(10) 1–23.

---

## Week 3
### Colour and map design
#### The grammar of graphics
+ Wickham H. 2010. [A Layered Grammar of Graphics](https://dx.doi.org/10.1198/jcgs.2009.07098 "Hadley Wickham's article about a layered grammar of graphics"). _Journal of Computational and Graphical Statistics_ **19**(1) 3–28.

#### Some resources on choropleth maps
+ [What to consider when creating choropleth maps](https://blog.datawrapper.de/choroplethmaps/ "choropleth map design considerations") by Lisa Charlotte Muth.
+ Tennekes M. 2018. [`tmap`: Thematic Maps in R](https://www.jstatsoft.org/article/view/v084i06 "The paper introducing tmap to the world"). _Journal of Statistical Software_ **84**(6).

#### Data measurement scales
+ Stevens SS. 1946. [On the theory of scales of measurements](https://www.jstor.org/stable/1675368 "The original paper on scales of measurement - nominal, ordinal, interval, ratio"). _Science_ **103**: 677–680.
+ Velleman PF and L Wilkinson. 1993. [Nominal, ordinal, interval, and ratio typologies are misleading](https://www.jstor.org/stable/2684788 "A more recent take, suggesting the scales are limited, even if useful."). _The American Statistician_ **47**(1): 65–72.
+ Chrisman NR. 1998. [Rethinking levels of measurement for cartography](https://dx.doi.org/10.1559/152304098782383043 "An approach more related to cartographic questions."). _Cartography and Geographic Information Systems_ **25**(4): 231–242.

#### Colour
+ The [ColorBrewer](https://colorbrewer2.org "ColorBrewer website") website is a nice way to get familiar with different colour palettes
+ This [colour blindness simulator](https://www.color-blindness.com/coblis-color-blindness-simulator/ "colour blindness simulator") is really useful for getting an idea of how your maps will look with various kinds of colour blindness
+ This [video about the viridis colour palette](https://www.youtube.com/watch?v=xAoljeRJ3lU "viridis colour palette presentation") project is a great primer about how incredibly complicated colour is

and if you think that's complicated, then here's how complicated it gets when you take colour blindness seriously (which we really should):

+ Nuñez JR, CR Anderton and RS Renslow. 2018. [Optimizing colormaps with consideration for color vision deficiency to enable accurate interpretation of scientific data](https://dx.doi.org/10.1371/journal.pone.0199239 "taking colour blindness seriously"). _PLOS ONE_ **13**(7) e0199239.

---

## Week 4
### Table joins
+ [This page](https://statisticsglobe.com/r-dplyr-join-inner-left-right-full-semi-anti "Summary of the dplyr join operations") provides a nice quick summary of how the various`dplyr`  `*_join` operations work, with a very simple example dataset
+ [Details of the table join operations](https://rstudio-education.github.io/tidyverse-cookbook/transform-tables.html#joins "Joins in the tidyverse cookbook") in the tidyverse cookbook

### Spatial operations
+ [A more complete (and technical) discussion of the `sf` geometry operations](https://r-spatial.org/book/07-Introsf.html#sec-sfintro) available in online form, from the book
  + Pebesma EJ and R Bivand. 2023. _Spatial Data Science: With Applications in R_. Boca Raton, FL: CRC Press.
+ [A more 'GIS-y' take on spatial joins](https://gisgeography.com/spatial-join/)

---
## Week 5
### Visualizing clustering
It is well worth playing with these clustering visualizations:
+ [K-means](https://www.naftaliharris.com/blog/visualizing-k-means-clustering)
+ [DBscan](https://www.naftaliharris.com/blog/visualizing-dbscan-clustering/)

The important thing to keep in mind is that the space in which the points are displayed is not a map, it's a 'data-space', and also, that it is not two-dimensional, it is as-many-dimensional as there are attributes in your dataset (which might be a lot).

### LENZ
The [LENZ project](https://www.landcareresearch.co.nz/tools-and-resources/mapping/lenz/) data are available to download from [here](https://lris.scinfo.org.nz/data/?q=lenz "LENZ project data"). If you are really interested in the technical details, you can find it all [here](https://www.landcareresearch.co.nz/uploads/public/Tools-And-Resources/Maps/LENZ/LENZ_Technical_Guide.pdf "LENZ Technical Guide").

### Geodemographics
On the history from the perspective of two enthusiasts:

+ Spielman SE and A Singleton. 2015. [Studying Neighborhoods Using Uncertain Data from the American Community Survey: A Contextual Approach](https://www.tandfonline.com/doi/full/10.1080/00045608.2015.1052335). *Annals of the Association of American Geographers* **105**(5) 1003–1025.

And a critical perspective from an innocent time when geodemographics seemed like the most appalling invasion of privacy imaginable:

+ Goss, J. 1995. ["We Know Who You Are and We Know Where You Live": The Instrumental Rationality of Geodemographic Systems](https://www.jstor.org/stable/10.2307/144357). *Economic Geography* **71**(2) 171–198.

(things have got a lot worse since those innocent days)

### Monopoly
Not exactly relevant, but the history of the boardgame Monopoly is pretty wild, if you haven't heard it. This [99% Invisible podcast episode](https://99percentinvisible.org/episode/the-landlords-game/) and [this Anthropocene Reviewed one](https://www.wnycstudios.org/podcasts/anthropocene-reviewed/episodes/anthropocene-reviewed-monopoly-academic-decathlon) both have nice overviews (they're also generally great podcasts...). 

If reading is more your speed, then the blow-by-blow is here and I highly recommend it (although I am afraid the library does not have a copy):

+ Pilon M. 2015. [_The Monopolists: Obsession, Fury, and the Scandal Behind the World’s Favorite Board Game_](https://www.marypilon.com/monopoly). New York: Bloomsbury.

---
## Week 6


---
## Week 7


---
## Week 8


---
## Week 9


---
## Week 10


---
## Week 11
