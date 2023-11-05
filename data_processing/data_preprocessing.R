library(dplyr)

# uploading datasets

artists <- read.csv("../src/filtered_artists.csv", quote = "")

View(artists)

#artists_columns <- artists %>% select(name, location.country)

songs <- read.csv("../src/filtered_songs.csv")

View(songs)

#joined_data <- songs  %>% inner_join(artists, by = "name")

#write.csv(joined_data, "src/dataset.csv", row.names = FALSE

# data preprocessing
# remove incoherent country values
dataset <- read.csv("../src/dataset.csv")
val <- "[Worldwide]"

dataset <- dataset[dataset$'location.country' != val, ]

dataset$'location.country'[dataset$'location.country'== "Costa Mesa" ] <- "United States"
dataset$'location.country'[dataset$'location.country'== "Quebec" ] <- "Canada"
dataset$'location.country'[dataset$'location.country'== "São Paulo" ] <- "Brazil"

print("Countries : \n")
unique_values <- unique(dataset[['location.country']])
print(unique_values)

#write.csv(dataset, "src/dataset.csv", row.names = FALSE)
