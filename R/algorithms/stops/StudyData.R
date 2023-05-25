# Title     : StudyData.R
# Objective : Study Data
# Created by: greyhypotheses
# Created on: 25/05/2023


StudyData <- function () {

  T <- read.table(file = file.path(getwd(), 'data', 'policeStops.dat'), header = TRUE, skip = 6)
  T <- dplyr::rename(T, population = 'pop', ethnicity = 'eth', 'past_arrests' = 'past.arrests')

  T$ethnicity <- factor(x = T$ethnicity, levels = c(1, 2, 3), labels = c('black', 'hispanic', 'white'))
  T$crime <- factor(x = T$crime, levels = c(1, 2, 3, 4), c('violent', 'weapons', 'property', 'drug'))

  return(T)

}