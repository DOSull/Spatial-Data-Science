[timetable](#lab-and-lecture-timetable) \~
[lectures](#lectures) \~
[labs](#labs) \~
[assessment](#assessment) \~
[links](#additional-information)

**this page last updated** 14 September 2020

**NOTE: materials are constantly being updated. For lab instructions in particular, check that any page you are working from has the heading Geog 315 T2 2020 at the top before working on it!**

# Geog 315 Advanced Geographic Information Systems
This course looks at the more advanced aspects of geographic information systems (GIS). There is a particular emphasis on open source tools and on approaches to doing geospatial analysis in code using *R* as these are becoming increasingly important in science and other workplace settings. The major assessment component of the class is a mini-project exercise which gives students an opportunity to explore methods and topics of interest to themselves, and also to develop confidence exploring and present results from the analysis of spatial data using a modern literate programming approach.

It is expected that students will have completed [GEOG 215](https://www.wgtn.ac.nz/courses/geog/215/2020/offering?crn=25033), [GEOG 415](https://www.wgtn.ac.nz/courses/geog/415/2020/offering?crn=25033) or an introductory course in GIS at another institution.

This document is also available as a [PDF](README.pdf?raw=true) (although links may not work in that version, and it is also not regularly updated).

## Note about delivery of this course in T2 2020
This class is offered face-to-face for both lectures and labs. If you are unable to attend face-to-face, lectures will be recorded and available on Blackboard soon after.

Software required to complete lab sessions is free to download and install so that you can complete labs while working remotely. Details of getting set up in this way will be available in the first week of semester.

Additionally supplemental video tutorial material will be provided (some made by me, some available online) to assist students in completion of labs remotely.

In addition a course Slack channel provides for rapid responses to technical questions about lab materials (please make use of it, and also answer other's questions if you can!). If you have particular difficulties with labs and are working remotely then appointments to meet by zoom can be made from [this link](https://calendly.com/dosullivan).

### Important dates

Item | Dates
 -- | --
Trimester | 13 July to 24 October 2020
Teaching period | 13 July to 16 October 2020
Mid-trimester break | 17 August to 30 August 2020
Last assessment item due | 16 October 2020
Study period | NA
Examination period | NA
Withdrawal dates | See [Course additions and  withdrawals](https://www.victoria.ac.nz/home/admisenrol/payments/withdrawalsrefunds)

If you cannot complete an assignment or sit a test or examination, refer to [Aegrotats](https://www.victoria.ac.nz/home/study/exams-and-assessments/aegrotat)

### Lecture and lab schedule
Lectures are in ~~LT102 Murphy~~ **304 Cotton** from **1:10-2:00** on **Tuesdays** and **Fridays**.

Lab sessions are in **KK 216** from **10:00-11:50** on **Thursdays**.

### Contact details
Both David O'Sullivan and Andy Rae will attend the lab sessions, which other than urgent cases is probably the best way to contact us.

#### Lecturer/coordinator
**Prof. [David O'Sullivan](mailto:david.osullivan@vuw.ac.nz)**
**Office** CO227 **Extn.** 6492 **Office hours by appointment** [click here](https://calendly.com/dosullivan)

#### GIS Technician
**[Andrew Rae](mailto:andrew.rae@vuw.ac.nz)**
**Office** CO502 **Office hours** Wed 10-12 in CO110

## Lab and lecture timetable
Here's the trimester schedule we will aim to follow. **Bolded labs** have an associated assignment that must be submitted and contributes the indicated percentage of the course credit.  Relevant materials (lecture slides, lab scripts and datasets) are linked below, when available.

Date | Tue | Thu (lab) | Fri
-- | -- | -- | --
13 Jul | Course introduction | [Lab session to get software setup](labs/week-01) | [Open science, open source, and doing GIS in code](https://southosullivan.com/geog315/open/)
20 Jul | [Starting *R*](https://southosullivan.com/geog315/starting-r/) | [Introducing *R* and *RStudio*](labs/week-02) | [The myth of tidy data](https://southosullivan.com/geog315/tidy-data/)
27 Jul | [Choropleth map design](https://southosullivan.com/geog315/choropleth-maps/) | [**Making maps**](labs/week-03) (15%) due 10 Aug | [Data wrangling](https://southosullivan.com/geog315/data-munging/)
3 Aug | [Spatial data wrangling](https://southosullivan.com/geog315/spatial-data-munging/) | [**Spatial data manipulation**](labs/week-04) (15%) due 31 Aug | [Spatial data wrangling (continued)](https://southosullivan.com/geog315/spatial-data-munging/)<br />and [handling tables](https://southosullivan.com/geog315/table-joins-and-dissolves/)
10 Aug | [Clustering analysis](https://southosullivan.com/geog315/classification-clustering/) | [**Geographic cluster analysis**](labs/week-05) (20%) due 10 Sep | [Applications of clustering analysis](https://southosullivan.com/geog315/classification-examples/)
&nbsp; | &nbsp; | **BREAK** | &nbsp;
31 Aug | [Statistics and geography](https://southosullivan.com/geog315/statistics-and-space/) | Help with assignments | [From overlay to regression models](https://southosullivan.com/geog315/from-overlay-to-regression/)
7 Sep | [Regression models](https://southosullivan.com/geog315/regression/) |  [**Building a simple statistical model**](labs/week-07) (20%) due 21 Sep | [More on regression](https://southosullivan.com/geog315/more-on-regression/)
14 Sep | [Other spatial analysis methods](https://southosullivan.com/geog315/spatial-analysis-methods/) | Help with assignments | [Surface analysis](https://southosullivan.com/geog315/surface-analysis/)
21 Sep | Project topics overview and [Running a GIS project](https://southosullivan.com/geog315/running-a-gis-project/) | [**Introducing the mini-projects**](labs/mini-project) (30%) due 16 Oct | [Network analysis](https://southosullivan.com/geog315/network-analysis/)
28 Sep | [Time geography](https://southosullivan.com/geog315/time-geography/) | Project work | Other topics / project support / guest
5 Oct | Other topics / project support / guest | Project work | Other topics / project support / guest
12 Oct | Other topics / project support / guest | Project work | Other topics / project support / guest

## Lectures
Lectures will consist of 40 minutes or so of presented material with time for more open-ended discussion and Q&A based on any reading or other materials students have been asked to explore ahead of class.

The lecture schedule for the second half of trimester is *not set in stone*. Topics to be covered will be determined based on class and project group needs and preferences, and I will also aim to secure two or even three guest lectures, from industry and government practitioners.

### Readings
Details of any required readings will be provided ahead of class and where possible either publicly available, or linked from [Blackboard](https://blackboard.vuw.ac.nz/).

There is no course text. However this one

+ Brunsdon C and L Comber. 2018. [*An Introduction to R for Spatial Analysis and Mapping*](https://au.sagepub.com/en-gb/oce/an-introduction-to-r-for-spatial-analysis-and-mapping/book241031) 2nd edn. Sage, London.

is likely to be useful for anyone who wants to extend their *R* knowledge. Also very useful (and freely available online is

+ Lovelace R, J Nowosad and J Münchow. 2019. [*Geocomputation with R*](https://geocompr.robinlovelace.net/). Boca Raton: Taylor & Francis

## Labs
Lab sessions follow the lecture sessions and will cover related practical topics. Lab materials will generally be found [here](labs/README.md). Only four sessions have an associated assessed assignment, but you should attend all labs and particpate fully to broaden your knowledge of GIScience methods and tools as any of the approaches covered may prove useful for you in other parts of the program. (Note also that a portion of the course credit is for participation in all aspects of the course.)

### Software
Most of the guided lab work will be completed in the [*R*](https://www.r-project.org/) programming language for statistical computing, using various packages tailored to geospatial work. *R*

We will use *R* from the [*RStudio*](https://www.rstudio.com/) environment which makes managing work more straightforward.

Both *R* and *RStudio* are available on the lab computers. Both are freely downloadable for use on your own computer (they work on all three major platforms). We can take a look if you are having issues with your installation, but are likely to suggest that you uninstall and reinstall. In some cases problems might arise from different versions of key packages, in which case you will have to work with the lab machine versions as we can't support multiple versions across different platforms.

## Mini-projects
The final assessment in the class is a mini-project, which is a more open-ended and slightly more substantial exercise in data analysis and presentation. Lab _and_ lecture time in the last 3 weeks or so of semester will be allocated to supporting you in this exercise.

An assortment of datasets will be provided, from which you choose one to work on. The data will need some tidying and sorting to be suitable for use, and you will be expected to figure out the analysis workflow yourself, in order to pursue a particular angle of inquiry.

Datasets are still being assembled, but will cover a range of topics including:

+ Wellington house prices
+ Police involved shootings in the US
+ Landslides in Aotearoa New Zealand
+ Distribution of _tradescantia_ in Aotearoa New Zealand
+ COVID cases in Hong Kong

So hopefully you'll be able to find something of interest. If you have a dataset from some other class or an idea for a topic not in the list of available topics, then please be in touch and we can discuss possibilities.

You can complete this assignment using whatever mix of tools you feel most comfortable with, and that are best suited to the job. Guidance on how *RMarkdown* may be particularly suited to a project of this kind will be offered.

<!-- ## TODO: GIS group project
50% of the assessment for the course is based on a group project that you will formally start work on in the second half of trimester.

Regardless of that late start, project groups and topics will be known long before that and better outcomes are likely if you make a start earlier rather than later. To encourage making an early start, and to focus your thinking groups are required to schedule a meeting at some point between week 4 and week 6 to ensure that you are clear about goals, project organisation, and expectations. Further, there will be project presentations in week 10 so that you have an incentive to make progress well before the end of trimester. This is also a good opportunity to get feedback from class mates.

Asssessment of the projects is based on the progress presentation in week 10, and on individual written reports due in the week after lectures end. Reports are individually written and assessed. More details of project topics, and expectations of the project work itself will be provided in the second week of trimester (or sooner if available).

For more detail on the group project, see [here](projects/README.md).

### TODO: ESRI online tutorials
As part of your project work and preparation, you should complete one or more ESRI online tutorials. These will extend your GIS skills in areas that benefit your group project. The project summaries include the most relevant tutorials for that project. The tutorials normally take up to 3 hours. You will need a headset for most tutorials.

For more details of the tutorials, see [here](projects/esri-online-courses.md). -->

## Course learning objectives (CLOs)
1. Appreciate and describe the scope, limitations and challenges of geospatial methods in real world applications;
2. Record, enter, manipulate and analyse geographic data;
3. Critically assess and communicate geospatial information and the outcome ofgeospatial projects in terms of relevancy to project aims and against more general constraints, e.g. ethical and time constraints;
4. Understand the complexity of data issues concerning the acquisition, creation, quality assurance, management and appropriate analysis and visualisation of spatial and attribute data;
5. Communicate geospatial knowledge effectively;
6. Demonstrate an understanding of spatial information by identifying and applying appropriate geospatial techniques to the solution of a practical project; and
7. The course has three primary aims:

  + To give you a more detailed and critical understanding of geospatial methods and how they are used;
  + To expand your knowledge of geospatial software through guided practicals and a project undertaken in geospatial tools of your choice and through data cleaning and preparation; and
  + To enrich your written and verbal communication skills which are vital in any use of geospatial methods.

## Assessment
This course is 100% internally assessed.  Assessment is based on the various items listed below.

Assessment item | Credit | Due date | CLOs
 -- | -- | -- | --
Making maps | 15% | 10 Aug | 2
Spatial data manipulation | 15% | 31 Aug | 2 4
Geodemographic analysis | 20% | 10 Sep | 6
Building a simple statistical model | 20% | 21 Sep | 6
Mini-project | 30% | 16 Oct | 1 3 5 6 7

Assessments are to submitted electronically via dropbox on [Blackboard](https://blackboard.vuw.ac.nz/). I will aim to return coursework within 3 weeks. Extensions should be requested from the SGEES administration office. If you anticipate problems come and talk to me.

### Late submission penalties
All assignments must be handed in by their due dates. Non-submission  by the required date will result in a 5% penalty  off your grade for that assignment for each day or part thereof that the coursework is late.  No submissions will be accepted more than 5 days after the due date.

Computer crash or similar excuses are not acceptable. Save your material and make sure you have something to submit by the due date.

### Non-assessed lab work
Note that there are also non-assessed lab sessions. In particular lab sessions in the second half of trimester (and some lecture sessions too) are intended to provide an environment in which it is easy to get assistance and advice from the course instructors. You are strongly advised to make the most of these sessions!

## Additional information
The primary mode of communication for the course will be via Blackboard, so please ensure that your contact details there are up to date and are regularly checked (note that Blackboard defaults to your myvuw email address).

**_Check in regularly on Blackboard!_**

### Class representatives
Class representatives provide a way to communicate feedback to the teaching staff during the course. Class representatives will be selected in the first week or two of class, and details of how to contact them will be provided as soon as they are available. Anyone interested in taking on this role, just let me know, so we can resolve any competition! Once we've agreed who is doing it, they can [sign up here](https://www.vuwsa.org.nz/class-representatives).

### Other useful resources
+ [Academic Integrity and Plagiarism](https://www.victoria.ac.nz/home/study/plagiarism)
+ [Aegrotats](https:\\www.victoria.ac.nz/home/study/exams-and-assessments/aegrotat)
+ [Academic Progress](https:\\www.victoria.ac.nz/home/study/academic-progress) (including restrictions and non-engagement)
+ [Dates and deadlines](https:\\www.victoria.ac.nz/home/study/dates)
+ [Grades](https:\\www.victoria.ac.nz/home/study/exams-and-assessments/grades)
+ [Resolving academic issues](https://www.victoria.ac.nz/documents/policy/academic/academic-grievance-policy.pdf)
+ [Statutes and policies including the Student Conduct Statute](https://www.victoria.ac.nz/about/governance/strategy/academic-policies)
+ [Student support](https:\\www.victoria.ac.nz/home/viclife/studentservice)
+ [Students with disabilities](https:\\www.victoria.ac.nz/st_services/disability)
+ [Student Charter](https:\\www.victoria.ac.nz/home/viclife/student-charter)
+ [Student Contract](https:\\www.victoria.ac.nz/home/admisenrol/enrol/studentcontract)
+ [Turnitin](https:\\www.cad.vuw.ac.nz/wiki/index.php/Turnitin)
+ [University structure](https://www.victoria.ac.nz/about/governance)
+ [VUWSA](https:\\www.vuwsa.org.nz)
