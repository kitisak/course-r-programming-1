train <- read.csv("train.csv", stringsAsFactors = TRUE)
test <- read.csv("test.csv", stringsAsFactors = FALSE)
str(train)
table(train$Survived)
prop.table(table(train$Survived)) 

str(test)
test$Survived <- rep(0, 418)

submit <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(submit, file = "send_01.csv", row.names = FALSE)

# Session 2
train <- read.csv("train.csv")
summary(train$Sex)
prop.table(table(train$Sex, train$Survived))
prop.table(table(train$Sex, train$Survived), 1)  # Row
prop.table(table(train$Sex, train$Survived), 2)  # Column

test$Survived <- 0
test$Survived[test$Sex == 'female'] <- 1
submit <- data.frame(PassengerId = test$PassengerId, Survived = test$Survived)
write.csv(submit, file = "send_02.csv", row.names = FALSE)


summary(train$Age)

