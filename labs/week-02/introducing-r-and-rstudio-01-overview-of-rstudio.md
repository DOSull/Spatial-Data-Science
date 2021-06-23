**Geog 315 T2 2021**

# An overview of *RStudio*
We're using *R* inside a slightly friendlier 'front-end' called *RStudio*, so start that program up in whatever platform you are running on. You should see something like the display below (without all the text which is from an open session on my machine).

<img src="rstudio.png">

I have labeled four major areas of the interface, these are

+ **Console** this is where you type commands and interact directly with the program
+ **Scripts and other files** is where you can write *scripts* which are short programs consisting of a series of commands that can all be run one after another. This is more useful as you become proficient with the environment. Even as an inexperienced user, it is a good place to record the commands that worked in accomplishing whatever tasks you are working on. You can also get tabular views of open datasets in this panel. Note that this window may not appear at initial startup, in which case the console will extend the whole height of the window on the left.
+ **Environment/History** here you can examine the data currently in your session (*environment*) more closely, or if you switch to the history tab, see all the commands you have issued in the session. The latter is very useful for retrieving versions of commands that worked, and copying them to the console or to the script window.
+ **Various outputs** are displayed in this area. These will be plot ouputs, or help information.

Before going any further, it makes sense to do some cleaning up, since the lab machines are shared computers, and there may be data sitting around from the previous session. Use the 'broom' buttons in the **Environment** and **Output** panes to clear these out. Clear the console of previous commands by clicking in the console and selecting **Edit – Clear Console** and then click the **X** buttons on any open files or datasets in the upper left pane.

Alternatively **Session - New Session** will accomplish the same thing.

Now you have cleaned house, we are ready to go.

Go to the [next page of instructions](introducing-r-and-rstudio-02-meet-the-command-line.md) or [back to the overview page](README.md).
