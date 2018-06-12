library(ggplot2)

training_data <- read.csv('train.csv')
training_data$Pclass <- as.factor(training_data$Pclass)
training_data$Sex <- as.factor(training_data$Sex)
training_data$Survived <- as.factor(training_data$Survived)
training_data$Embarked <- as.factor(training_data$Embarked)

# Basic

#1. Create canvas
ggplot(training_data)

#2. Specify aesthetic mappings, how to map variable
ggplot(training_data, aes(x=Survived))

#3. Add new layer with (+) operator
ggplot(training_data, aes(x=Survived)) + 
  geom_bar()

ggplot(training_data, aes(x=Sex)) + 
  geom_bar()
ggplot(training_data, aes(x=Age)) + 
  geom_bar(binwidth = 10)
ggplot(training_data, aes(x=Age)) + 
  geom_histogram(bins = 10)

#4. Custom
str(training_data)
training_data$Survived <- 
  as.factor(training_data$Survived)
ggplot(training_data, aes(x=Age, fill = Sex)) +
 theme_bw() + 
 geom_histogram(binwidth = 5)

ggplot(training_data, aes(x=Age, fill = Survived)) +
  geom_bar(binwidth = 5)

ggplot(training_data, aes(x=Age, fill = Survived)) +
  geom_bar(position = "stack", binwidth = 5)


ggplot(training_data, aes(x=Age, fill = Survived)) +
  geom_bar(position = "dodge", binwidth = 5)

ggplot(training_data, aes(x=Age, fill = Survived)) +
  geom_bar(position = "fill", binwidth = 5)


