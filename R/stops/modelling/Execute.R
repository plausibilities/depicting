# Title     : Execute.R
# Objective : Execute
# Created by: greyhypotheses
# Created on: 28/05/2023



source(file = file.path(getwd(), 'R', 'stops', 'modelling', 'GLM.R'))
source(file = file.path(getwd(), 'R', 'stops', 'modelling', 'ResidualDraw.R'))
source(file = file.path(getwd(), 'R', 'stops', 'modelling', 'StandardisedResidualDraw.R'))

source(file = file.path(getwd(), 'R', 'algorithms', 'StandardisedResidual.R'))
source(file = file.path(getwd(), 'R', 'algorithms', 'StandardScore.R'))



#' Execute
#'
#' @param data: The data set
#' @param model.name:
#'
Execute <- function(data, model.name) {


  # A generalised linear model; model is a stats::glm(.) model object
  model <- GLM(data = data, model.name = model.name)


  # Estimate
  diagnostics <- cbind(data, estimate = as.numeric(stats::predict.glm(object = model, type = 'response')))


  # We are dealing with a finite number of events therefore the
  #     expected standard error = expected standard deviation = 1
  # The expected mean is
  #     0
  # Hence, the standard z score:
  MU <- 0
  SE <- 1
  score <- StandardScore(gamma = 95, data.type = 'discrete', N = nrow(diagnostics))


  # Leading to confidence bounds:
  bounds <- MU + score*SE*c(-1, 1)


  # Raw Residual
  diagnostics$residual_raw <- diagnostics$stops - diagnostics$estimate
  raw <- ResidualDraw(prediction = diagnostics$estimate, residual = diagnostics$residual_raw)


  # Standardised Residual
  diagnostics$residual_standardised <- StandardisedResidual(y = diagnostics$stops, estimates = diagnostics$estimate)
  standardised <- StandardisedResidualDraw(prediction = diagnostics$estimate, residual = diagnostics$residual_standardised,
                                           bounds = bounds)


  # Overdispersion
  overdispersion.ratio <- sum(`^`(diagnostics$residual_standardised, 2)) / model$df.residual


  # Overdispersion test; reject the null hypothesis - overdispersion ≈ 0 - at the 0.05 significance level.
  # The degree of freedom, i.e., df, is number of observations - number of model parameters.
  overdispersion.test <- pchisq(q = sum(`^`(diagnostics$residual_standardised, 2)),
                                df = model$df.residual, lower.tail = TRUE)


  return(list(model = model, diagnostics = diagnostics, graph.raw = raw, graph.standardised = standardised,
              overdispersion.ratio = overdispersion.ratio, overdispersion.test = overdispersion.test))

}