# Title     : Logs.R
# Objective : The logs directory
# Created by: greyhypotheses
# Created on: 23/05/2023


#' The logs directory
#'
#' @param pathstr: The name of the logs directory
#'
Logs <- function (pathstr) {

  if (dir.exists(paths = pathstr)) {
    base::unlink(pathstr, recursive = TRUE)
  }
  dir.create(path = pathstr, showWarnings = TRUE, recursive = TRUE)

}