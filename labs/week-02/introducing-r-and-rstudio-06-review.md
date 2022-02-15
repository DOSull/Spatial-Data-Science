**Geog 315 T1 2022**

# Review
The aim of this week has been just to get a feel for things. Don't panic if you don't completely understand what is happening. The important thing is to realize

+ You make things happen by typing commands in the console
+ Commands either cause things to happen (like plots) or they create new variables (data with a name attached), which we can further manipulate using other commands.
+ Variables and the data they contain remain in memory (you can see them in the **Environment** tab) and can be manipulated as required.
+ *RStudio* remembers everything you have typed (check the **History** tab if you don't believe this!)
+ All the plots you make are also remembered (mess around with the back and forward arrows in the plot display).

## Some ways to work more efficiently
### The session history
The **History** tab is particularly useful. If you want to run a command again, find it in the list, select it and then select the **To Console** option (at the top). The command will appear in the console at the current prompt, where you can edit it to make any desired changes and hit `<RETURN>` to run it again.

You can also get the history functionality using the up arrow key in the console, which will bring previous commands back to the console line for you to reuse. But this gets kind of annoying once you have run many commands.

### Scripts
Another way to rerun things you have done earlier is to save them to a script. Open a new script with **File - New File - R Script**. You can type commands here in the usual way, but they won't run immediately like they do when you type them in the console. Instead you can run selected lines using the **Run** button at the top of the scripts area of the user interface (the top left area) for selected lines.

When you have worked a whole workflow out, you can record it in a script file to run the whole thing later. The easiest way to do this is to go to the history, select the commands you want, and then select **To Source** to drop them into an open script file. This will add the commands to the current file in the upper left panel, and then you can save them to a `.R` script file to run all at once.

For example, in the history, find the command used to open the data file, then the one used to attach the data, then one that makes a complicated plot. Add each one in turn to the source file (in the proper order). Then from the scripts area, select **File – Save As...** and save the file to some name (say `test.R`).

What you have done is to write a short program!

To run it select all the code, and hit the **Run** button.

## Here's one I prepared earlier...
To see all this in a simple example, try opening and running the file `example-script.R` in the data provided for this session.

As we work through this class, you'll learn more about these ways of automating work in _R_.

## Additional resources
*R* is really a programming language as much as it is a piece of software, there is a lot more to learn about it than is covered here, or will be covered in this course. If you want to know more about *R* as a general statistics environment there is a [good online guide here](https://cran.r-project.org/doc/contrib/Verzani-SimpleR.pdf) which is worth looking at if you want a more detailed introduction.

For the purposes of this course, the commands you really need to get a handle on are explored in the corresponding weekly labs.

[&lArr; previous page](introducing-r-and-rstudio-05-making-a-map.md) &bull; [back to overview](README.md)
