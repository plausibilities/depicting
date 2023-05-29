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
aggregated <- collection$aggregated
head(aggregated)


# Note, the the value of the dispersion parameter vis-a-vis the quasi model (quasipoisson family) is
# equivalent to the calculated overdispersion ratio of the core model (poisson family)
core <- Execute(data = aggregated, model.name = 'core')
quasi <- Execute(data = aggregated, model.name = 'quasi')


# Experiment
model <- glmer(formula = stops ~ 1 + ethnicity + (0 + ethnicity|precinct),
               data = aggregated, family = poisson(), offset = log(x = arrests), nAGQ = 1)

Q <- glmer(formula = stops ~ 1 + ethnicity + (1 + ethnicity|precinct),
               data = aggregated, family = poisson(), offset = log(x = arrests), nAGQ = 1)

negative <- glmer.nb(formula = stops ~ 1 + ethnicity + (0 + ethnicity|precinct),
                  data = aggregated, offset = log(x = arrests), nAGQ = 1)
