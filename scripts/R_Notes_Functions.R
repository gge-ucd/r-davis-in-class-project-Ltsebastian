#most notes got deleted sadly...

 2^2
2^3
exp(2)
c
a <- 1
b <- 2
c <- a + b
b <- 4
a <- b
c <- a
c
elephant1_kg*2.20
elephant1_kg <- 3492
elephant2_lb <- 7757
elephant1_kg*2.20
elephant1_kg*2.20 >elephant2_lb
num_char <- c(1, 2, 3, "a")
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
tricky <- c(1, 2, 3, "4")
str(num_char)
num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
combined_logical <- c(num_logical, char_logical)
str(combined_logical)
str(num_logical) <- c(1, 2, 3, TRUE)
str(num_logical)
#True is stored as a number (1)
#num_logical <- c(1, 2, 3, TRUE)
char_logical <- c("a", "b", "c", TRUE)
str(char_logical)
animals <- c("mouse", "rat", "dog", "cat")
animals[2]
animsls[2, 3, 3]
animals[2, 3, 3]

animals[2, 3]
#can't do this: animals[2, 3]
#but can do this:
animasl[c(2, 3)]
#can't do this: animals[2, 3]
#but can do this:
animals[c(2, 3)]
animals <- c("mouse", "rat", "dog", "cat")
animals[2] # could be read as "return the second value in animals"
#subset with true and false
animals[c[T, F, F, T]]
#subset with true and false
animals[c(T, F, F, T)]
animals %in% c("rat", "cat", "dog", "duck", "goat")
"four" > "five"
str("four")
x <- 1:10
x[c(TRUE, FALSE)]
mean(heights)
heights <- c(2, 4, 4, NA, 6)
mean(heights)
mean(heights, na.rm=T)
is.na(heights)
heights[!is.na(heights)]
heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
new_heights <-heigths[!is.na(heights)]
new_heights <-heigths[!is.na(heights)]
new_heights <-heights[!is.na(heights)]
new_heights
#see RDavis for levels() and factor details..
#practice:
treatment <- factor(c("high", "low", "low", "medium", "high"))
levels(treatment)
treatment <- factor(treatment, levels = "low", "medium", "high")
treatment <- factor(treatment, levels = c("low", "medium", "high"))
treatment <- factor(treatment, levels = c("low", "medium", "high"))
levels(treatment) <-c("L", "M", "H")
treatment
#reading in data
read.csv("data/portal_data_joined.csv")
#reading in data
surveys <-read.csv("data/portal_data_joined.csv")
surveys
head(surveys)
#exploring data
nrow(surveys)
ncol(surveys)
View(surveys)
colnames(surveys)
str(surveys)
summary(surveys)
unique(survey$species)
unique(surveys$species)
#[] in dataframes calls the row, then column
surveys [2, 3]
surveys[, 3]
surveys[1, ]
surveys[1]
surveys[,1]
# first three elements in the 7th column (as a vector)
surveys[1:3, 7]
10:1
1:10
surveys[, -1]          # The whole data frame, except the first column
surveys[, -1:3]          # The whole data frame, except the first column
surveys[, -1:3]          # The whole data frame, except the first column
surveys[, -(1:3)]          # The whole data frame, except the first column
survey["species_id"]
surveys["species_id"]
surveys[, "species_id"]     # Result is a vector
surveys[["species_id"]]     # Result is a vector
surveys$species_id          # Result is a vector
surveys_200 <- surveys[200, ]
surveys_200
nrow(surveys)
surveys_last <=surveys[34786, ]
surveys_last <-surveys[34786, ]
surveys_last
tail(surveys)
# install.packages() one time to load them on your computer
Library(tidyverse)
# install.packages() one time to load them on your computer
library(tidyverse)
t_surveys <- read_csv("data/portal_data_joined.csv")
t_surveys
class(t_surveys)
surveys[,1]
t_surveys[.1]
t_surveys[,1]
surveys <-read.csv("data/portal_data_joined.csv")
select(surveys, plot_id, species_id)
filter(surveys, year ==1995)
#nesting functions: works inside out
surveys_sml <- select(filter(surveys, weight < 5), species_id, sex, weight)
surveys_sml
#pipes , piping %>%  command shift M to make them!
surveys %>%
filter(weight < 5) %>%
select(species_id, sex, weight)
surveys_challenge <- surveys %>%
filter( year <1995) %>%
select(year, sex, weight)
surveys_challenge
#mutate() to add a new column based on included data
surveys %>%
mutate(weight_kg = weight / 1000)
surveys %>%
mutate(weight_kg = weight / 1000,
weight_kg2 = weight_kg * 2)
surveys %>%
filter(!is.na(weight)) %>%
mutate(weight_kg = weight / 1000) %>%
head()
head()
surveys_hindfoot_half <- surveys %>%
filter(!is.na(hindfoot_length)) %>%
mutate(hindfoot_half = hindfoot_length/2) %>%
select(species_id, hindfoot_length) %>%
head()
surveys_hindfoot_half
surveys_hindfoot_half <- surveys %>%
filter(!is.na(hindfoot_length)) %>%
mutate(hindfoot_half = hindfoot_length/2) %>%
select(species_id, hindfoot_half) %>%
surveys_hindfoot_half
surveys_hindfoot_half <- surveys %>%
filter(!is.na(hindfoot_length)) %>%
mutate(hindfoot_half = hindfoot_length/2) %>%
select(species_id, hindfoot_half) %>%
surveys_hindfoot_half
surveys_hindfoot_half <- surveys %>%
filter(!is.na(hindfoot_length)) %>%
mutate(hindfoot_half = hindfoot_length/2) %>%
select(species_id, hindfoot_half) %>%
surveys_hindfoot_half
surveys_hindfoot_half <- surveys %>%
filter(!is.na(hindfoot_length)) %>%
mutate(hindfoot_half = hindfoot_length/2) %>%
select(species_id, hindfoot_half)
surveys_hindfoot_half
surveys_hindfoot_half <- surveys %>%
filter(!is.na(hindfoot_length)) %>%
mutate(hindfoot_half = hindfoot_length/2) %>%
filter(hindfoot_half < 30) %>%
select(species_id, hindfoot_half)
surveys_hindfoot_half
#group_by()  takes as arguments the column names that contain the categorical variables for which you want to calculate the summary statistics.
#and summarize() which collapses each group into a single-row summary of that group.
surveys %>%
group_by(sex) %>%
summarize(mean_weight = mean(weight, na.rm = TRUE))
#group_by()  takes as arguments the column names that contain the categorical variables for which you want to calculate the summary statistics.
#and summarize() which collapses each group into a single-row summary of that group.
surveys %>%
group_by(sex) %>%
summarize(mean_weight = mean(weight))
surveys %>%
filter(!is.na(weight)) %>%   ##filter NAs first
group_by(sex, species_id) %>% # multiple groups
summarize(mean_weight = mean(weight),
min_weight = min(weight)) #multiple summary statistics
print(n=15)
surveys %>%
filter(!is.na(weight)) %>%   ##filter NAs first
group_by(sex, species_id) %>% # multiple groups
summarize(mean_weight = mean(weight),
min_weight = min(weight)) %>% #multiple summary statistics
print(n=15)
unique(surveys$species_id)
summarize(mean = mean(hindfoot_length),
min = min(hindfoot_length),
max = max(hindfoot_length))
#challenge
surveys %>%
filter(!is.na(species_id)) %>%
select(species_id) %>%
summarize(mean = mean(hindfoot_length),
min = min(hindfoot_length),
max = max(hindfoot_length))
#challenge
surveys %>%
filter(!is.na(species_id)) %>%
select(species_id) %>%
summarize("mean" = mean(hindfoot_length),
"min" = min(hindfoot_length),
"max" = max(hindfoot_length))
#challenge
surveys %>%
filter(!is.na(hindfoot_length)) %>%
group_by(species_id) %>%
summarize("mean" = mean(hindfoot_length),
"min" = min(hindfoot_length),
"max" = max(hindfoot_length))
surveys %>%
filter(!is.na(weight)) %>%
group_by(year, genus, species_id, weight) %>%
summarize("max" = max(weight))
#Subset surveys to keep rows with weight between 30 and 60, and print out the first 6 rows.
surveys %>%
filter(!is.na(weight)) %>%
filter(weight >30 & weight <60) %>%
print(n=6)
#Subset surveys to keep rows with weight between 30 and 60, and print out the first 6 rows.
surveys %>%
filter(!is.na(weight)) %>%
filter(weight >30 & weight <60) %>%
head()
colnames(surveys)
biggest_critter <-surveys %>%
filter(!is.na(weight)) %>%
filter(!is.na(sex)) %>%
group_by(species, sex) %>%
filter(weight= max(weight))
biggest_critter
source("~/Desktop/R_DAVIS_2021/r-davis-in-class-project-Ltsebastian/Homework_4.R", echo=TRUE)
biggest_critter
biggest_critter <-surveys %>%
filter(!is.na(weight)) %>%
filter(!is.na(sex)) %>%
group_by(species, sex) %>%
filter(weight= max(weight))
biggest_critter
biggest_critter <- surveys %>%
filter(!is.na(weight) & !is.na(sex) & !is.na(species)) %>%
group_by(species,sex) %>%
summarize(maximum_weight = max(weight))
biggest_critter
biggest_critter <-surveys %>%
filter(!is.na(weight)) %>%
filter(!is.na(sex)) %>%
group_by(species, sex) %>%
filter(weight= max(weight))
biggest_critter
biggest_critter2 <-surveys %>%
filter(!is.na(weight)) %>%
filter(!is.na(sex)) %>%
group_by(species, sex) %>%
filter(weight= max(weight))
biggest_critter2
biggest_critter2 <-surveys %>%
filter(!is.na(weight), !is.na(sex)) %>%
group_by(species, sex) %>%
filter(weight= max(weight))
biggest_critter2
biggest_critter2 <-surveys %>%
filter(!is.na(weight), !is.na(sex)) %>%
group_by(species_id, sex) %>%
filter(weight= max(weight))
biggest_critter2
biggest_critter2 <-surveys %>%
filter(!is.na(weight), !is.na(sex)) %>%
group_by(species_id, sex) %>%
summarize(max_weight = max(weight))
biggest_critter2
biggest_critter2 <-surveys %>%
filter(!is.na(weight), !is.na(sex)) %>%
group_by(species, sex) %>%
summarize(max_weight = max(weight))
biggest_critter2
biggest_critterz <- surveys %>%
filter(!is.na(weight) & !is.na(sex) & !is.na(species)) %>%
group_by(species,sex) %>%
summarize(maximum_weight = max(weight))
biggest_critterz
#Try to figure out where the NA weights are concentrated in the data- is there a particular species, taxa, plot, or whatever, where there are lots of NA values? There isn’t necessarily a right or wrong answer here, but manipulate surveys a few different ways to explore this. Maybe use tally and arrange here.
surveys %>%
filter(is.na(species))
surveys %>%
filter(is.na(hindfoot_length))
tally(hindfoot_length)
surveys %>%
filter(is.na(hindfoot_length)) %>%
select(hindfoot_length) %>%
tally(hindfoot_length)
surveys %>%
filter(is.na(hindfoot_length)) %>%
select(hindfoot_length) %>%
surveys %>%
filter(is.na(hindfoot_length)) %>%
group_by(species) %>%
tally()
surveys %>%
filter(is.na(hindfoot_length)) %>%
select(hindfoot_length)
surveys %>%
filter(is.na(hindfoot_length))
#3348
surveys %>%
filter(is.na(sex)) %>%
select(sex)
#3348
surveys %>%
filter(is.na(sex)) %>%
select(sex) %>%
tally()
tally()
surveys %>%
filter(is.na(hindfoot_length)) %>%
select(hindfoot_length) %>%
tally()
# from RDavis page
surveys %>%
filter(is.na(weight)) %>%
group_by(species) %>%
tally() %>%
arrange(desc(n))
surveys %>%
filter(is.na(weight)) %>%
group_by(plot_id)
surveys %>%
filter(is.na(weight)) %>%
group_by(plot_id) %>%
tally() %>%
arrange(desc(n))
surveys_avg_weight <-surveys %>%
filter(!is.na(weight)) %>%
group_by(species, sex)
surveys_avg_weight
surveys_avg_weight <-surveys %>%
filter(!is.na(weight)) %>%
group_by(species, sex) %>%
summarize(avg_weight =average(weight))
select(species, sex, weight, avg_weight)
surveys_avg_weight
source("~/Desktop/R_DAVIS_2021/r-davis-in-class-project-Ltsebastian/Homework_4.R", echo=TRUE)
surveys_avg_weight <-surveys %>%
filter(!is.na(weight)) %>%
group_by(species, sex) %>%
summarize(avg_weight =average(weight)) %>%
select(species, sex, weight, avg_weight)
surveys_avg_weight <-surveys %>%
filter(!is.na(weight)) %>%
group_by(species, sex) %>%
mutate(avg_weight =average(weight)) %>%
select(species, sex, weight, avg_weight)
surveys_avg_weight
surveys_avg_weight <-surveys %>%
filter(!is.na(weight)) %>%
group_by(species_id, sex) %>%
mutate(avg_weight =mean(weight)) %>%
select(species, sex, weight, avg_weight)
surveys_avg_weight <-surveys %>%
filter(!is.na(weight)) %>%
group_by(species_id, sex) %>%
mutate(avg_weight =mean(weight)) %>%
select(species_id, sex, weight, avg_weight)
surveys_avg_weight


