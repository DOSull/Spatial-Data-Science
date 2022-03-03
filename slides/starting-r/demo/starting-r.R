# Starting R demo script

# This document is an R script. We'll learn more about these later
# For now you can run each line in the file, by putting the cursor on
# the line and hitting <CTRL><ESC> (or <CMD><ESC> on Mac)

## Make some simple variables <---- this is a comment
x <- 3 
x
y <- c(2, 4, 7, 11, 17) 
y
z <- data.frame(a = 1:1000, b = rep(5, 1000), c = rnorm(1000))
z

# `x` is a scalar, `y` is a vector, and `z` is a dataframe.

# We can apply simple maths operations to any of them
x ^ 2 
y ^ 2

# For the dataframe we can examine it with the `View()` function, or 
# usually a better idea to start look at the first few rows with head()
head(z)

# If we want to examine just one column we use the `$` notation
z$a

# We can apply any R functions to these data with simple commands
# Plot a graph of a value and its square
plot(z$a, z$a ^ 2, type = "line") 

# Plot a whole table as a scatterplot matrix
plot(z) 

# Or a single variable as a boxplot
boxplot(z$c) 

# Or histogram
hist(z$c)


## Simple spatial stuff
# For spatial operations we need some special *packages*, 
# so we load them with the `library()` function
library(sf) 
library(tmap)
tmap_mode("plot") # this is just to make sure we are in static map mode

# Now we can read a spatial dataset
welly <- st_read("welly.geojson") 

# and plot it
plot(welly)

# We can find out what attributes are in the data table with 
# the `names()` function
names(welly)

### Make some simple maps
# We'll be looking at this in labs over the next couple of weeks, 
# for now, here are some simple maps
tm_shape(welly) + 
  tm_polygons(col = "PopUR13")

# We can also add things like scalebars and whatnot if we think we
# they are needed (they are less often needed than you imagine!)
tm_shape(welly) + 
  tm_polygons(col = "Median_Age_UR13", palette = "-Greens",
              title = "Usually resident population, 2013") +
  tm_compass() +
  tm_scale_bar() +
  tm_layout(main.title = "Example of a simple thematic map")

# And even web maps
tmap_mode('view') 
tm_shape(welly) + 
  tm_polygons(col = "Median_Age_UR13", palette = "YlGnBu", 
              alpha = 0.5, title = "Population 2013")
