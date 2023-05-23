# Title     : IQ.R
# Objective : Test scores and predictor mother's intelligence quotient
# Created by: greyhypotheses
# Created on: 23/05/2023



IQ <- function () {

  T <- haven::read_dta(file = file.path(getwd(), 'data', 'childTestScore.dta'))

  initial <- lm(formula = kid_score ~ mom_iq, data = T)
  summary(object = initial)

  T %>%
    ggplot(mapping = aes(x = mom_iq, y = kid_score)) +
    geom_point(alpha = 0.65) +
    geom_smooth(se = FALSE, method = 'lm', formula = 'y ~ x', colour = 'olivedrab', linewidth = 0.2, alpha = 0.35) +
    theme_minimal() +
    theme(panel.grid.minor = element_blank(),
          panel.grid.major = element_line(linewidth = 0.05),
          axis.title.x = element_text(size = 13, face = 'bold'), axis.text.x = element_text(size = 11),
          axis.title.y = element_text(size = 13, face = 'bold'), axis.text.y = element_text(size = 11)) +
    xlab(label = "\nmother's intelligence quotient\n") +
    ylab(label = '\nchild test score\n')

}