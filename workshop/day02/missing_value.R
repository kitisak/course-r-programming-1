install.packages('Amelia')
library('dplyr')
library('Amelia')

training_data <- read.csv("train.csv", stringsAsFactors = F)
testing_data <- read.csv("test.csv", stringsAsFactors = F)
str(training_data)

sum(is.na(training_data$Age))
sum(is.na(testing_data$Age))

data <- bind_rows(training_data, testing_data)
str(data)

# See missing value in dataframe
apply(is.na(data), 2, sum)
colSums(is.na(data))
sum(is.na(data$Age))

missmap(training_data, col=c("yellow", "black"))

# Replace with mean value
data$Age[which(is.na(data$Age))] <- mean(data$Age,na.rm = TRUE)
data[is.na(data$Age)]
View(data)
