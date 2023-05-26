# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 25/05/2023


# functions
pathstr <- file.path(getwd(), 'R', 'stops')
source(file = file.path(pathstr, 'StudyData.R'))
source(file = file.path(pathstr, 'GLM.R'))


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
diagnostics <- cbind(fundamental, estimate = stats::predict.glm(object = model, type = 'response'))


# raw residual
diagnostics$residual_raw <- diagnostics$stops - diagnostics$estimate
