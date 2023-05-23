# Title     : Activate.R
# Objective : Activate
# Created by: greyhypotheses
# Created on: 22/05/2023


#' Activate Libraries
#'
Activate <- function () {

  packages <- c('repr', 'evaluate', 'crayon', 'pbdZMQ', 'uuid', 'digest',
                'data.table', 'tidyverse', 'moments', 'rmarkdown', 'latex2exp',
                'roxygen2', 'equatiomatic', 'rstatix', 'matrixStats', 'patchwork',
                'lme4', 'nlme', 'DescTools', 'pracma')


  # Activate
  .activate <- function (x){
    library(x, character.only = TRUE, verbose = FALSE, quietly =  TRUE)
    if (x == 'rmarkdown') {library(tinytex)}
  }
  lapply(packages[!(packages %in% c('tidyverse', 'equatiomatic', 'data.table'))], invisible(.activate))


  # Special Case
  if ('tidyverse' %in% packages) {
    lapply(X = c('magrittr', 'dplyr', 'tibble', 'ggplot2', 'stringr', 'lubridate'), invisible(.activate))
  }


  # Active libraries
  sessionInfo()

}