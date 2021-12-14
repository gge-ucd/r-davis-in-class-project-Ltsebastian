library(tidyverse)
library(dplyr)
flights <-read.csv("data/nyc_13_flights_small.csv")
planes <- read.csv("data/nyc_13_planes.csv")
weather <-read.csv("data/nyc_13_weather.csv")
head(flights)
str(flights)
str(planes)
comboa <- left_join(flights, planes, by="tailnum")
head(comboa)
str(weather)
summary(flights)

#I removed the by="time_hour" part because it seemed to triple print similar values based on each origin. 
allinfo <- left_join(comboa, weather)
head(allinfo)
str(allinfo)
summary(allinfo)
dim(allinfo)

delays <- allinfo %>% 
  ggplot(data=allinfo, mapping=aes(precip, dep_delay), !is.na) +
  geom_jitter(alpha= .1) +
  geom_smooth(method="lm") +
  labs(y="Departure Delay", x="Precipitation", title="Precipitation Delays")
delays
ggsave(filename = "/Users/laurelsebastian/Desktop/R_DAVIS_2021/r-davis-in-class-project-Ltsebastian/Plots/Precip_Delays.png")

#to see the working directory location
getwd()


#Question 2: date on the x axis and each day’s mean departure delay on the y axis. 
allinfo$date <- paste(allinfo$year, allinfo$month, allinfo$day, sep= ".") %>% 
as.Date(allinfo$date, format = "%Y.%m.%d")


date_meandelay <- allinfo %>% 
  group_by(date, carrier) %>% 
  summarize(mean_delay=mean(dep_delay, na.rm=T)) %>% 
  ggplot(aes(x=date, y=mean_delay))+
  geom_point(aes(color=carrier))+
  theme_bw()+
  xlim(c(as.Date('2013.09.01', format = "%Y.%m.%d"),
         as.Date('2013.12.31', format = "%Y-%m-%d")))+
  ylim(-10, 175)+
  labs(x="Month", 
       y="Departure Delay (Minutes)", 
       title="Daily Mean Airline Delays")
date_meandelay
ggsave(filename = "/Users/laurelsebastian/Desktop/R_DAVIS_2021/r-davis-in-class-project-Ltsebastian/Plots/Daily_Delays.png")
#wow, that was very hard but I think I did it. 

#Question 3
#Create a dataframe with these columns: date (year, month and day), mean_temp, where each row represents the airport
#based on airport code. Save this is a new csv into you data folder called mean_temp_by_origin.csv.
#airportcode is origin, 

mean_temp_by_origin <- allinfo %>% 
  group_by(origin, date) %>% 
  summarize(mean_temp = mean(temp)) %>% 
  pivot_wider(names_from=date, values_from=mean_temp)
mean_temp_by_origin
write.csv(mean_temp_by_origin, "/Users/laurelsebastian/Desktop/R_DAVIS_2021/r-davis-in-class-project-Ltsebastian/data/mean_temp_by_origin")
#not quite sure if this is what you wanted but I couldn't quite picture it. 

#Question 4 
minhourflip <- function(x, time_unit){
  if(time_unit == "h") {return(x*60)} 
  if(time_unit == "m") {return(x/60)}
}
minhourflip(x=60, time_unit="m")
minhourflip(x=allinfo$dep_delay, time_unit= "m")

#boxplot
boxplot_delays <- allinfo %>% 
  ggplot(mapping=aes(x=minhourflip(x=dep_delay, time_unit= "m"), y=carrier))+
  geom_boxplot(aes(fill=carrier))+
  theme_bw()
boxplot_delays

#Question 5 Improve the plot
delays_plot <- allinfo %>% 
  mutate("delay_hour" = minhourflip(x=dep_delay, time_unit= "m")) %>%   
  ggplot(mapping=aes(x=delay_hour, y=reorder(carrier, delay_hour, na.rm=T)))+ #removed NAs and reordered
  geom_boxplot(aes(fill=carrier),  na.rm=T, alpha=.8)+ #changed display transparency of points
  theme_bw()+#improved theme 
  theme(legend.position="none")+ #removed legend
  labs(y="Airline Carrier",     
       x="Departure Delay Time",
       title= "Airline Delays") + #added labels
  xlim(-.5, 7) # changed x-axis to only show the main chunk of data?
delays_plot

#mean delay for a much simpler plot in minutes
mean_delayplot <- allinfo %>% 
  group_by(carrier) %>% 
  summarize(mean_delay=mean(dep_delay, na.rm=T)) %>% 
  ggplot(mapping=aes(x=reorder(carrier, mean_delay, na.rm=T), y=mean_delay, show.legend = FALSE))+
  geom_bar(stat='identity', aes(fill=carrier),  na.rm=T, alpha=.8, show.legend = FALSE)+
  theme_bw()+
  labs(x="Airline Carrier", 
       y="Mean Departure Delay in Minutes",
       title= "Airline Delays")
mean_delayplot


