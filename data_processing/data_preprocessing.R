library(dplyr)

artists <- read.csv("src/filtered_artists.csv")

artists_columns <- artists %>% select(name, location.country)

songs <- read.csv("wasabi_songs.csv")

songs_columns <- songs %>%
  filter(complete.cases(.)) %>%
  select(title, artist, language_detect, rank, publicationDate, genre)

joined_data <- songs_columns  %>% left_join(artists_columns, by = c("artist" = "name"))

write.csv(artists_columns, "src/filtered_songs.csv", row.names = FALSE)