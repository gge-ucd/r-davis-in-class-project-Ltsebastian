library(tidyverse)
str(mloa)
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")

mloa_nona <- mloa %>% 
  filter(rel_humid!=-99, temp_C_2m!=-999.9, windSpeed_m_s!=-99.9)
str(mloa_nona)

mloa_nona <- mloa_nona %>% mutate(datetime=ymd(paste(year, month, day, sep = '-')))
str(mloa_nona)                   

mloa_nona <- mloa_nona %>% mutate(datetime=ymd_h(paste(year, month, day, hour24, sep = '-')))
str(mloa_nona)                   

mloa_nona$datetime

mloa_nona <- mloa_nona %>% mutate(datetime=ymd_hm(paste(year, month, day, hour24, min, sep = '-')))
str(mloa_nona) 

mloa_nona <- mloa_nona %>% mutate(datetimeLocal=with_tz(datetime, tz= "Pacific/Honolulu"))

?with_tz
?hour()
?month()
library(dplyr)

mloa_mh <- mloa_nona %>% mutate(Month=month(datetimeLocal)) %>%  mutate(Hour=hour(datetimeLocal))
str(mloa_mh)

mloa_meantemp <- mloa_mh %>% 
  select(Month, Hour, temp_C_2m) %>% 
  group_by(Month, Hour) %>% 
  summarise(meantemp=mean(temp_C_2m))
  
ggplot(mloa_meantemp, mapping=aes(Month, meantemp, color=Hour)) +
  geom_point()+
  scale_x_continuous(breaks=1:12)+
  labs(y="Mean Temp C")+
  scale_color_viridis_c()


str(mloa_meantemp)
head(mloa_meantemp)
dim(mloa_meantemp)

