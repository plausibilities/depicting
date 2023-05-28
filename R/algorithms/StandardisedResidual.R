# Title     : StandardisedResidual.R
# Objective : Standardised Residual
# Created by: greyhypotheses
# Created on: 26/05/2023


#' The standardised residual
#'
#' @description Case Poisson(.), whereby the mean and variance are equivalent
#'
#' @param y: The dependent variable.
#' @param estimates: The dependent variable estimates, courtesy of a model.
#'
StandardisedResidual <- function (y, estimates) {

  z <- (y - estimates)/sqrt(estimates)

  return(z)

}