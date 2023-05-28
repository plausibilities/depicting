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







