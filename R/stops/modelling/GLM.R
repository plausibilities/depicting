# Title     : GLM.R
# Objective : Generalised Linear Model
# Created by: greyhypotheses
# Created on: 26/05/2023


#' Generalised Linear Model
#'
#' @param data: The data being modelled
#' @param model.name: The name of the generalised linear model of interest
#' 
GLM <- function(data, model.name) {

  base::switch(model.name,
               simple = glm(formula = stops ~ 1, family = poisson(link = 'log'),
                            offset = log(x = arrests), data = data),
               alternative = glm(formula = stops ~ ethnicity, family = poisson(link = 'log'),
                                 offset = log(x = arrests), data = data),
               core = glm(formula = stops ~ ethnicity + precinct, family = poisson(link = 'log'),
                          offset = log(x = arrests), data = data),
               quasi = glm(formula = stops ~ ethnicity + precinct, family = quasipoisson(link = 'log'),
                           offset = log(x = arrests), data = data)
  )

}
