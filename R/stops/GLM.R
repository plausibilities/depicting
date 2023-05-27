# Title     : GLM.R
# Objective : Generalised Linear Model
# Created by: greyhypotheses
# Created on: 26/05/2023


#' Generalised Linear Model
#'
#' @param data
#' @param type
#' 
GLM <- function(data, type) {

  base::switch(type,
               simple = glm(formula = stops ~ 1, family = poisson(link = 'log'),
                            offset = log(x = arrests), data = data),
               extended = glm(formula = stops ~ ethnicity, family = poisson(link = 'log'),
                              offset = log(x = arrests), data = data),
               core = glm(formula = stops ~ ethnicity + precinct, family = poisson(link = 'log'),
                          offset = log(x = arrests), data = data),
               alternative = glm(formula = stops ~ ethnicity + precinct, family = quasipoisson(link = 'log'),
                                 offset = log(x = arrests), data = data)
  )

}
