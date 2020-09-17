#### Geog 315 T2 2020
# US Census data
As you can imagine, actual US census data all the way down to the block level is abso-frickin-lutely ginormous, so it is not recommended that you go there.

Manageably size datasets which provide data aggregated at various levels are available from various sources, although it can be difficult to navigate these.

An option that is amazingly effective is the `tidycensus` package in _R_. The following lines of code will download a county-level population dataset:

    library(tidycensus)
    census_api_key("your API key here") # this API key is free
    pops <- get_decennial("county",
                           variables = c("P001001"),
                           geometry = TRUE,
                           output = "wide")

The only part of this which is tricky is setting up the variables you need with the `variables = c(...)` option, where the variable names, or tables you want have to be specified and the names and information about the variables is quite complex in itself. You can get information about the tables and variables using the `load_variables` function. It's actually easier than it sounds... and once you have figured out how to download one variable, more is not a problem.

Since you will only be working with these data if you are doing the [police shootings](us-police-shootings) project, I suggest adopting a step by step approach:

1. think about what the next most likely relevant variable is
2. figure out how to get that data
3. figure out how to incorporate that into your analysis
4. repeat

Once you have some confidence adding variables, you shouldn't have too much trouble grabbing a few at a time. The important thing is that working one step at a time, you won't fail completely to accomplish anything.

The code above will allow you to make a start by grabbing total population data. You'll find even with that dataset that you need to do some clean up to get deal with the fact that the US census includes Puerto Rico, which may not really be of interest to you.
