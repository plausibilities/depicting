# Title     : ResidualDraw.R
# Objective : Residual
# Created by: greyhypotheses
# Created on: 28/05/2023



#' Raw Residual Graph
#'
#' @param prediction: The predicted outcome values
#' @param residual: Their raw residuals
#'
ResidualDraw <- function (prediction, residual) {

  T <- data.frame(prediction = prediction, residual = residual)

  diagram <- T %>%
    ggplot(mapping = aes(x = prediction, y = residual)) +
    geom_point(alpha  = 0.65) +
    theme_minimal() +
    theme(panel.grid.minor = element_blank(),
          panel.grid.major = element_line(linewidth = 0.05),
          plot.margin = margin(t = 1, r = 1, b = 1, l = 1, unit = 'cm'),
          plot.title = element_text(hjust = 0.25, size = 13, face = 'bold'),
          plot.caption = element_text(hjust = 0, size = 11, colour = 'darkgrey'),
          axis.title.x = element_text(size = 13, face = 'bold'), axis.text.x = element_text(size = 11),
          axis.title.y = element_text(size = 13, face = 'bold'), axis.text.y = element_text(size = 11)) +
    xlab(label = '\nprediction\n') +
    ylab(label = '\nraw residual\n')

  return(diagram)

}