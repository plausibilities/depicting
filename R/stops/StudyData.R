# Title     : StudyData.R
# Objective : Study Data
# Created by: greyhypotheses
# Created on: 25/05/2023


#' Study Data
#'
#' @description The data, and features.
#'
StudyData <- function () {

  # The data
  T <- read.table(file = file.path(getwd(), 'data', 'policeStops.dat'), header = TRUE, skip = 6)
  T <- dplyr::rename(T, population = 'pop', ethnicity = 'eth', 'arrests' = 'past.arrests')


  # Factoring
  T$ethnicity <- factor(x = T$ethnicity, levels = c(1, 2, 3), labels = c('black', 'hispanic', 'white'))
  T$crime <- factor(x = T$crime, levels = c(1, 2, 3, 4), c('violent', 'weapons', 'property', 'drug'))
  T$precinct <- factor(x = T$precinct, levels = 1:75)


  # keys-> population, precinct, ethinicity
  # names from -> crime
  # values from -> stops, past.arrests
  T %>%
    tidyr::pivot_wider(names_from = crime, values_from = c(stops, 'arrests') )


  # keys-> population, precinct, ethinicity
  # names from -> crime
  # values from -> stops
  T %>%
    select(!arrests) %>%
    tidyr::pivot_wider(names_from = crime, values_from = stops)


  # keys-> population, precinct, ethinicity
  # names from -> crime
  # values from -> arrests
  T %>%
    select(!stops) %>%
    tidyr::pivot_wider(names_from = crime, values_from = 'arrests')


  # Aggregated by stops & past arrests
  fundamental <- T %>%
    group_by(precinct, ethnicity, population) %>%
    summarise(across(c(stops, arrests), sum))


  return(list(T = T, fundamental = fundamental))

}