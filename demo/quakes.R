library(datasets)
data(quakes)
str(quakes)

?quakes


quakes[1:10,]

head(quakes$long)

head(quakes[,c("lat", "long")])

plot(quakes)

