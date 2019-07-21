# Introducing *R* and *RStudio*
The data for this lab are in [this file](geog315-lab-02.zip?raw=true) which also includes data from the GPS exercise last week. This is a *zip* file and must be unpacked into a folder on the machine you are using. If you are unsure how to do this, ask, as if you get it wrong, you will inevitably run into problems later in the session.

A preview of the results you can expect to see from this session is available [here](https://southosullivan.com/geog315/labs/lab-02-introducing-r-and-rstudio.html).

## Introduction
This lab will introduce you to the statistical analysis and programming environment *R*, running in *RStudio* (which makes it a bit easier to deal with). *R* has become one of the standard tools for statistical analysis particularly in the academic research community, but [increasingly also in commercial and other work settings](https://statfr.blogspot.com/2018/08/r-generation-story-of-statistical.html). It is well suited to this environment for a number of reasons, particularly

1. it is free [as in beer];
2. it is easily extensible; and
3. because of 1 and 2, many new methods of analysis first become available in *packages* contributed to the *R* ecosystem by researchers in the field.

The last point is why we are using *R* in this course.

Like any good software, versions of *R* are available for MacOS, Windows and Linux so you can install a copy on your own computer and work on this lab in your own time&mdash;you don't need to be at the timetabled lab sections to complete the assignment, although you will find it helpful to attend to get assistance the course instructors, and also from one another.

To get up and running on your own computer, you will need to download and install *R* itself, from [here](http://cran.r-project.org/) and also, optionally, (**but highly recommended**) install *RStudio* from [here](http://www.RStudio.com/products/RStudio/download/). We can't provide help with this as there are too many different possible configurations and setups on personal computers, but installation is pretty straightforward on all platforms.

When you are running *R* you will want a web connection to install any additional packages called for in lab instructions below. You will also find it useful to have a reasonably high resolution display (an old 1024&times;768 display will not be a lot of fun to work on, but high pixel density modern displays, such as 4K, can be a bit painful also, without tweaking the display settings). For this reason alone, you may find it good to work on the lab machines.

### *DON'T PANIC!*
This lab introduces *R* by just asking you to get on with it, without stopping to explain too much, at least not at first. This is because it's probably better, to just do things with *R* to get a feel for what it's about without thinking too hard about what is going on; kind of like learning to swim by jumping in at the deep end. You may sometimes feel like you are drowning. Try not to worry too much and stick with it, and bear in mind that the assignments will not assume you are some kind of *R* guru.

Ask questions, confer with your fellow students, consult Google (this [cartoon](https://xkcd.com/627/) is good advice).

## Getting started with R
We're using *R* inside a slightly friendlier 'front-end' called *RStudio*, so start that program up in whatever platform you are running on. You should see something like the display below (without all the text which is from an open session on my machine).

<img src="rstudio.png">

I have labeled four major areas of the interface, these are

+ **Console** this is where you type commands and interact directly with the program
+ **Scripts and other files** is where you can write *scripts* which are short programs consisting of a series of commands that can all be run one after another. This is more useful as you become proficient with the environment. Even as an inexperienced user, it is a good place to record the commands that worked in accomplishing whatever tasks you are working on. You can also get tabular views of open datasets in this panel. Note that this window may not appear at initial startup, in which case the console will extend the whole height of the window on the left.
+ **Environment/History** here you can examine the data currently in your session (*environment*) more closely, or if you switch to the history tab, see all the commands you have issued in the session. The latter is very useful for retrieving versions of commands that worked, and copying them to the console or to the script window.
+ **Various outputs** are displayed in this area. These will be plot ouputs, or help information.

Before going any further, it makes sense to do some cleaning up, since the lab machines are shared computers, and there may be data sitting around from the previous session. Use the 'broom' buttons in the **Environment** and **Output** panes to clear these out. Clear the console of previous commands by clicking in the console and selecting **Edit – Clear Console** and then click the X buttons on any open files or datasets in the upper left pane.

Alternatively **Session - New Session** will accomplish the same thing.

Now you have cleaned house, we are ready to go.

### Meet the command line...
The key thing to understand about *R* is that it is a command line driven tool. That means you issue typed commands to tell *R* to do things (this was a normal way to interact with a computer and get work done before the early 1990s, and is making a comeback, like vinyl, but even geekier). There are some menus and dialog boxes in *RStudio* to help you manage things, but mostly you interact with *R* by typing commands at the `>` prompt in the console window. To begin, we'll load up a dataset, just so you can see how things work and to help you get comfortable. As with most computer related stuff, you should experiment: you will learn a lot more that way.

First, open up a data file. This can be done using the **File - Import Dataset** menu, but to get into the spirit of working from the command line, we will do it that way instead. The command we need is in a package called `readr` which we must load using the `library` command. Type exactly the following in the console at the `>` prompt:

```{r}
library(readr)
```

Nothing much will change. But this means you can now use the `read_csv` command to read the supplied dataset, which records information from the Canterbury earthquakes in September 2010 and after.

**Before doing that, make sure you are in the right working directory** (the one with the data in) by using the menu **Session - Set Working Directory - Choose Directory...** to set the working directory.

Then at the command prompt type

```{r}
quakes <- read_csv("earthquakes.csv")
```

This time you should get a message confirming the data have been read and telling you something about them. For example, you can view it using

```{r}
View(quakes)
```

You should see a data table appear in the upper left panel. The data appear very similar to a spreadsheet. In *R*, data tables are known as *dataframes* and each column is an attribute or variable. The various variables that appear in the table are

+ `CUSP_ID` a unique identifier for each earthquake or aftershock event
+ `NZMGE` and `NZMGN` are New Zealand Map Grid Easting and Northing coordinates
+ `ELAPSED_DAYS` is the number of days after September 3, 2010, when the big earthquake was recorded
+ `MAG` is the earthquake or aftershock magnitude
+ `DEPTH` is the estimate depth at which the earthquake or aftershock occurred
+ `YEAR`, `MONTH`, `DAY`, `HOUR`, `MINUTE`, `SECOND` provide detailed time information

Look back at the command we used to read the data. You will see that we *assigned* the result of reading the specified file to a *variable* which we called `quakes`. This means we now have a *dataframe* called `quakes` in memory, which we can examine more closely. To look at the data in more interesting ways we have a range of options. One option is

```{r}
plot(quakes)
```

This might take a while...  It's also a bad case of *waaaay* too much information. *R* is trying to plot every possible pair of variables in the dataframe, and there is just not enough room to do it. We can plot a subset instead:

```{r}
plot(quakes[, c(2,3,5,6)])
```

This time we have just picked out some columns in the dataset which gives the `plot` function a better chance. The relatively simple way in which *R* can be used to manipulate datasets seen here is a major strength of the platform.

### Looking at individual variables
It's probably more useful to examine some individual variables in isolation. We can refer to individual columns in the dataframe by calling them by dataframe and variable name, such as `quakes$MAG` (note the $ sign). So for example, if I want a summary of the magnitude of the aftershocks in this dataset I type

```{r}
summary(quakes$MAG)
```

or the mean northing coordinate

```{r}
mean(quakes$NZMGN)
```

and *R* will return the values in response. Many other simple results like these are available, such as `min`, `max`, `median` and also `quantile`.

Perhaps more informative is a boxplot or histogram, try:

```{r}
boxplot(quakes$MAG)
```

or

```{r}
hist(quakes$MAG)
```

and you should see statistical plots similar to those shown below.

<img src="quakes-MAG-boxplot.png"><img src="quakes-MAG-hist.png">

#### A handy shortcut
It gets tedious typing `quakes` all the time, so you can `attach` the dataframe so that the variable names are directly accessible without the `quakes$` prefix by typing

```{r}
attach(quakes)
```

and then you can access the attributes of the `quakes` dataset using their names alone, for example

```{r}
hist(MAG)
```

will plot the specified variable. Be careful using `attach` as it can lead to ambiguity about what you are plotting if you are working with different datasets that include variables with the same names.

Try the above commands just to get a feel for things.

## Making a map
To mentally prepare you for what's coming, the next few paragraphs walk you through making a map of these data, using some packages that we will look at more closely in the coming weeks. I think it is helpful to do this just to get a feeling for what is going on before we dive into details in the coming weeks.

First, we need to load some relevant libraries

```{r}
library(sf)
library(tmap)
```

We us the `sf` pacakge to read data in spatial formats like shape files, with the `st_read` function:

```{r}
nz <- st_read('nz.shp')
```

To make a map with this, we use the `tmap` package. We'll learn more about this package in the next couple of weeks. Basically it lets you make a map by progressively adding layers of data. To start a map you tell it the dataset to use

```{r}
map <- tm_shape(nz)
```

and then add information to tell *R* how to display the map. In this case, we are mapping polygons, so the `tm_polygons` function provides the needed information (to find out more about the available options, type `?tm_polygons` at the command prompt.

```{r}
map + tm_polygons(col='green', border.col='black')
```

If we want to add a few more cartographic frills like a compass rose and scale bar, we can do that too:

```{r}
map + tm_polygons(col='darkseagreen2', border.col='skyblue', lwd=0.5) +
  tm_layout(main.title='Aotearoa New Zealand',
            main.title.position='center',
            main.title.size=1,
            bg.color='powderblue') +
  tm_compass() +
  tm_scale_bar()
```

For a list of named colours in *R* see [this document](http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf). Try experimenting with changing a few things in the above map. Consult the help on `tm_layout` using `?tm_layout` to see what options are available.

## Adding another layer
The `quakes` dataset is not in a spatial format, although it include spatial information (the easting and northing coordinates). The `sf` package provides the required functions to convert the dataframe to a *simple features* dataset, which *is* a spatial data format. The following command will do the necessary conversion (you need to be careful to type it exactly as shown).

```{r}
qmap <- st_as_sf(quakes, coords=c('NZMGE', 'NZMGN'), crs=st_crs(nz))
```

What's happening here? `st_as_sf` is the function that does the conversion. The *parameters* in parentheses tell the function what to work on. First is the input dataframe `quakes`. Next the `coords` parameter tells the function which variables in the dataframe are the *x* and *y* coordinates in the dataframe. the `c()` structure concatenates the two variable names into a single *vector* which is required by `st_as_sf`. Finally, we also specify the *coordinate reference system* or map projection of the data. These data are in New Zealand Map Grid, which I made sure the `nz` data layer is also in. We use `st_crs(nz)` to retrieve this information from the `nz` dataset and apply it to the new spatial `qmap` layer we are making.

Now we have two datasets we can make a layered map including both of them.

```{r}
tm_shape(nz) +
  tm_polygons(col='darkseagreen2') +
  tm_shape(qmap) +
  tm_dots()
```

That's OK, although not very useful, we really need to zoom in on the extent or *bounding box* of the earthquake data:

```{r}
tm_shape(nz, bbox=st_bbox(qmap)) +
  tm_polygons(col='darkseagreen2') +
  tm_shape(qmap) +
  tm_dots() +
  tm_scale_bar()
```

An alternative to `tm_dots` is `tm_bubbles` which allows us to scale the symbols by some variable:

```{r}
tm_shape(nz, bbox=st_bbox(qmap)) +
  tm_polygons(col='white', lwd=0) +
  tm_layout(bg.color='powderblue') +
  tm_shape(qmap) +
  tm_bubbles(size='MAG', perceptual=TRUE, alpha=0.5) +
  tm_scale_bar()
```

This isn't a great map. It might be easier to see if we only showed the larger aftershocks.

```{r}
bigq <- qmap[qmap$MAG>=4, ]
```

Try again, this time also making the bubbles transparent:

```{r}
tm_shape(nz, bbox=st_bbox(qmap)) +
  tm_polygons(col='white', lwd=0) +
  tm_layout(bg.color='powderblue') +
  tm_shape(bigq) +
  tm_bubbles(size='MAG', perceptual=T, alpha=0) +
  tm_scale_bar()
```

Alternatively, we might use colour to show the different magnitudes:

```{r}
tm_shape(nz, bbox=st_bbox(qmap)) +
  tm_polygons(col='white', lwd=0) +
  tm_layout(bg.color='powderblue') +
  tm_shape(bigq) +
  tm_bubbles(size='MAG', col='MAG', palette='Reds', alpha=0.5) +
  tm_scale_bar()
```

That's probably enough experimenting to give you the general idea.

## A web basemap
One other thing we can do with the `tmap` package is make it a web map instead. We no longer need the `nz` layer, we just have to switch modes

```{r}
tmap_mode('view')
```

[To switch back use `tmap_mode('plot')`]

Then make a map as before, but no need for the `nz` layer

```{r}
tm_shape(qmap) +
  tm_dots(col='MAG', palette='Reds')
```

## Finally... the GPS data from last week
Also included in the data file was last week's GPS data. I merged them into a single combined shapefile, with the different groups distinguished by the `src_id` attribute. The data are in a file called `merged-data.shp`.

### **TRY THIS**

**See if you can read these data in and map them (a web map is best, since it will provide street level context).**

## Review
The aim of this week has been just to get a feel for things. Don't panic if you don't completely understand what is happening. The important thing is to realize

+ You make things happen by typing commands in the console
+ Commands either cause things to happen (like plots) or they create new variables (data with a name attached), which we can further manipulate using other commands. Variables and the data they contain remain in memory (you can see them in the **Environment** tab) and can be manipulated as required.
+ *RStudio* remembers everything you have typed (check the **History** tab if you don't believe this!)
+ All the plots you make are also remembered (mess around with the back and forward arrows in the plot display).

The **History** tab is particularly useful. If you want to run a command again, find it in the list, select it and then select the **To Console** option (at the top). The command will appear in the console at the current prompt, where you can edit it to make any desired changes and hit `<RETURN>` to run it again. You can also get the same history functionality using the up arrow key in the console, which will bring previous commands back to the console line for you to reuse. But this gets kind of annoying once you have run many commands.

Another way to rerun things you have done earlier is to save them to a script. The easiest way to do this is to go to the history, select any commands you want, and then select **To Source**. This will add the commands to a new file in the upper left panel, and then you can save them to a `.R` script file to run all at once. For example, in the history, find the command used to open the data file, then the one used to attach the data, then one that makes a complicated plot. Add each one in turn to the source file (in the proper order). Then from the scripts area, select **File – Save As...** and save the file to some name (say `test.R`). What you have done is to write a short program! To run it go to **Code – Source File...** navigate to the file, and click **OK**. All the commands in the file should then run in one go.

### Additional resources
*R* is really a programming language as much as it is a piece of software, there is a lot more to learn about it than is covered here, or will be covered in this course. If you want to know more about *R* as a general statistics environment there is a [good online guide here](https://cran.r-project.org/doc/contrib/Verzani-SimpleR.pdf) which is worth looking at if you want a more detailed introduction.

For the purposes of this course, the commands you really need to get a handle on are explored in the corresponding weekly labs.
