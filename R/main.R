# Title     : main.R
# Objective : main
# Created by: greyhypotheses
# Created on: 23/05/2023

library(magrittr)

pathstr <- file.path(getwd(), 'notebooks', 'logs')

main <- function () {

  source(file = file.path('notebooks', 'Logs.R'))
  Logs(pathstr = pathstr)

  source(file = file.path('notebooks', 'Libraries.R'))
  Libraries(pathstr = pathstr)
}

capture.output(main()) %>%
  sink(file = file(file.path(pathstr, 'temporary.log'), open = 'wt'), type = 'output', split = FALSE) %>%
  sink()

