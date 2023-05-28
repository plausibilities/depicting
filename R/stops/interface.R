# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 25/05/2023


# functions
pathstr <- file.path(getwd(), 'R', 'stops')
source(file = file.path(pathstr, 'StudyData.R'))
source(file = file.path(pathstr, 'modelling', 'Execute.R'))


# reading-in
collection <- StudyData()
fundamental <- collection$fundamental
head(fundamental)


# Note, the the value of the dispersion parameter vis-a-vis the quasi model (quasipoisson family) is
# equivalent to the calculated overdispersion ratio of the core model (poisson family)
core <- Execute(data = fundamental, type = 'core')
quasi <- Execute(data = fundamental, type = 'quasi')


# We are dealingwith a finite number of events therefore the
#     expected standard error = expected standard deviation = 1
# The expected mean is
#     0
#
source('R/algorithms/StandardScore.R')
MU <- 0
SE <- 1
score <- StandardScore(gamma = 95, data.type = 'discrete', N = nrow(core$diagnostics))
bounds <- MU + score*SE*c(-1, 1)

