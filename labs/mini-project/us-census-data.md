**Geog 315 T1 2022**

# US Census data
As you can imagine, actual US census data all the way down to the block level is abso-frickin-lutely ginormous, so it is not recommended that you go there.

Manageably size datasets which provide data aggregated at various levels are available from various sources, although it can be difficult to navigate these.

An option that is amazingly effective is the [`tidycensus` package](https://walker-data.com/tidycensus/) in _R_, developed by [Kyle Walker](https://walker-data.com/). The following lines of code will download a county-level population dataset:

    library(tidycensus)
    census_api_key("your API key here") # this API key is free
    pops <- get_decennial("county",
                           variables = c("P001001"),
                           geometry = TRUE,
                           output = "wide")

The only part of this which is tricky is setting up the variables you need with the `variables = c(...)` option, where the variable names, or tables you want are specified, and the names and information about the variables are quite complex in themselves. You can get information about the tables and variables using the `load_variables` function. It's actually easier than it sounds... and once you have figured out how to download one variable, more is not a problem.

## Your API key
You request an API key from the [US census Bureau](https://census.gov) here: [api.census.gov/data/key_signup.html](https://api.census.gov/data/key_signup.html). Use your university email address, and expect to have to wait an hour or two for the key, and maybe even to have to request it more than once. 

Once you get the key you register it with the package using the `census_api_key()` function, as above, and it should all work fine. You might need to register the key again if you are on a different machine - so don't lose the email you got it from.

The reason you need a key is so they can track usage and justify keeping the service going, and also to detect any misuse, and block users that are up to no good.

## Working with the data
Whatever your reason for working with these data, I suggest adopting a step by step approach:

1. think about what the next most likely relevant variable is
2. figure out how to get that data
3. figure out how to incorporate that into your analysis
4. repeat

Once you have some confidence adding variables, you shouldn't have too much trouble grabbing a few at a time. The important thing is that working one step at a time, you won't fail completely to accomplish anything.

The code above will allow you to make a start by grabbing total population data. You'll find even with that dataset that you need to do some clean up to deal with the fact that the US census includes Puerto Rico, which may not really be of interest to you. This may require you to use the `separate` function in a mutate-like operation to separate the `NAME` column into county and state columns. Or you could download data at a different level 
