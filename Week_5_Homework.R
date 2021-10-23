#Create a tibble named surveys from the portal_data_joined.csv file. Then manipulate surveys to create a new dataframe called surveys_wide with a column for genus and a column named after every plot type, with each of these columns containing the mean hindfoot length of animals in that plot type and genus. So every row has a genus and then a mean hindfoot length value for every plot type. The dataframe should be sorted by values in the Control plot type column. This question will involve quite a few of the functions you’ve used so far, and it may be useful to sketch out the steps to get to the final result.
library(tidyverse)
surveys<- read_csv("data/portal_data_joined.csv")
surveys

#second attempt after studying (missed a few things at first)
surveys_wide <-surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  group_by(genus, plot_type) %>% 
  summarize(mean_hindfoot = mean(hindfoot_length)) %>% 
  pivot_wider(names_from="plot_type", values_from="mean_hindfoot") %>% 
  arrange(Control) #missed this part
  surveys_wide
  
#first attempt:
surveys_challenge <-surveys %>%
  filter(!is.na(hindfoot_length)) %>%
  group_by(genus, plot_type) %>%
  summarize(mean_length =mean(hindfoot_length))
surveys_challenge

wide_survey2 <- pivot_wider(surveys_challenge, names_from="plot_type", values_from = "mean_length")
wide_survey2
head(wide_survey2)

#Using the original surveys dataframe, use the two different functions we laid out for conditional statements, ifelse() and case_when(), to calculate a new weight category variable called weight_cat. For this variable, define the rodent weight into three categories, where “small” is less than or equal to the 1st quartile of weight distribution, “medium” is between (but not inclusive) the 1st and 3rd quartile, and “large” is any weight greater than or equal to the 3rd quartile. (Hint: the summary() function on a column summarizes the distribution). For ifelse() and case_when(), compare what happens to the weight values of NA, depending on how you specify your arguments.summary(surveys$weight)

summary(surveys$weight)

weight_challenge <- surveys %>% 
  mutate(weight_cat =case_when(weight <=20 ~ "small",
                               weight > 20 & weight< 48 ~ "medium", 
                               weight>= 48 ~ "large"))
  print(weight_challenge, n=15)

surveys_challenge <-surveys %>%
  mutate(weight_cat =ifelse(weight <=20, "small", 
                            ifelse(weight>20&weight<48, "medium", "large")))
head(surveys_challenge)


#didn't try bonus on my own but here it is
summary(surveys$weight)

#doesn't work: 
weight_challenge <- surveys %>% 
  mutate(weight_cat =case_when(weight <=[2] ~ "small",
                               weight > [2] & weight< [4] ~ "medium", 
                               weight>= [4] ~ "large"))
print(weight_challenge, n=15)

#does
summ <- summary(surveys$weight)
summ[1]
summ[[1]] # just the value
weight_challenge_bonus <- surveys %>% 
  mutate(weight_cat =case_when(weight <=summ[[2]] ~ "small",
                               weight > summ[[2]] & weight< summ[[4]] ~ "medium", 
                               weight>= summ[[4]] ~ "large"))
print(weight_challenge_bonus, n=15)

#

