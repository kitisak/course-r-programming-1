training_data <- read.csv('train.csv')
hist(training_data$Age)
hist(training_data$Age, main="Distribution of Age",xlab="Age")


boxplot(training_data$Age)
plot(training_data$Sex, training_data$Survived)
cor(training_data$Sex, training_data$Survived)
plot(training_data$Sex, training_data$Survived,
     main="Relationship Between Sex and Survived",
     xlab="Sex",
     ylab="Survived")
qqnorm(training_data$Survived)
qqline(training_data$Survived)
