training_data <- read.csv("train.csv")
testinging_data <- read.csv("test.csv")
str(training_data)
summary(training_data$Age)
summary(training_data$Fare)

# Clean data with Age
table(training_data$Age, useNA = "always")
training_data$Age[which(is.na(training_data$Age))] = median(training_data$Fare, na.rm = TRUE)

# Create new feature
training_data$children <- 0
training_data$children[training_data$Age < 18] <- 1
View(training_data)

aggregate(Survived ~ children + Sex, data=training_data, FUN=sum)
aggregate(Survived ~ children + Sex, data=training_data, FUN=length)
aggregate(Survived ~ children + Sex, data=training_data, FUN=function(x) {sum(x)/length(x)})

# Create new feature
training_data$FareGroup <- '30+'
training_data$FareGroup[training_data$Fare < 30 & training_data$Fare >= 20] <- '20-30'
training_data$FareGroup[training_data$Fare < 20 & training_data$Fare >= 10] <- '10-20'
training_data$FareGroup[training_data$Fare < 10] <- '<10'

aggregate(Survived ~ FareGroup + Pclass + Sex, data=training_data, FUN=function(x) {sum(x)/length(x)})

# Create new prediction
testing_data$Survived <- 0
testing_data$Survived[testing_data$Sex == 'female'] <- 1
testing_data$Survived[testing_data$Sex == 'female' & testing_data$Pclass == 3 & testing_data$Fare >= 20] <- 0
testing_data

submit <- data.frame( PassengerId = testing_data$PassengerId, 
                      Survived = testing_data$Survived)
write.csv(submit, file="send_03.csv", row.names = FALSE)
