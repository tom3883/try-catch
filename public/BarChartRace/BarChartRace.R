library(dplyr)

val <- "[Worldwide]"
dataset <- read.csv("src/dataset.csv", sep = ";") %>%
  rename(country = "location.country")
dataset <- dataset[dataset$country != val, ]

dataset$country[dataset$country == "Costa Mesa"] <- "United States"
dataset$country[dataset$country == "Quebec"] <- "Canada"
dataset$country[dataset$country == "São Paulo"] <- "Brazil"

unique_values <- unique(dataset$country)

# remove days and months from publicationDate
dataset$publicationDate <- substr(dataset$publicationDate, 1, 4)

# replace publicationDate with XXXX-01-01 with XXXX being the year
dataset$publicationDate <- paste(dataset$publicationDate, "-01-01", sep = "")


# sum the rank grouped by country and year of publicationDate order by year
dataset_rank <- dataset %>%
  group_by(country, publicationDate) %>%
  summarise(num_songs = n()) %>%
  arrange(publicationDate) %>%
  # mutate(num_songs_cumulative = cumsum(num_songs)) %>%
  rename(date = publicationDate, name = country, value = num_songs) %>%
  select(date, name, value)


# write the obtained result in a csv file
write.csv(dataset_rank, "public/BarChartRace/BarChartRace.csv", row.names = FALSE, quote = FALSE)
