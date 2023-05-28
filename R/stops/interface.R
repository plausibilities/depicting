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


core <- Execute(data = fundamental, type = 'core')









