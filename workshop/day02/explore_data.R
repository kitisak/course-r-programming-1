# Reading data
training_data <- read.csv("train.csv") 
testing_data <- read.csv("test.csv")

summary(training_data)
head(training_data, 3)
dim(training_data)
str(training_data)
colSums(is.na(training_data))
colSums(is.na(testing_data))

training_data <- read.csv("train.csv", na.strings=c("NA", "")) 
testing_data <- read.csv("test.csv", na.strings=c("NA", ""))


# Check columns from 2 data frame
colnames_check <- colnames(training_data) %in% colnames(testing_data)
colnames(training_data[colnames_check==FALSE])

#Explore data
table(training_data$Survived)
prop.table(table(training_data$Survived))

table(training_data$Sex, training_data$Survived)
prop.table(table(training_data$Sex, training_data$Survived),margin = 1)

# First prediction with Sex
test_female <- testing_data
test_female$Survived <- 0
test_female$Survived[test_female$Sex == "female"] <- 1

# Write result to file
result <- data.frame(
   PassengerId = test_female$PassengerId, 
   Survived = test_female$Survived
   )
write.csv(result, file =  "first.csv", row.names = FALSE)

# Cleaning your data
colSums(is.na(training_data))
colSums(is.na(testing_data))

new_train <- training_data
new_test <- testing_data
new_test$Survived <- NA
data <- rbind(new_train, new_test)
colSums(is.na(data))

# Missing data of Fare (1)
data[!complete.cases(data$Fare),]
#Replace with median value (average)
data$Fare[1044] <- median(data$Fare, na.rm = TRUE)

colSums(is.na(data))

# Missing data of Embarked (2)
table(data$Embarked, useNA = "always")
data$Embarked[which(is.na(data$Embarked))] = 'S'
table(data$Embarked, useNA = "always")

# Missing data of Age (263) ?
data$Name = as.character(data$Name)
table_names = table(unlist(strsplit(data$Name, "\\s+")))
sort(table_names[grep('\\.', names(table_names))], decreasing = T)

# Filter only missing value from Age
table_na = data[which(is.na(data$Age)),]
table_names = table(unlist(strsplit(table_na$Name, "\\s+")))
sort(table_names[grep('\\.', names(table_names))], decreasing = T)

# Fill in missing value by mean in each group
title = c("Mr\\.", "Miss\\.", "Mrs\\.", "Master\\." ,"Dr\\.")
sapply(title, function(x){
  mean(data$Age[grepl(x, data$Name) & !is.na(data$Age)])
})

title = c("Mr\\.", "Miss\\.", "Mrs\\.", "Master\\." ,"Dr\\.", "Ms\\.")
for (x in title){
  data$Age[grepl(x, data$Name) & is.na(data$Age)] = mean(data$Age[grepl(x, data$Name) & !is.na(data$Age)])
}
summary(data$Age)
table(data$Age, useNA = "always")
str(data)

# Missing data of Cabin (1014) => Drop
data_after_drop = subset(data, select = -c(Cabin) )
str(data_after_drop)