surveys_avg_weight <-surveys %>%
filter(!is.na(weight)) %>%
group_by(species_id, sex) %>%
mutate(avg_weight =mean(weight)) %>%
select(species_id, sex, weight, avg_weight)
surveys_avg_weight
above_average <-surveys_avg_weight %>%
mutate(above_average =ifelse(weight >avg_weight, T, F))
above_average

## Data Manipulation part 2
library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

summary(surveys$hindfoot_length) # to get the quartiles etc.

#using ifelse()
surveys$hindfoot_cat <- ifelse(surveys$hindfoot_length < 29.29, "small", "big")
head(surveys$hindfoot_cat)

## using case_when
surveys %>% 
  mutate(hindfoot_cat = case_when(
    hindfoot_length > 29.29 ~ "big",
    is.na(hindfoot_length) ~ NA_character_,
    TRUE ~ "small"
  )) %>% 
  select(hindfoot_length, hindfoot_cat) %>% 
  head()

#joining dataframes 
tail <- read_csv("data/tail_length.csv")
summary(tail)
 #basic joining structure: join_type(FirstTable, SecondTable, by=columnTojoinBy)
#inner_join will return all the rows from Table A that has matching values in Table B, and all the columns from both Table A and B
#left_join returns all the rows from Table A with all the columns from both A and B. Rows in Table A that have no match in Table B will return NAs
#right_join returns all the rows from Table B and all the columns from table A and B. Rows in Table B that have no match in Table A will return NAs.
#full_join returns all the rows and all the columns from Table A and Table B. Where there are no matching values, returns NA for the one that is missing.

