library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

head(gapminder)

#1

gapminder %>% 
  filter(!is.na(lifeExp)) %>% 
  group_by(continent, year) %>% 
  summarize(mean_life = mean(lifeExp)) %>% 
  ggplot(,mapping =aes(x=year, y=mean_life)) +
  geom_line(mapping =aes(color=continent))
#yay!! I really did it without looking back at notes

#2
#am i supposed to enter the code. Without messing with it first, I imagine scale_x_log10() would make the x axis rescaled to be more legible (less spread out?)
#geom_smooth is probably fitting a smooth line to the data with the lm method and it has been edited to be black and dashed.

#now I will look at it
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()
# I think I was right: log10 transformed it from a log function to linear display. 

#I don't know how to do the challenge. maybe something with adusting the size= .25 part to be a function, but I would have to make a new dataset first?
#didn't know how to summarze a continent total population

#originally i was going to try to find the mean pop of each country, but I don't think I have to
popz <- gapminder %>% 
  group_by(continent) %>% 
  summarize(total_pop = sum(pop))
popz

#new challenge attempt. It worked - well kinda. It didn't at first but I swear I tried this and then saw it in the HW. 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size=pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()


?
?filter
#3

gapminder %>% 
  group_by(country, year) %>% 
  filter(country== "Brazil"| country=="China" |country=="El Salvador"|country=="Niger"|country=="United States") %>% 
  summarize(mean_life = mean(lifeExp)) %>% 
  ggplot(,mapping =aes(x=country, y=mean_life)) +
  geom_boxplot(mapping =aes(color=country)) +
  geom_jitter(mapping=aes(color=country)) +
  labs(x="Country",
       y="Mean Life Expectancy",
       title="Life Expectancy of Five Countries", 
       color= "Country")+ 
  theme_classic()

#new attempt
countries <- c("Brazil", "China", "El Salvador", "Niger", "United States")

