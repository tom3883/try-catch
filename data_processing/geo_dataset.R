library(rworldmap)
library(rgeos)

# get world map
wmap <- getMap(resolution="high")

# get centroids
centroids <- gCentroid(wmap, byid=TRUE)

# get a dataframe with centroids
df <- as.data.frame(centroids)
head(df)

write.csv(df, "../public/src/geo_data.csv")

# plot
plot(centroids)