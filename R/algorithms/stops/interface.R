# Title     : interface.R
# Objective : Interface
# Created by: greyhypotheses
# Created on: 25/05/2023


# functions
source(file = file.path(getwd(), 'R', 'algorithms', 'stops', 'StudyData.R'))

# reading-in
collection <- StudyData()
fundamental <- collection$fundamental
head(fundamental)

# generalised linear model
initial <- glm(formula = stops ~ 1, family = poisson(link = 'log'), offset = log(x = arrests), data = fundamental)
summary(object = initial)

extended <- glm(formula = stops ~ ethnicity, family = poisson(link = 'log'), offset = log(x = arrests), data = fundamental)
summary(object = extended)

finally <- glm(formula = stops ~ ethnicity + precinct, family = poisson(link = 'log'), offset = log(x = arrests), data = fundamental)
summary(object = finally)











