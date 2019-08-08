#### Geog 315 T2 2019 Week 4
# The assignment
Your task is to make a map of the presidential election result contained in the supplied dataset.

In doing this, you need to consider the following issues:
+ Appropriate data to map. Probably none of the supplied attributes is quite what you need to make an effective map, so you will need to add one or more new attributes (this was explained [here](lab-03-02-selecting-and-tidying-data.md#adding-new-attributes))
+ Choose an appropriate map classification style, a sensible number of classes, and a meaningful colour scheme (there are explanations of how to do all these things [here](lab-03-03-using-tmap.md))
+ Add any additional map features that you think are useful such as a legend, north arrow, scale bar, overlay of state boundaries and so on

Some particular questions to consider:
+ What is the most salient piece of data in an election situation? Is this piece of data available in the original dataset? How could you add this data to the provided dataset?
+ What is the most salient information in US Presidential elections *in particular*? Would that make a 'better' or more interesting map?
+ Are the numbers of votes more relevant than the relative vote shares of each party (keep in mind the very large differences in county populations)?
+ For reasons mostly to do with television rather than politics, the colour conventions in US politics are Democrats (`dem`) = blue, Republicans (`gop`) = red. Consider this when choosing a colour palette to work with.
+ Consider adding the state boundaries as a layer on top of the county results (how to do this is [covered in the tutorial materials](lab-03-03-using-tmap.md#adding-more-layers))
+ If you really feel you need to include context information (like, for example, Canada!) one approach is to make a web map, and export it as an image. Be careful about this option however, as it may mean using a strange projection.

Below is an example map

<img src='example-election-map.png'>

There is plenty wrong with this map, so don't necessarily consider it something to aim for. It might not even be showing the most relevant data. (There is no 'correct' map in this assignment, the important thing is your design choices and explanation, and also getting comfortable with using the tools at your disposal.)

When you have made a map you are happy with, use the plot export feature in *RStudio* to export it to a PNG image file, and then include it in a Word document, including a short write up explaining the design choices you made to produce your map. There is no need to provide the *R* code you used&mdash;I am more interested in the design choices, not how they were accomplished.

Once you have finished your write up (it does not need to be very long) then export the Word document to a PDF file (make sure the document includes your map!) and save it to a filename that *includes your name*. Upload this PDF document to [the dropbox provided on Blackboard](https://blackboard.vuw.ac.nz/webapps/assignment/uploadAssignment?content_id=_2510954_1&course_id=_101127_1&group_id=&mode=cpview) by 12PM (noon) on 9 August 2019.
