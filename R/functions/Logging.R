# Title     : Logging.R
# Objective : Logging
# Created by: greyhypotheses
# Created on: 22/05/2023


#' Logging
#'
#' @param namestr: The path + file name of the log file.
#' @param notes: The log notes
#'
Logging <- function (namestr, notes) {

  sink(file = namestr)
  print(notes)
  sink()

}