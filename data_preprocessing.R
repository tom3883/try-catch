library(dplyr)

artists <- read.csv("src/filtered_artists.csv")

#artists_columns <- artists %>% select(name, location.country)

songs <- read.csv("src/filtered_songs.csv")

joined_data <- songs  %>% inner_join(artists, by = "name")

write.csv(joined_data, "src/dataset.csv", row.names = FALSE)