[timetable](#lab-and-lecture-timetable) \~
[lectures](#lectures) \~
[labs](#labs) \~
[group project](#gis-group-project) \~
[assessment](#assessment) \~
[links](#additional-information)

**last updated** 1 July 2019
# Geog 315 Advanced Geographic Information Systems
This course looks at the more advanced aspects of geographic information systems (GIS). There is a particular emphasis on open source tools and on approaches to doing geospatial analysis in code using *R* as these are becoming increasingly important in science and other workplace settings. The major assessment component of the class is a group project which gives students an opportunity to explore particular methods and topics of interest to themselves, and also to develop teamwork and project planning skills.

It is expected that students will have completed [GEOG 215](https://www.victoria.ac.nz/courses/geog/415/2019/offering?crn=25033), [GEOG 415](https://www.victoria.ac.nz/courses/geog/415/2019/offering?crn=25033) or an introductory course in GIS at another institution.

This document is also available as a [PDF](README.pdf?raw=true) (although links may not work in that version).

### Important dates
Item | Dates
 -- | --
Trimester | 8 July to 9 November 2019
Teaching period | 8 July to 11 October 2019
Mid-trimester break | 19 August to 1 September 2019
Last assessment item due | 18 October 2019
Study period | NA
Examination period | NA
Withdrawal dates | See [Course additions and  withdrawals](https://www.victoria.ac.nz/home/admisenrol/payments/withdrawalsrefunds)

If you cannot complete an assignment or sit a test or examination, refer to [Aegrotats](https://www.victoria.ac.nz/home/study/exams-and-assessments/aegrotat)

### Lecture and lab schedule
Lectures are in AM 105 from 12-1 on Tuesdays and Thursdays.

Lab sessions are in KK 217 and 218 from 12-1:50 on Fridays (starting week 2).

### Contact details
Both David O'Sullivan and Andy Rae will attend the lab sessions, which other than urgent cases is probably the best way to contact us.

#### Lecturer/coordinator
**Prof. [David O'Sullivan](mailto:david.osullivan@vuw.ac.nz)**
**Office** CO227 **Extn.** 6492 **Office hours by appointment** [click here](https://calendly.com/dosullivan)

#### GIS Technician
**[Andrew Rae](mailto:andrew.rae@vuw.ac.nz)**
**Office** CO502 **Office hours** Mon 2-4 in CO110

## Lab and lecture timetable
Here's the trimester schedule we will aim to follow. **Bolded labs** have an associated assignment that must be submitted and contributes the indicated percentage of the course credit.  Relevant materials (lecture slides, lab scripts and datasets) are linked below, when available.

Week | Tue | Thu | Lab | Notes
 -- | -- | -- | -- | --
8 Jul | Review of GIS knowledge (_Mairéad de Roiste_) | Course overview: [Running a GIS project](https://southosullivan.com/geog315/RunningAGISProject/) (_Mairéad de Roiste_) | No lab |
15 Jul | Project topics overview and group formation | [The miracle of GPS](https://southosullivan.com/geog315/GPS/) | [**GPS exercise**](labs/lab-01-geog-315-2019.md) (5%) due immediately |
22 Jul | [Open science, open source, and doing GIS in code](https://southosullivan.com/geog315/Open/) | [Starting *R*](https://southosullivan.com/geog315/Starting-r/) | [Intro to _R_ for spatial](labs/lab-02-introducing-r-and-rstudio.md) |
29 Jul | [Choropleth map design](https://southosullivan.com/geog315/ChoroplethMaps/) | [Data wrangling](https://southosullivan.com/geog315/data-munging/) | [**Making maps in _R_**](labs/lab-03-00-overview.md) (15%) due 9 Aug | Project meeting with instructor
5 Aug | [Spatial data wrangling](https://southosullivan.com/geog315/spatial-data-munging/) | [Statistics and geography](https://southosullivan.com/geog315/statistics-and-space/) | [**Data cleaning in _R_**](labs/lab-04-00-overview.md) (15%) due 16 Aug| Project meeting with instructor
12 Aug | Spatial analysis | Doing a GIS project | **Simple statistical analysis in _R_** (15%) due 6 Sep| Project meeting with instructor
&nbsp; | &nbsp; | BREAK | &nbsp; | &nbsp; | &nbsp;
2 Sep | Topics per project needs | Guest | Lab time: project work |
9 Sep | Topics per project needs | Guest | Lab time: project work |
16 Sep | Project assistance | No class | Lab time: project work |
23 Sep | Project progress presentations I | Project progress presentations II | Lab time: project work |
30 Sep | Project assistance | Project assistance | Lab time: project work |
7 Oct | Project assistance | Project assistance | Lab time: project work |

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

## GIS group project
50% of the assessment for the course is based on a group project that you will formally start work on in the second half of trimester.

Regardless of that late start, project groups and topics will be known long before that and better outcomes are likely if you make a start earlier rather than later. To encourage making an early start, and to focus your thinking groups are required to schedule a meeting at some point between week 4 and week 6 to ensure that you are clear about goals, project organisation, and expectations. Further, there will be project presentations in week 10 so that you have an incentive to make progress well before the end of trimester. This is also a good opportunity to get feedback from class mates.

Asssessment of the projects is based on the progress presentation in week 10, and on individual written reports due in the week after lectures end. Reports are individually written and assessed. More details of project topics, and expectations of the project work itself will be provided in the second week of trimester (or sooner if available).

For more detail on the group project, see [here](projects/README.md).

### ESRI online tutorials
As part of your project work and preparation, you should complete one or more ESRI online tutorials. These will extend your GIS skills in areas that benefit your group project. The project summaries include the most relevant tutorials for that project. The tutorials normally take up to 3 hours. You will need a headset for most tutorials.

For more details of the tutorials, see [here](projects/esri-online-courses.md).

## Course learning objectives (CLOs)
1. Appreciate and describe the scope, limitations and challenges of GIS in real world applications;
2. Record, enter, manipulate and analyse geographic data;
3. Critically assess and communicate GIS information and the outcome of GIS projects in terms of relevancy to project aims and against more general constraints, e.g. ethical and time constraints;
4. Understand the complexity of data issues concerning the acquisition, creation, quality assurance, management and appropriate analysis and visualisation of spatial and attribute data;
5. Communicate GIS knowledge effectively; and
6. Demonstrate an understanding of spatial information by identifying and applying appropriate GIS techniques to the solution of a practical project.
7. The course has three primary aims
    + To give you a more detailed and critical understanding of GIS and how it is used
    + To expand your knowledge of GIS through guided practicals and through data collection
    + To enrich your written and verbal communication skills which are vital in any use of GIS

## Assessment
This course is 100% internally assessed.  Assessment is based on the various items listed below.

Assessment item | Credit | Due date | CLOs
 -- | -- | -- | --
GPS exercise | 5% | 19 Jul | 2
Making maps in _R_ | 15% | 9 Aug | 2
Data cleaning in _R_ | 15% | 16 Aug | 2 4
Simple statistical analysis in _R_ | 15% | 6 Sep | 6
Project presentation | 10% | 24 or 26 Sep | 1 3 5 6 7
Written project report | 40% | 18 Oct | 1 3 5 6 7

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
Class representatives provide a way to communicate feedback to the teaching staff during the course. Class representatives will be selected in the first week or two of class, and details of how to contact them will be provided as soon as they are available.

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
