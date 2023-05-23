# Title     : StandardScore.R
# Objective : Determine the z-score with respect toa confidence level
# Created by: greyhypotheses
# Created on: 23/05/2023


#' The Z Score
#'
#' @param gamma: The confidence level percentage.
#' @param deviations: The scores within <z standard deviations> of the mean.  For determining the
#'                    confidence level fraction.
#'
StandardScore <- function (gamma = NULL, deviations = 2) {

  # If a data distribution is approximately Gaussian, the proportion of data values within z standard deviations
  # of its mean is erf(z / sqrt(2))
  # - https://en.wikipedia.org/wiki/Standard_deviation
  if (is.null(gamma)) {
    fraction <- pracma::erf(deviations/sqrt(x = 2))
  } else {
    fraction <- gamma/100
  }

  # The significance level
  # - https://www.itl.nist.gov/div898/handbook/prc/section1/prc14.htm
  significance <- 1 - fraction

  # Hence, the segment of the quantile function in focus
  #   - https://www.itl.nist.gov/div898/handbook/eda/section3/eda362.htm#PPF
  #   - https://en.wikipedia.org/wiki/Quantile_function
  at <- 1 - 0.5*significance

  # Evaluate
  score <- qnorm(p = at, lower.tail = TRUE)

  return(score)

}