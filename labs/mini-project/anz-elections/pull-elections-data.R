setwd("~/Documents/teaching/Geog315/labs/mini-project/anz-elections")

library(readr)
library(zoo)

# year <- 2017
# party_cols <- 18
# special_rows <- 5
year <- 2020
party_cols <- 19
special_rows <- 6

baseURL <- paste("https://www.electionresults.govt.nz/electionresults_",
                 year, "/statistics/csv/party-votes-by-voting-place-", sep = "")

electorate_names <- read.csv(paste("data/electorate-names-", year, ".csv", sep = ""))$electorate
electorates <- length(electorate_names)
maori_electorates <- 7
col_spec = paste("cc", paste(rep("i", party_cols), collapse = ""), sep = "")

for(i in 1:electorates) {
  sourcename <- paste(baseURL, i, ".csv", sep = "")
  df <- read_csv(sourcename, skip = 2, 
                 col_types = col_spec)
  electorate <- 
  n_advance_places <- which(df[, 1] == "Voting Places") - 2
  names(df)[1:2] <- c("Place", "Address")
  df <- df %>% slice(which(!is.na(df[, ncol(df)]))) 
  df <- df %>% slice(1:(nrow(df) - 1))
  nr <- nrow(df)
  df$Place[nr - special_rows + 1] <- ""
  replacementPlaces <- na.locf(df$Place)
  if (length(replacementPlaces) < nrow(df)) {
    n_missing <- nrow(df) - length(replacementPlaces)
    replacementPlaces <- c(rep("", n_missing), replacementPlaces)
  }
  df$Place <- replacementPlaces
  df$Type <- c(rep("Advance", n_advance_places), 
               rep("Regular", nr - special_rows - n_advance_places), 
               rep("Special", special_rows))
  df$Electorate <- electorate_names[i]
  reordered_names <- c("Electorate", "Place", "Address", "Type", names(df)[3:ncol(df)])
  df <- df %>% select(all_of(reordered_names))
  write.csv(df, paste("data/electorate-", year, "-", i, ".csv", sep = ""), row.names = FALSE)
}

nm_electorates <- slice(df, 0)
m_electorates <- slice(df, 0)
col_spec = paste("cccc", paste(rep("i", party_cols), collapse = ""), sep = "")

for(i in 1:electorates) {
  df <- read_csv(paste("data/electorate-", year, "-", i, ".csv", sep = ""), col_types = col_spec)
  if (i <= electorates - maori_electorates) {
    nm_electorates <- bind_rows(nm_electorates, df) 
  } else {
    m_electorates <- bind_rows(m_electorates, df)
  }
}

write.csv(nm_electorates, 
          paste("non-maori-electorate-detailed-party-results-", year, ".csv", sep = ""),
          row.names = FALSE)

write.csv(m_electorates, 
          paste("maori-electorate-detailed-party-results-", year, ".csv", sep = ""),
          row.names = FALSE)
