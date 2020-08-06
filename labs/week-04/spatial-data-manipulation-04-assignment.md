#### Geog 315 T2 2020
# Assignment 2 Spatial data manipulation
## The assignment requirements summarised
Here are the questions from the lab all in one place for ease of reference. The links will take you back to the original context where the question was asked.

### [**Question 1**](spatial-data-manipulation-02-map-projections.md#question-1) IGNORE THIS QUESTION
#### ~Explain to the best of your ability what has gone wrong in the mapping that we just attempted. Look back to when you loaded the two datasets at the bounding box information provided when each dataset was loaded. (15%)~

### [**Question 2**](spatial-data-manipulation-02-map-projections.md#question-2)
#### Explain to the best of your ability what is happening when you use the command above,  `ca_tracts <- st_transform(ca_tracts, st_crs(abb))` with specific reference to how we specify the projection to be used in the transformation, that is the `st_crs(abb)` part. (~10%~12%)

### [**Question 3**](spatial-data-manipulation-03-spatial-joins.md#question-3)
#### How would you change the code above to restrict the data to a different county, say Alameda (code `001`, in the Bay Area across from San Francisco). *Demonstrate that you know how to do this, by including a simple map of the census tracts for Alameda County in your answer*. (~20%~24%)

### [**Question 4**](spatial-data-manipulation-03-spatial-joins.md#question-4)
#### Describe in words what has been accomplished in the preceding step. Which TRACT information is now associated with each Airbnb listing, and on what basis? (~20%~24%)

### [**Question 5**](spatial-data-manipulation-03-spatial-joins.md#question-5)
#### Make a simple map from the `abb.counts` dataset using the new count variable `n` to colour the dots associated with the listings. You've already used the `tm_dots` function in previous steps, and it will work here also. You can use all the same options available in the `tm_polygons` function for making choroplethm maps that you have seen previously (palettes, styles, etc.). If you are feeling adventurous you could instead use `tm_bubbles` which will let you scale symbols according to a number with a `size` option. Include your map output and a short write up explaining what you think the map shows. (~35%~40%)

## Submission instructions
Prepare a PDF document that includes answers to the above questions. There are are a couple of maps requested, and the whole document should only need to be 2-3 pages (maximum). Submit the PDF file to the dropbox provided on Blackboard. The due date is end of the day on **31 August**. Remember that you can easily export maps to PNG format images for inclusion in a Word document from *RStudio*.
