###challenge begin!

surveys_challenge <-surveys %>%
  filter(!is.na(hindfoot_length)) %>%
  group_by(genus, plot_type) %>%
  summarize(mean_length =mean(hindfoot_length))
surveys_challenge

wide_survey2 <- pivot_wider(surveys_challenge, names_from="plot_type", values_from = "mean_length")
head(wide_survey2)

##Challenge 2
summary(surveys$weight)

surveys_challenge <-surveys %>%
  mutate(weigth_cat =ifelse(weight <=20, "small", ifelse(weight>20&weight<48, "medium", "large")),is.na(hindfoot_length) ~ NA_character_)
head(surveys_challenge)


?ifelse
