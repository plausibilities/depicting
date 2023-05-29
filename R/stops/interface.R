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
core <- Execute(data = fundamental, model.name = 'core')
quasi <- Execute(data = fundamental, model.name = 'quasi')


# An experiment
T <- collection$T
head(T)
model <- glmer(formula = stops ~ ethnicity + (1|precinct),
               data = fundamental, family = poisson(), offset = log(x = arrests), nAGQ = 5)

extended <- fundamental %>%
  group_by(precinct) %>%
  summarise(people = sum(population)) %>%
  right_join(fundamental, by = 'precinct')

extended$fraction <- extended$population/extended$people

extended %>%
  filter(ethnicity == 'black') %>%
  mutate(segment = case_when(
    fraction < 0.1 ~ "lower",
    fraction >= 0.1 & fraction <= 0.4 ~ "intermediate",
    fraction > 0.4 ~ "upper",
    TRUE ~ NA_character_
  ))




