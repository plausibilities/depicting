# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 25/05/2023


# functions
pathstr <- file.path(getwd(), 'R', 'stops')
source(file = file.path(pathstr, 'StudyData.R'))
source(file = file.path(pathstr, 'GLM.R'))
source(file = file.path(getwd(), 'R', 'algorithms', 'StandardisedResidual.R'))


# reading-in
collection <- StudyData()
fundamental <- collection$fundamental
head(fundamental)


# a generalised linear model; model is a stats::glm(.) model object
model <- GLM(data = fundamental, type = 'core')


# diagnostics
#  - estimates
#  - raw residuals
#  - standardised residuals
#  - overdispersion test


# estimate
diagnostics <- cbind(fundamental, estimate = as.numeric(stats::predict.glm(object = model, type = 'response')))

# raw residual
diagnostics$residual_raw <- diagnostics$stops - diagnostics$estimate

# standardised residual
diagnostics$residual_standardised <- StandardisedResidual(y = diagnostics$stops, estimates = diagnostics$estimate)

# graphs
plot(x = diagnostics$estimate,  y = diagnostics$residual_standardised, frame.plot = FALSE)
plot(x = diagnostics$estimate,  y = diagnostics$residual_raw, frame.plot = FALSE)

# overdispersion test
pchisq(q = sum(`^`(diagnostics$residual_standardised, 2)),
       df =  model$df.residual,
       lower.tail = TRUE)









