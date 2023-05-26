# Title     : Logging.R
# Objective : Logging
# Created by: greyhypotheses
# Created on: 22/05/2023


#' Logging
#'
#' @param namestr: The <path name> + <file name & extension> of the log file.
#' @param notes: The log notes
#'
Logging <- function (namestr, notes) {

  tryCatch(
    expr = {
      sink(file = file(namestr, open = 'wt'), type = 'output', split = FALSE)
      print(notes)
      sink()
    },
    error = function(e){message(e$message)}, warning = function(w){message(w$message)}, finally = {basename(namestr)}
  )

}