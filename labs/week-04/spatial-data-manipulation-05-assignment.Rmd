#### Geog 315 T2 2021
# Assignment 2 Spatial data manipulation
## The assignment requirements summarised
Here are the questions from the lab all in one place for ease of reference. The links will take you back to the original context where the question was asked.

### [**Question 1**](spatial-data-manipulation-02-map-projections.md#question-1)
#### Explain to the best of your ability what is happening when you use the command `sa2_2193 <- sa2 %>% st_transform(st_crs(abb_2193))` with specific reference to how the projection to be used in the transformation is specified, that is the `st_crs(abb_2193)` part. (15%)

### [**Question 2**](spatial-data-manipulation-03-spatial-filters.md#question-2)
#### Change the code above to extend the selection to all the territorial authorities mentioned, and show you succeeded *by including a simple map illustrating your answer*. (20%)

### [**Question 3**](spatial-data-manipulation-03-spatial-filters.md#question-3)
#### This spatial filter selects only statistical areas that include at least one Airbnb listing. Looking at a map of the selected areas, why might it not be a very satisfactory way to narrow down the study area? (20%)

### [**Question 4**](spatial-data-manipulation-03-spatial-filters.md#question-4)
#### In your own words explain what the code above is doing to filter the SA2 data to match the study area of Airbnb listings (you'll find it helpful to refer to lecture materials about the convex hull) (15%)

### [**Question 5**](spatial-data-manipulation-04-counting-points-in-polygons.md#question-5)
#### Finally, make a map of the listings (as points) overlaid on the census SA2 areas coloured by the number of listings in each? Include a short write up explaining what the map shows. (30%)

## Submission instructions
Prepare a PDF document that includes answers to the above questions. There are are a couple of maps requested, but the whole document should only need to be 2-3 pages (maximum). Submit the PDF file to the dropbox provided on Blackboard. The due date is end of the day on **13 August**. Remember that you can easily export maps to PNG format images for inclusion in a Word document from *RStudio*.
