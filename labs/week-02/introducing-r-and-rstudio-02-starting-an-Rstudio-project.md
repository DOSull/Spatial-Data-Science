**Geog 315 T1 2022**

# Starting a new _RStudio_ project
I encourage you to organise your work for each lab in this course as an _RStudio_ project. To do this, first clear out any 'junk' that might be in the session from a previous user of the machine by selection **Session - Clear Workspace...** from the menu options.

Now you have cleaned house, we can create a new project:

+ Select **File - New Project...** from the menu options
+ Assuming you already downloaded and unzipped [the data](data.zip?raw=true), select the **Existing Directory...** option
+ Navigate to the folder where you put the data by clicking the **Browse...** button and then
+ Click the **Create Project** button

_RStudio_ should relaunch itself and in the **Files** tab at the lower right of the interface you should see something like this:
<img src="new-project.png" style="width:80%; margin: 20px">


The file `week1.Rproj` (you might have given it a different name) is an _RStudio_ project file which will keep track of your work over time. When you finish a session you should use the **File - Close Project** menu option, and you will be prompted to save your work.

If you want to take your work to another machine then the _whole folder_ is what you should save to a backup memory device or cloud storage.

When you want to work on an old session, you can just double click the `week1.Rproj` file and _RStudio_ will start up more or less where you left off (although you might have to reload packages if you are using them... we'll talk about this later).

## What if I don't see a `.Rproj` file?
First double check that you followed the instructions correctly.

If you did, the explanation is probably that your operating system is hiding file extensions. A file extension is the part of the filename after the `.` in this case `Rproj`.

Computer operating systems use the file extension to determine what programs can open a particular file. It's useful to see filename extensions to be able to make most effective use of a computer, but modern operating systems often hide this information, I assume to avoid scaring users with how technical they are! For the purposes of this class, computers are technical, so...

To show file extensions follow the instructions below, depending on your operating system:

+ [Show file extenstions in Windows](https://fileinfo.com/help/windows_show_extensions)
+ [Show file extensions on a Mac](https://fileinfo.com/help/mac_show_extensions)

If you get stuck, ask for help! If it's not lab time ask in the slack workspace!

Now you have a new project open, we can continue:

Go to the [next page of instructions](introducing-r-and-rstudio-03-meet-the-command-line.md) or [back to the overview page](README.md).
