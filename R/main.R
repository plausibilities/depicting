# Title     : main.R
# Objective : main
# Created by: greyhypotheses
# Created on: 23/05/2023


# The logs directory
pathstr <- file.path(getwd(), 'notebooks', 'logs')


# Ensuring %>% is accessible
library(magrittr)


# The function that ensures (a) the existence of a logs directory, and (b) accessibility of libraries
main <- function () {
  source(file = file.path('notebooks', 'Logs.R'))
  source(file = file.path('notebooks', 'Libraries.R'))
  Logs(pathstr = pathstr)
  Libraries(pathstr = pathstr)
}


# Output
capture.output(main()) %>%
  sink(file = file(file.path(pathstr, 'temporary.log'), open = 'wt'), type = 'output', split = FALSE) %>%
  sink()
