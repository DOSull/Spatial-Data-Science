**Geog 315 T2 2023**

# Guidance on the mini-project report
The first thing to note is that this should be an individually written and assessed piece of work. You are free to discuss project ideas and appropriate approaches and analysis with class mates, but whatever you finally submit should be wholly your own work.

## Details of your submission
Now, some specific expectations...

### Overall length and scope
The idea is that the report tells the story of the data exploration and analysis that you carried out in working with the provided data.

Your report should be 1500-2000 words not including any references, and not including things like data tables. Pictures are not worth 1000 words in this context! 2000 words is an _absolute upper limit_ on length. I would expect reports to be shorter than this in almost all cases, and will definitely deduct marks for reports that run way over on length&mdash;being concise and to the point is an important skill in report writing!

I would expect that you include several charts and maps in your report. One or two of these should attempt to show the final outcome of your analysis in some way, but others might show progress towards the final goal.

### Possible organisation of report
You are _absolutely not required_ to follow the outline structure set out below, but some of you may find it helpful in thinking about how to tackle this assignment.

#### 1. Introduction (150-200 words)
The overall topic of  the project, with its major goals and an indication of findings

#### 2. Review of the topic (300-400 words) 
Any background materials from the literature, previous reports, examples of best practice you came across in researching the topic and which influenced how you decided to proceed and (especially) why.

#### 3. Data sources and data processing (300-400 words)
Where you sourced data and general outline of any processing required to make them useable for the work carried out. This should not be a blow-by-blow account of which GIS or _R_ tools you used. It should be more about (for example) what attributes were in the datasets procured that you removed, what reorganization of spatial data types were needed (polygons made into points, rasters into vectors, line layers into network datasets, etc), and also any new derived attributes that you had to create to enable analysis to proceed (e.g., pseudo absence points, areas of landslides, table joins to combine data, etc.)

#### 4. Processing carried out (300-400 words) 
Again this does not need to be a blow-by-blow account of every single step, in detail but an overall description of the workflow, highlighting key steps, major challenges and how these were overcome.

#### 5. Results and discussion (300-400 words) 
Present any results in the form of maps, tables, charts, etc., and discuss their significance and implications.

#### 6. Conclusions (150-200 words) 
Here you might consider:   

- limitations of the results arising from data problems, questionable assumptions, problems with the tools, etc.,
- suggestions for future work (what would you do if you were continuing the work as&mdash;say&mdash;a Masters thesis, with a whole year to work on it?

#### 7. References (not included in word count) 
A list of resources, articles, reports, etc. used in the work. Don't include Esri or other software online help, do include any research articles, government reports, and if online resources helped with solving particular problems, links to websites.

#### Notes
  1. The section outline [above](#possible-organisation-of-report) is for guidance only, but indicates the general coverage expected. You are likely to include figures (maps, tables, charts) throughout the document (it is best if these are positioned close to where they are discussed).
  2. Including images in your report you will generally find the PNG format to be better for map and graph outputs than JPEG. JPEG is fine for photographs and not much else. If your maps looks 'grainy' it's probably because you are using JPEGs.
  3. Problems with image formats and integrating text and figures are all avoided if you prepare your report in _Rmarkdown_. If you are still unsure about this, just ask for help!
  4. In maps, please include legends, but don't worry about scalebars and north arrows, unless the scale or orientation is not obvious from the context. If you aren't using `tmap` to make the maps, also take the time to edit the number ranges shown on legends to sensible values, i.e., not Arc's default preference for 23.457295 - 37.12398508 or whatever, change that to 23.5 - 37.1). I should warn you that this is something I get annoyed by in maps (it indicates a lack of care in the design) and will almost certainly penalize it in marking.
  5. Also on maps... check that you are using a sensible projection for the work you are doing. In most cases this will mean New Zealand Transverse Mercator (EPSG 2193). For US examples it probably means Albers Equal Area.
  6. I am unconcerned about reference formatting, but should be able to easily find anything you do cite. Please cite from within the text when a particular reference is specific to a particular claim you make in the report, i.e., don't just provide a list of resources used with no clear connection to the main text.

**Finally**
There is no rubric for the assessment, which will be based on an overall evaluation of the quality of the report itself and of the thinking and work that underpins it (i.e. the project itself). However, the outline gives a good sense of the overall coverage expected.

## Submission format
Preferred submission format is PDF.

This is for your benefit because PDF documents once saved don't change depending on who is looking at them using what software. Word documents often get garbled when viewed in other programs, so it appears like you failed to include a map or some other goof.

### Making PDFs
You can save to PDF from Word very easily.

#### Using _RMarkdown_
If you choose to write in _RMarkdown_, you should still submit a PDF, not the `.Rmd` file. 

Working in _RMarkdown_ has a number of advantages, mostly that it automates integrating your results into your report. The biggest problem is that it may mean you end up including a lot of code that isn't very interesting to read, and just eats up pages. Here is how I suggest dealing with this:

  1. Do all the data pre-processing (i.e. tidying of data, joining tables, etc.) in other scripts, and save the cleaned datasets to new files. You can then simply write up an explanation of this part of the work in your report (i.e. [section 3](#3-data-sources-and-data-processing-300-400-words) above), without showing all the boring details.
  2. Working from these pre-processed files, you should be able to show key bits of code used to do the work in [sections 4](#4-processing-carried-out-300-400-words) and [5](#5-results-and-discussion-300-400-words). You can control which code and which results get shown with `echo=FALSE` and `include=FALSE` options in the headers of any code chunks (see [here](https://rmarkdown.rstudio.com/lesson-3.html) for details).
  3. Also use `warning=FALSE` and `message=FALSE` options so you aren't including _R_ messages in your document, unless you think I need to see them. 

### Other formats
If you _really_ need to submit a web document, then please discuss options with me before submitting!