surveys_joined <-inner_join(surveys, tail, by="record_id")
head(survey_joined)  

NL_data <- surveys %>% 
  filter(species_id == "NL") #filter to just the species NL

NL_data <- left_join(NL_data, tail, by = "record_id") #a new column called tail_length was added
NL_data


#pivot_wider() widens data by increasing the number of columns and decreasing the number of rows. It takes three main arguments:
  #the data
  #names_from the name of the column you’d like to spread out
  #values_from the data you want to fill all your new columns with

surveys_mz <- surveys %>% 
  filter(!is.na(weight)) %>% 
  group_by(genus, plot_id) %>% 
  summarize(mean_weight = mean(weight))
str(surveys_mz)
surveys_mz

pivot_wider(surveys_mz, names_from =genus, values_from =mean_weight) #genus as column headers
wide_survey <- pivot_wider(surveys_mz, names_from =plot_id, values_from =mean_weight)

#pivot_longer()
##col = columns to be pivoted. Here we want to pivot all the plot_id columns, except the column "genus"
#names_to = the name of the new column we created from the `cols` argument 
#values_to = the name of the new column we will put our values in

surveys_long <- pivot_longer(wide_survey, col=-genus, names_to="plot_id", values_to ="mean_weight")
surveys_long

 #remove NAs
surveys_long <- surveys_long %>% 
  filter(!is.na(mean_weight))
surveys_long
