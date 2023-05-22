# Title     : Activate.R
# Objective : Activate
# Created by: greyhypotheses
# Created on: 22/05/2023


#' Activate Libraries
#'
Activate <- function () {

  packages <- c('data.table', 'tidyverse', 'moments', 'rmarkdown', 'latex2exp',
                'roxygen2', 'equatiomatic', 'rstatix', 'matrixStats', 'patchwork',
                'lme4', 'nlme', 'DescTools')

  # Activate
  .activate <- function (x){
    library(x, character.only = TRUE)
    if (x == 'rmarkdown') {library(tinytex)}
  }
  lapply(packages[!(packages %in% c('tidyverse', 'equatiomatic', 'data.table'))], .activate)

  # Special Case
  if ('tidyverse' %in% packages) {
    lapply(X = c('magrittr', 'dplyr', 'tibble', 'ggplot2', 'stringr', 'lubridate'), .activate)
  }

  # Active libraries
  sessionInfo()

}