surveys <- read.csv("data/portal_data_joined.csv")
library(tidyverse)
surveys_base <- select(surveys, species_id,weight, plot_type)
surveys_base <- surveys[c('species_id', 'weight', 'plot_type')]
str(surveys_base)

surveys_base <- head(x=surveys_base, 60)

#additinal ways to do it
surveys_base <- surveys_base[1:60,]
str(surveys_base)
surveys_base <- surveys[c(1:60), c(6,9,13)]
surveys_base <- head(surveys[c(6,9,13)], n=60)

surveys_base$species_id <- as.factor(surveys_base$species_id)
class(surveys_base$species_id)

surveys_base$plot_type <- as.factor(surveys_base$plot_type)

surveys_base$weight

is.na(surveys_base$weight)
!is.na(surveys_base$weight)
#rows first, then columns
surveys_base[!is.na(surveys_base$weight),]


#could also do this
surveys_base %>% na.omit(surveys_base$weight)
na.omit(surveys_base, surveys_base$weight)
complete.cases(surveys_base)


#challenge done in class
which(surveys_base$weight>150)
challenge_base <- surveys_base[surveys_base$weight>150,]
summary(challenge_base$weight)
challenge_base <- surveys_base[which(surveys_base$weight>150),]


