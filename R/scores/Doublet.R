# Title     : Doublet.R
# Objective : Test scores and a pair of predictors
# Created by: greyhypotheses
# Created on: 23/05/2023



Doublet <- function () {

  library(ggplot2)


  # The data
  T <- haven::read_dta(file = file.path(getwd(), 'data', 'childTestScore.dta'))
  T$mom_hs <- as.factor(T$mom_hs)


  # Linear regression
  # summary(object = initial)
  initial <- lm(formula = kid_score ~ mom_hs + mom_iq, data = T)
  T$estimate <- as.numeric(initial$fitted.values)


  # Coefficients
  coefficients <- as.list(coef(initial))


  # Illustrate
  #
  # theme(.)
  #     legend.position <- c(x, y), 'none', 'left', 'right', 'bottom', 'top'
  #
  # par(.)
  #     mar < c(bottom, left, top, right) <- c(5, 4, 4, 2) + 0.1
  #     fin <- c(width, height)
  #     pin <- c(width, height)
  #     graphics::par(mar = c(8, 0, 4, 3), pin = c(9, 3.5), fin = c(9, 3.5))
  T %>%
    ggplot(mapping = aes(x = mom_iq, y = kid_score, colour = mom_hs)) +
    scale_colour_manual(values = c('orange', 'black'), labels = c('no', 'yes')) +
    geom_point(alpha = 0.65) +
    geom_abline(aes(slope = coefficients$mom_iq,
                    intercept = coefficients$`(Intercept)` + as.numeric(as.character(mom_hs))*coefficients$mom_hs1,
                    colour = mom_hs)) +
    theme_minimal() +
    theme(panel.grid.minor = element_blank(),
          panel.grid.major = element_line(linewidth = 0.05),
          legend.position = c(0.15, -0.35),
          plot.margin = margin(t = 2, r = -1, b = 3, l = 2, unit = 'cm'),
          plot.title = element_text(hjust = 0.25, size = 13, face = 'bold'),
          plot.caption = element_text(hjust = 0, size = 11, colour = 'darkgrey'),
          axis.title.x = element_text(size = 13, face = 'bold'), axis.text.x = element_text(size = 11),
          axis.title.y = element_text(size = 13, face = 'bold'), axis.text.y = element_text(size = 11)) +
    xlab(label = "\nmother's intelligence quotient\n") +
    ylab(label = '\nchild test score\n') +
    guides(col = guide_legend(title = '\nMother completed high school?'))



}