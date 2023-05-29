# Title     : ExtendData.R
# Objective : Extend Data
# Created by: greyhypotheses
# Created on: 29/05/2023


ExtendData <- function (fundamental) {

  extended <- fundamental %>%
    group_by(precinct) %>%
    summarise(people = sum(population)) %>%
    right_join(fundamental, by = 'precinct')

  extended <- extended %>%
    dplyr::mutate(fraction = population/people, .after = 'population')

  extended <- extended %>%
    mutate(segment = ethnicity) %>%
    tidyr::pivot_wider(names_from = segment, values_from = segment)

  fields <- c('black', 'hispanic', 'white')
  extended <- EthnicityEncoder(blob = extended, fields = fields)


  extended %>%
    filter(ethnicity == 'black') %>%
    mutate(segment = case_when(
      fraction < 0.1 ~ "lower",
      fraction >= 0.1 & fraction <= 0.4 ~ "intermediate",
      fraction > 0.4 ~ "upper",
      TRUE ~ NA_character_
    ))

  return(extended)
}