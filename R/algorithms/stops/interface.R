# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 25/05/2023


source(file = file.path(getwd(), 'R', 'algorithms', 'stops', 'StudyData.R'))

T <- StudyData()
head(T)

# keys-> population, precinct, ethinicity
# names from -> crime
# values from -> stops, past.arrests
pivots <- tidyr::pivot_wider(data = T, names_from = crime, values_from = c(stops, 'past_arrests') )
head(pivots)


