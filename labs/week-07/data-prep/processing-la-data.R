# Load needed libraries
library(sf)
library(dplyr)
library(magrittr)
library(knitr)

# Set the working directory
# Change this line to point to the correct location
# on your computer

setwd("~/Documents/teaching/Geog315/labs/scratch/2020/week-07/data")

# Read the California tracts data
ca_tracts <- st_read('ca-tracts-p2770.gpkg')
# Read the LA Airbnb data
abb <- st_read('la-abb-p2770.gpkg')
# Read LA amenity data as downloaded from OSM
amenity <- st_read('la-amenity.gpkg')

# Narrow down to LA county
la_tracts <- ca_tracts %>%
  filter(COUNTY=='037')

# Making the Airbnb listings into counts
# aggregated by census tract
abb.counts <- abb %>%
  st_join(la_tracts) %>% # spatial join to tracts
  group_by(TRACT) %>% # aggregate and count 
  summarise(n_abb = n()) %>%
  st_drop_geometry() # get rid of the geometry

# Joining counts back to the tracts
abb.tracts <- la_tracts %>%
  inner_join(abb.counts)

# Same again for the amenity data
amenity.counts <- amenity %>%
  st_transform(st_crs(la_tracts)) %>%
  st_join(la_tracts) %>% # spatial join to tracts
  group_by(TRACT) %>% # aggregate and count 
  summarise(n_amenity = n()) %>%
  st_drop_geometry() # get rid of the geometry

# Joining counts back to the tracts
abb.tracts <- abb.tracts %>%
  left_join(amenity.counts) %>%
  # this replaces any missing NA values with 0s
  mutate_at(vars('n_amenity'), ~replace(., is.na(.), 0))


# Code to read and assemble the demographic data
# There are four different datasets organized by 
# race with prefixes as follows:
# 'w' - White
# 'b' - Black
# 'h' - Hispanic
# 'a' - Asian
# 'i' - Native American 'Indian'
# 'p' - Pasifika
prefixes <- c('b', 'w', 'a', 'h', 'i', 'p')

# These columns in each dataset correspond
# to different age ranges
col_ranges <- list(c(10:19, 37:46), # under 18
                  c(20:23, 47:50), # 18 to 35
                  c(24:29, 51:56), # 35 to 65
                  c(30:36, 57:63)) # over 65
age_ranges <- c('u18', 'o18u35', 'o35u65', 'o65')

# Make an empty dataset to put the results in
age_race <- NULL
# Now loop over the input datasets
for (prefix in prefixes) {
  # read the data and drop the spatial part
  filename <- paste(prefix, '-la-2013.gpkg', sep='')
  df <- st_read(filename) %>% 
    st_drop_geometry()
  # make up a list of the variable names to add
  var_names <- paste(prefix, age_ranges, sep = '_')
  # calculate totals across each age range
  # and add new variables to the dataframe
  for (j in 1:length(var_names)) {
    df[ , var_names[j] ] <- rowSums(df[ , col_ranges[[j]] ])
  }
  df <- df %>% select('CT10', var_names) %>%
    mutate(CT10 = as.character(CT10))
  if (is.null(age_race)) {
    age_race <- df
  } else {
    age_race <- cbind(age_race, select(df, var_names))
  }
}

# Now do further processing to convert results to 
# sum across each age range, and also across whole population
age <- age_race %>% 
  mutate(pop = select_if(., is.double) %>% rowSums()) %>% # total population
  filter(pop > 0) %>% # throw away any zero populations
  select(-starts_with('i_')) %>%
  select(-starts_with('p_')) %>% # throw away the i and p populations (they are small)
  ## Calculate totals in each age bracket
  mutate(u18 = select(., ends_with('u18')) %>% rowSums()) %>%
  mutate(o18u35 = select(., ends_with('u35')) %>% rowSums()) %>%
  mutate(o35u65 = select(., ends_with('u65')) %>% rowSums()) %>%
  mutate(o65 = select(., ends_with('o65')) %>% rowSums()) %>%
  mutate(white = select(., starts_with('w_')) %>% rowSums()) %>%
  mutate(black = select(., starts_with('b_')) %>% rowSums()) %>%
  mutate(hisp = select(., starts_with('h_')) %>% rowSums()) %>%
  mutate(asian = select(., starts_with('a_')) %>% rowSums()) %>%
  mutate_if(is.double, list(pc = ~ . / pop * 100)) %>% # convert to percents
  # retain only the percents and the total population
  select('CT10', 'pop', 'u18_pc':'asian_pc')
  
# Join to the tracts counts data
abb_age <- abb.tracts %>%
  inner_join(age, by = c('TRACT' = 'CT10'))

# Now read the income data
inc <- st_read('la-inc.gpkg')

# Join to the age data
abb_age_inc <- abb_age %>% 
  inner_join(st_drop_geometry(inc), by = c('TRACT' = 'CT10')) %>%
  rename(income = Mdm_HH_Inc) %>% # rename the income variable
  select('TRACT', 'pop',
         starts_with('n_'), 
         ends_with('_pc'),
         'income',
         -starts_with('i_'),
         -starts_with('p_')) %>% # drop some columns
  # rescale variables to z scores
  mutate(z_abb = scale(n_abb)[, 1],
         z_amenity = scale(n_amenity)[, 1],
         z_pop = scale(pop)[, 1],
         z_u18 = scale(u18_pc)[, 1],
         z_18_35 = scale(o18u35_pc)[, 1],
         z_35_65 = scale(o35u65_pc)[, 1],
         z_o65 = scale(o65_pc)[, 1],
         z_white = scale(white_pc)[, 1],
         z_black = scale(black_pc)[, 1],
         z_hisp = scale(hisp_pc)[, 1],
         z_asian = scale(asian_pc)[, 1],
         z_income = scale(income)[, 1]
  )

# Make a data only version of the data to do
# the regression model with
abb.d <- abb_age_inc %>%
  select(starts_with('z')) %>%
  st_drop_geometry()

summary(abb.d)
plot(abb.d)

st_write(abb_age_inc, 'la-abb-age-race-inc-amenity.gpkg')
