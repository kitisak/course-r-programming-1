#install.packages("ggplot2")
#install.packages("ggthemes")
library(ggplot2)
library('ggthemes')
library('scales')
training_data <- read.csv("train.csv", stringsAsFactors = FALSE)
View(training_data)
str(training_data)

training_data$Pclass <- as.factor(training_data$Pclass)
training_data$Sex <- as.factor(training_data$Sex)
training_data$Survived <- as.factor(training_data$Survived)
training_data$Embarked <- as.factor(training_data$Embarked)

# Survival rate
ggplot(training_data, aes(x = Survived)) + geom_bar()
prop.table(table(training_data$Survived))

ggplot(training_data, aes(x = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates")

# Survival rate by sex
ggplot(training_data, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Sex")

# Survival rate by pclass
ggplot(training_data, aes(x = Pclass, fill = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass")

# Survival rate by pclass and sex
ggplot(training_data, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  facet_wrap(~ Pclass) +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass and Sex")

# Distribution of age
ggplot(training_data, aes(x = Age)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Age Distribtion")

# Survival by age
ggplot(training_data, aes(x = Age, fill = Survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Survival Rates by Age")

ggplot(training_data, aes(x = Age, fill = Survived)) +
  theme_bw() +
  geom_density(alpha = 0.5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Survival Rates by Age")

# Survival by fare
ggplot(training_data, aes(x = Fare, fill = Survived)) +
  theme_bw() +
  geom_histogram(binwidth = 10) +
  labs(y = "Passenger Count",
       x = "Fare (binwidth = 10)",
       title = "Titanic Survival Rates by Fare")

# Survival rate by age and pclass
ggplot(training_data, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_histogram(binwidth = 5) +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age, Pclass and Sex")

# 
ggplot(training_data[training_data$Pclass == '3' & training_data$Embarked == 'S', ], 
       aes(x = Fare)) +
  geom_density(fill = '#99d6ff', alpha=0.4) + 
  geom_vline(aes(xintercept=median(Fare, na.rm=T)),
             colour='red', linetype='dashed', lwd=1) +
  scale_x_continuous(labels=dollar_format()) +
  theme_few()