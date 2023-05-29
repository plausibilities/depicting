# Title     : ExtendData.R
# Objective : Extend Data
# Created by: greyhypotheses
# Created on: 29/05/2023


#' Extend the aggregated data
#'
#' @param aggregated:
#'
ExtendData <- function (aggregated) {

  # A field thatrecords the number of people per precinct
  extended <- aggregated %>%
    group_by(precinct) %>%
    summarise(people = sum(population)) %>%
    right_join(aggregated, by = 'precinct')


  # The ethnic group fraction per precinct; <population> records the ethnic group population
  # of a precinct, whilst <people> records the number of people per precinct
  extended <- extended %>%
    dplyr::mutate(fraction = population/people, .after = 'population')


  # A character-one-hot-encoding of the ethnicity field
  extended <- extended %>%
    mutate(segment = ethnicity) %>%
    tidyr::pivot_wider(names_from = segment, values_from = segment)


  # From character-one-hot-encoding -> one-hot-encoding
  fields <- c('black', 'hispanic', 'white')
  extended <- EthnicityEncoder(blob = extended, fields = fields)


  # An optional classification
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