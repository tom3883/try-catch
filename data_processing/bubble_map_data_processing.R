library(dplyr)
library(stringr)

df <- read.csv("../public/src/filtered_artists.csv", quote = "")

df <- df %>% filter(!is.na(df$publicationDate) & !str_detect(df$publicationDate, "^$"))

df$year <- as.numeric(format(as.Date(df$publicationDate), "%Y"))

country_year_counts <- df %>%
  group_by(location.country, year) %>%
  summarize(number_of_songs = n()) %>%
  mutate(output = paste(year, location.country, number_of_songs))

print(country_year_counts)