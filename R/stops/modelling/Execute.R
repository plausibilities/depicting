# Title     : Execute.R
# Objective : Execute
# Created by: greyhypotheses
# Created on: 28/05/2023


source(file = file.path(getwd(), 'R', 'stops', 'modelling', 'GLM.R'))
source(file = file.path(getwd(), 'R', 'algorithms', 'StandardisedResidual.R'))


Execute <- function(data, type) {

  # A generalised linear model; model is a stats::glm(.) model object
  model <- GLM(data = data, type = type)


  # Estimate
  diagnostics <- cbind(data, estimate = as.numeric(stats::predict.glm(object = model, type = 'response')))


  # raw residual
  diagnostics$residual_raw <- diagnostics$stops - diagnostics$estimate
  raw <- plot(x = diagnostics$estimate, y = diagnostics$residual_raw, frame.plot = FALSE,
              xlab = 'prediction', ylab = 'residual')


  # standardised residual
  diagnostics$residual_standardised <- StandardisedResidual(y = diagnostics$stops, estimates = diagnostics$estimate)
  standardised <- plot(x = diagnostics$estimate, y = diagnostics$residual_standardised, frame.plot = FALSE,
                      xlab = 'prediction', ylab = 'standardised residual')


  # overdispersion test; reject the null hypothesis - overdispersion ≈ 0 - at the 0.05 significance level
  # the degree of freedom, i.e., df, is number of observations - number of model parameters
  test <- pchisq(q = sum(`^`(diagnostics$residual_standardised, 2), lower.tail = TRUE),
         df = model$df.residual,
         lower.tail = TRUE)

  return(list(model = model, diagnostics = diagnostics, graph.raw = raw, graph.standardised = standardised, test = test))

}