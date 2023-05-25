# Title     : Libraries.R
# Objective : Libraries
# Created by: greyhypotheses
# Created on: 23/05/2023


source(file = file.path('R', 'Activate.R'))
source(file = file.path('R', 'functions', 'Logging.R'))


#' The libraries activation function
#'
#' @param pathstr: The name of the logs directory
#'
Libraries <- function (pathstr) {

  # Activate the libraries
  notes <- invisible(Activate())

  # Log the activation notes
  Logging(namestr = file.path(pathstr, 'activate.log'), notes = notes)

}

