# Title     : DeathPenalty.R
# Objective : Death Penalty
# Created by: greyhypotheses
# Created on: 22/05/2023


#' Death Penalty
#'
#' @note:
#'    https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/par
#'    https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/plot.default
#'    https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/points (pch)
#'
DeathPenalty <- function () {

  # The death penalty survey
  T <- as.data.frame(x = matrix(data = scan(file = file.path('data', 'deathPenalty.dat')), ncol = 5, byrow = TRUE))
  names(T) <- c('year', 'datepart', 'supporting', 'against', 'mark')


  # The fraction & percentage of people in favour
  fractions <- T$supporting / (T$supporting + T$against)
  percentages <- 100 * fractions
  abscissae <- T$year + (T$datepart - 6)/12


  # The standard error of the proportions
  #   - in favour estimate: p = supporting/(supporting + against)
  #   - standard error of an estimate: s.e. = sqrt(p(1 - p)/n), wherein n is the survey size
  standard_error <- sqrt(fractions*(1 - fractions)/1000)


  # 68% confidence interval, 0.5(1 + 0.68) = 0.84
  # ± 1 standard error
  interval_half <- qnorm(p = 0.840, lower.tail = TRUE) * standard_error
  fraction_boundaries <- fractions +
    matrix(data = interval_half) %*%  matrix(data = c(-1, 1), nrow = 1, ncol = 2)
  percentage_boundaries <- 100 * fraction_boundaries


  # Graphing
  ylimits <- c(min(percentages) - 1, max(percentages) + 1)
  plot(x = abscissae, y = percentages, xlab = 'year', ylab = '% in favour of the penalty',
       ylim = ylimits, pch = 19, frame.plot = FALSE)

}