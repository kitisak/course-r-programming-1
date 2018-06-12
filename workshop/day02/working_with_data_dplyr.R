#install.packages("tidyverse")

library(dplyr)

# 1. Read data
training_data <- read.csv('train.csv', stringsAsFactors = F)
testing_data <- read.csv('test.csv', stringsAsFactors = F)

data <- bind_rows(training_data, testing_data)
str(data)

# 2.
# Count
count(training_data)

# Count with pipe operator
training_data %>% count()

# Count by group
count(group_by(training_data, Sex))

# Count by group with pipe operator
training_data %>% group_by(Sex) %>% count()
training_data %>% group_by(Sex, Survived) %>% count()
training_data %>% group_by(Survived, Sex) %>% count()

# select
select(training_data, one_of('Age', 'Sex'))
training_data %>% select(one_of('Age', 'Sex'))
training_data %>% select(-one_of('Age', 'Sex'))
training_data %>% select(starts_with('P'))
training_data %>% select(ends_with('e'))

# Summarise
training_data %>% group_by(Survived) %>% summarise(mean(Age))
training_data %>% group_by(Survived) %>% summarise(mean(Age, na.rm = TRUE))
training_data %>% group_by(Survived) %>% summarise(average = mean(Age, na.rm = TRUE))

# Mutate
training_data %>% mutate(Age_Group = ifelse(Age < 18, 'Child', 'Adult'))
training_data %>% mutate(Age_Group = ifelse(Age < 18, 'Child', 'Adult')) %>% select(starts_with('Age'))
training_data %>% mutate(Age_Group = ifelse(Age < 18, 'Child', 'Adult')) %>% group_by(Survived, Age_Group) %>% summarise(count = n())
training_data %>% mutate(Age_Group = ifelse(Age < 18, 'Child', 'Adult')) %>% group_by(Survived, Age_Group) %>% summarise(all = nrow(training_data))
training_data %>% mutate(Age_Group = ifelse(Age < 18, 'Child', 'Adult')) %>% group_by(Survived, Age_Group) %>% summarise(percent = (n()/nrow(training_data)))
training_data %>% mutate(Age_Group = ifelse(Age < 18, 'Child', 'Adult')) %>% group_by(Survived, Age_Group) %>% summarise(percent = (n()/nrow(training_data))*100)

# Filter
training_data %>% filter(Sex == 'male')
training_data %>% filter(Sex == 'male') %>% count()
training_data %>% filter(Sex == 'male') %>% group_by(Embarked)
training_data %>% filter(Sex == 'male') %>% group_by(Embarked) %>% count()
training_data %>% filter(grepl('wick',Name))
training_data %>% filter(grepl('wick',Name)) %>% count()

# Arrange
training_data %>% arrange(Fare)
training_data %>% arrange(Fare) %>%  tail(4)
training_data %>% arrange(desc(Fare)) %>%  head(4)

# Drop colums
training_data <- training_data %>% select(-one_of('Age_Group')) 
