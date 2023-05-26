# Title     : DeathPenalty.R
# Objective : Death Penalty
# Created by: greyhypotheses
# Created on: 22/05/2023


source(file = file.path(getwd(), 'R', 'algorithms', 'StandardScore.R'))


#' Death Penalty
#'
#' @note:
#'    https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/par
#'    https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/plot.default
#'    https://www.rdocumentation.org/packages/graphics/versions/3.6.2/topics/points (pch)
#'
DeathPenalty <- function() {

  library(ggplot2)


  # The death penalty survey
  T <- as.data.frame(x = matrix(data = scan(file = file.path(getwd(), 'data', 'deathPenalty.dat')), ncol = 5, byrow = TRUE))
  names(T) <- c('year', 'datepart', 'supporting', 'against', 'neither')


  # The fraction of people in favour
  T$fraction <- T$supporting / (T$supporting + T$against)
  T$abscissa <- T$year + (T$datepart - 6) / 12


  # The standard error (SE) of a proportion
  #   - an estimated proportion in favour: fraction = supporting/(supporting + against)
  #   - the standard error of the estimate: SE = sqrt(fraction(1 - fraction)/n), wherein n is the expected
  #     sample size per survey size.  It is possible that one or more surveys have an incomplete number
  #     of responses
  n <- 1000
  SE <- sqrt(T$fraction * (1 - T$fraction) / n)


  # The z-score (a) within <z standard deviations> via which a confidence level fraction is determined,
  # or (b) with respect to a confidence interval percentage, e.g., 68% ≈ erf(<1 standard deviation>/sqrt(2))
  # ± 1 standard deviations
  score <- StandardScore(deviations = 1)


  # radius, i.e., margin of error
  # radius <- z-score * standard error
  #   - https://en.wikipedia.org/wiki/Margin_of_error
  radius <- score * SE
  T[, c('LCB', 'UCB')] <- T$fraction +
    matrix(data = radius) %*% matrix(data = c(-1, 1), nrow = 1, ncol = 2)


  #' Graphing
  #'
  #' @note
  #'    ylimits <- c(min(T$fraction) - 0.1, max(T$fraction) + 0.1)
  #'    plot(x = T$abscissa, y = T$fraction, xlab = 'year', ylab = '% in favour of the penalty',
  #'         ylim = ylimits, pch = 19, frame.plot = FALSE)
  T %>%
    ggplot(aes(x = abscissa, y = fraction)) +
    geom_pointrange(aes(ymin = LCB, ymax = UCB)) +
    theme_minimal() +
    theme(panel.grid.minor = element_blank(),
          panel.grid.major = element_line(linewidth = 0.05),
          plot.margin = margin(t = 1, r = 1, b = 7, l = 1, unit = 'cm'),
          plot.title = element_text(hjust = 0.25, size = 13, face = 'bold'),
          plot.caption = element_text(hjust = 0, size = 11, colour = 'darkgrey'),
          axis.title.x = element_text(size = 13, face = 'bold'), axis.text.x = element_text(size = 11),
          axis.title.y = element_text(size = 13, face = 'bold'), axis.text.y = element_text(size = 11)) +
    xlab(label = '\nyear\n') +
    ylab(label = '\nfraction\n')

}