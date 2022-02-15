**Geog 315 T1 2022**

# Meet the command line...
The key thing to understand about *R* is that it is mostly a command line interface (CLI) driven tool. That means you issue typed commands to tell *R* to do things (this was a normal way to interact with a computer and get work done before the early 1990s, and is making a comeback, like vinyl, but much less cool, and less boomer).

There are some menus and dialog boxes in *RStudio* to help you manage things, but mostly you interact with *R* by typing commands at the `>` prompt in the console window. To begin, we'll load up a dataset, just so you can see how things work and to help you get comfortable. As with most computer related stuff, you should experiment: you will learn a lot more that way, and since this session is not assessed, you won't break anything important.

## Opening a data file
**Before doing this, make sure you are in the right working directory**. This should already be the case if you set up a project as explained on the [previous page](introducing-r-and-rstudio-02-starting-an-Rstudio-project.md). If not then use the **Session - Set Working Directory - Choose Directory...** menu option to select the folder where you put the data.

Now we are ready to open the file. This can be done using the **File - Import Dataset** menu option, but to get into the spirit of working from the command line, we will do it by typing a command instead.

Type exactly the following in the console at the `>` prompt:

```{r}
quakes <- read.csv("earthquakes.csv")
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

Look back at the command we used to read the data. You will see that we *assigned* the result of reading the specified file to a *variable* which we called `quakes`. This means we now have a *dataframe* called `quakes` in memory, which we can examine more closely.

[&lArr; previous page](introducing-r-and-rstudio-02-starting-an-Rstudio-project.md) &bull; [up to overview](README.md) &bull; [next page &rArr;](introducing-r-and-rstudio-04-exploring-data.md)
