training_data <- read.csv('train.csv')
str(training_data)
summary(training_data)
table(training_data$Survived)

testing_data <- read.csv('test.csv')
testing_data$Survived[testing_data$Sex == 'female'] <- 1
result <- data.frame(
  PassengerId = testing_data$PassengerId,
  Survived = testing_data$Survived
)
write.csv(result, file = 'first.csv', row.names = FALSE)


prop.table(table(training_data$Sex, training_data$Survived), 1)
prop.table(table(training_data$Sex, training_data$Survived), 2)

table(training_data$Sex, training_data$Survived)


