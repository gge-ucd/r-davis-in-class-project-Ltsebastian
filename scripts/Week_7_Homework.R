#loading relevant files
library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

head(gapminder)
str(gapminder)

#fromclass
growthdata <-gapminder %>% filter(year %in% c(2002, 2007)) %>% 
  pivot_wider(id_cols = c(country, continent), names_from = year, values_from = pop) %>% 
  mutate(popchange=`2007`-`2002`) %>% 
  filter(continent!="Oceania")


  ggplot(growthdata)+ facet_wrap(~continent, scales = "free")+
    geom_bar(aes(x=reorder(country,popchange), y=popchange, fill=continent), stat="identity")+
    labs(x="Country", 
         y="Change in Population 2002-2007", 
         fill="Continent")+
    theme_bw() +
  theme(axis.text.x = element_text(angle=45, hjust=1), 
        legend.position = "none")+
          scale_fill_brewer(palette="Spectral")
  
  


#original filter attempt before class try
popgrowth <- gapminder %>% 
  filter(year=2007 & year=2002) %>% 
  pivot_wider(id_cols = country, names_from = year, values_from = pop)
  summarize(popchange=diff(pop))
popgrowth
