# Week 4 videos
## Dealing with tables lecture
A little bit disjointed, I am afraid...

+ [Introduction](https://southosullivan.com/geog315/video/week-04-lecture-01/geog315-07-2022-dealing-with-tables-01.mp4) 1m05s
+ [Binding tables](https://southosullivan.com/geog315/video/week-04-lecture-01/geog315-07-2022-dealing-with-tables-02.mp4) 2m52s

### Table joins
+ [Left, right, inner and full joins](https://southosullivan.com/geog315/video/week-04-lecture-01/geog315-07-2022-dealing-with-tables-03.mp4) 3m53s
+ [Specifying a join in `dplyr`, including unmatchec attribute names](https://southosullivan.com/geog315/video/week-04-lecture-01/geog315-07-2022-dealing-with-tables-04.mp4) 3m15s
+ [Unmatched types](https://southosullivan.com/geog315/video/week-04-lecture-01/geog315-07-2022-dealing-with-tables-05.mp4) 3m53s
+ [_R_ data types: use the `chr` type for joins!](https://southosullivan.com/geog315/video/week-04-lecture-01/geog315-07-2022-dealing-with-tables-06.mp4) 3m00s
+ [Niggly data mismatch issues](https://southosullivan.com/geog315/video/week-04-lecture-01/geog315-07-2022-dealing-with-tables-07.mp4) 5m05s

### Spatial tables and spatial joins
Much more on spatial joins in the next lecture!

+ [Quick notes on spatial joins](https://southosullivan.com/geog315/video/week-04-lecture-01/geog315-07-2022-dealing-with-tables-08.mp4) 4m16s
+ [Aotearoa New Zealand census data](https://southosullivan.com/geog315/video/week-04-lecture-01/geog315-07-2022-dealing-with-tables-09.mp4) 8m28s

### Wrap
+ [Summary](https://southosullivan.com/geog315/video/week-04-lecture-01/geog315-07-2022-dealing-with-tables-10.mp4) 1m13s

***

## Spatial data wrangling lecture(s)
### Introduction, including the data
+ [Introduction to the cheatsheet format](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-1.mp4) 2m05s
+ [The data](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-2.mp4) 1m50s

### Operations between layers
+ [Spatial predicates](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-3.mp4) 2m46s
+ [Applying the predicates in `sf`](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-4.mp4) 2m16s
+ [Getting the full 'not sparse' results](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-5.mp4) 1m25s
+ [Getting back to it (second session begins)](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-6.mp4) 2m29s
+ [Counting points in polygons](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-7.mp4) 2m21s
+ [Spatial filtering with `st_filter`](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-8.mp4) 5m15s
+ [Spatial joins with `st_join`](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-9.mp4) 7m47s

There was a question about `st_join` when the two datasets are both polygons. This is answered in this video. I should note that the function I couldn't remember the name of for doing a weighted assignment of data from the join polygons. It is called `st_interpolate_aw`.

+ [Spatial joins with two sets of polygons](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-10.mp4) 1m35s
+ [Spatial intersection with `st_intersection`](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-11.mp4) 1m03s

### Operations on single layers
+ [Buffering with `st_buffer`](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-12.mp4) 3m36s
+ [Centroids with `st_centroid`](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-13.mp4) 3m11s
+ [Convex hull with `st_convex_hull`](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-14.mp4) 3m16s

### Operations on collections of objects
+ [Voronoi or proximity polygons with `st_voronoi`](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-15.mp4) 5m19s
+ [Triangulation with `st_triangulate`, and an aside on alphashapes](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-16.mp4) 4m20s

### And finally...
+ [Don't be afraid to ask for help!](https://southosullivan.com/geog315/video/week-04-lecture-02/geog315-08-2022-spatial-data-wrangling-17.mp4) 2m16s
