### Homework Directions:Create a tibble named surveys from the portal_data_joined.csv file.
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

#Subset surveys to keep rows with weight between 30 and 60, and print out the first 6 rows.
surveys %>% 
  filter(!is.na(weight)) %>% 
  filter(weight >30 & weight <60) %>%
  head()
  
#command shift m makes a pipe
colnames(surveys)

#Create a new tibble showing the maximum weight for each species + sex combination and name it biggest_critters. Sort the tibble to take a look at the biggest and smallest species + sex combinations. HINT: it’s easier to calculate max if there are no NAs in the dataframe…
biggest_critter2 <-surveys %>% 
  filter(!is.na(weight), !is.na(sex)) %>% 
  group_by(species, sex) %>% 
  summarize(max_weight = max(weight))
 biggest_critter2

#Try to figure out where the NA weights are concentrated in the data- is there a particular species, taxa, plot, or whatever, where there are lots of NA values? There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different ways to explore this. Maybe use tally and arrange here.
#on my own
 surveys %>% 
  filter(is.na(species))

surveys %>% 
  filter(is.na(hindfoot_length)) %>% 
  select(hindfoot_length) %>% 
  tally()
#3348
surveys %>% 
  filter(is.na(sex)) %>% 
  select(sex) %>% 
  tally()
#1738
 

#in class
 surveys %>% 
  filter(is.na(hindfoot_length)) %>% 
  group_by(species) %>% 
  tally()

surveys %>% 
  filter(is.na()) %>% 
  group_by(species) %>% 
  tally()

surveys %>% 
  filter(is.na(hindfoot_length)) %>% 
  group_by(species) %>% 
  summarize(count=n(), mean=mean(weight, na.rm=T))

sum(is.na(surveys$weight))
sum(is.na(surveys$species))
sum(is.na(surveys$species))

colSums(is.na(surveys))

# from RDavis page
surveys %>% 
  filter(is.na(weight)) %>% 
  group_by(species) %>% 
  tally() %>% 
  arrange(desc(n))


#Take surveys, remove the rows where weight is NA and add a column that contains the average weight of each species+sex combination to the full surveys dataframe. Then get rid of all the columns except for species, sex, weight, and your new average weight column. Save this tibble as surveys_avg_weight.
#my attempt - tried summarize instead of mutate at first.
surveys_avg_weight <-surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(species_id, sex) %>% 
  mutate(avg_weight =mean(weight)) %>% 
  select(species_id, sex, weight, avg_weight)
surveys_avg_weight

#Take surveys_avg_weight and add a new column called above_average that contains logical values stating whether or not a row’s weight is above average for its species+sex combination (recall the new column we made for this tibble).

above_average <-surveys_avg_weight %>% 
  mutate(above_average =ifelse(weight >avg_weight, T, F))
above_average

#Yay, I did it!

