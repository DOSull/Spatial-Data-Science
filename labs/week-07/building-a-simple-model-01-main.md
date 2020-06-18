#### Geog 315 T2 2020
### IMPORTANT: THIS ASSIGNMENT IS NOT YET READY
# Assignment instructions
In this assignment you will build a simple regression model of the Airbnb listings in the area of Los Angeles we've been looking at based on the age-related demographic data, and some additional data about 'amenities' in the area to see if we can account for the numbers of listings across the region.

You'll find the data for this week's assignment in [this file](la-abb-age-income.gpkg?raw=true). Download it to an accessible folder on your computer and set the working directory in *RStudio* to that location in the usual way. Next, load the libraries we'll be using.

```{r}
# Load needed libraries
library(sf)
library(tmap)
library(dplyr)
library(magrittr)
```

Next read the data and take a look
```{r}
df <- st_read('la-abb-age-income.gpkg')
plot(df)
```

Included are a subset of the variables from the dataset we used for clustering analysis in the previous assignment. The included variables are

* `TRACT` is the census tract ID
* `n_abb` is the number of Airbnb listings in the tract
* `n_amenity` is the number of OpenStreetMap 'amenities' in the tract
* the `_pc` attributes are respectively the percentage of population aged under 18, between 18 and 35, between 35 and 65, and over 65
* `income` is the median household income for each tract

### **Question 1**
#### Based on these maps, which variables do you think are most likely to help account for the number of Airbnb listings in tracts? Explain your answer (keep in mind that negative associations between variables are also possible). (**20%**) 

You may find it helpful to make other maps using `tmap` to answer this question. Also keep in mind that in the maps made with the `plot` function, the dark colours are _low_ values through to high values for the brighter colours.

## Building a regression model
Because *R* is a platform for statistical computing, making regression models (or more generally linear models) is very much what it does. We're going to make a model using all the variables we've added as independent variables to fit the `n_abb` variable which represents the numbers of Airbnb listings. The `lm` function does all the work, all it needs is the equation we want to fit, which we specify as shown below: 

```{r}
m.all <- lm(n_abb ~ n_amenity + u18_pc + o18u35_pc + o35u65_pc + o65_pc + income, data = df)
```

Nothing seems to have happened, but a model has been made, and we can see what it looks like with the `summary` function:

```{r}
summary(m.all)
```

The *** designations tell us which of the independent variables are most statistically significant, in this case, it seems like `n_amenity` has that honour, but neighbourhood median income (`income`)  is also strongly influential. 

The sign of the coefficients in the `Estimate` column tells us the sense of the relationship: positive signs mean that when that attribute increases the dependent variable also increases, while negative signs mean the opposite: where that attribute is higher the dependent variable tends to be lower. The values of the coefficients also tell us how much of change to expect in the dependent variable for each unit change in the independent variable. For example, for every percentage point increase in the number of 18 to 35 year olds the model is saying that we expect about 33 fewer listings in a census tract.

### **Question 2**
#### Write a brief interpretation of this model describing in words what it seems to tell us about the effect of various neighbourhood factors on the numbers of Airbnb listings in neighhbourhoods. (**20%**)

## Residual mapping
Residuals are the model errors - the variation in the dependent variable that the model does not account for. Mapping residuals can be informative. Model residuals are available from the model variable we made `m.all`, and can be added to the spatial data as a new attribute to be mapped:

```{r}
df %<>%
  mutate(residual = m.all$residuals)
tmap_mode('view')
tm_shape(df) + 
  tm_polygons(col = 'residual')
```

Where the residuals are high, the model is *underestimating* the number of listings, and where they are low (negative) the model is *overestimating* the number of listings. Across most of the area, the model is not doing too terribly but there are a couple of places where it underestimates badly.

### **Question 3**
Where does the model do particularly badly? Briefly speculate on what other factors missing from this model might explain this. (Keep in mind that the amenity data is rather haphazard; what kind of 'amenities' does it not include?) (**25%**)

## Challenges and interpretations
One difficulty with this model (which wasn't made with too much thought) is that *all* the age group variables appear to have negative effects, which seems contrary to what we have noticed earlier in examining the data. It is also hard to make sense of, since it suggests that no matter which age group is predominant in a neighbourhood, the number of Airbnb listings will be reduced. This is an example of how correlated variables can mask one another out in a regression model. Here both the amenity and income variables are correlated with various different age groups and including them in the model prevents us from seeing the effects of the age group variables. To see this here's a model using only the 18 to 35 age group

```{r}
m.18_35 <- lm(n_abb ~ o18u35_pc, data=df)
summary(m.18_35)
```

This model implies that every percentage point increase in the presence of 18 to 35 year olds, will increase the number of listings by about two and a half! 

This demonstrates how complicated the interrelationships among many attributes in a dataset can be, and how if we control for one factor, it can change the apparent effect of other factors.

## Finally: build your own model
With the data available, and based on all you have seen so far, make your own model. The example below _won't work_ because it is nonsense (basing the predicted number of listings on the number of listings, which is cheating, really...).

```{r}
mymodel <- lm(n_abb ~ n_abb, data=df)
summary(mymodel)
```

Now answer the following question.

### **Question 4**
#### For the model you made, include the code used to generate it and the output from the `summary` function. Also make a residuals map of your model. Briefly explain why you chose to build the model you did. What influenced your choice of variables to include? Explain what your model seems to show based on the results provided by the `summary` function. (**35%**)
