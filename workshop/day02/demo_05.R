library(rpart)
install.packages('randomForest')
library(randomForest)
install.packages('party')
library(party)

training_data <- read.csv("train.csv")
testing_data <- read.csv("test.csv")
testing_data$Survived <- NA
data <- rbind(training_data, testing_data)

# Convert to a string
data$Name <- as.character(data$Name)

# Engineered variable: Title
data$Title <- sapply(data$Name, FUN=function(x) {strsplit(x, split='[,.]')[[1]][2]})
data$Title <- sub(' ', '', data$Title)

# datane small title groups
data$Title[data$Title %in% c('Mme', 'Mlle')] <- 'Mlle'
data$Title[data$Title %in% c('Capt', 'Don', 'Major', 'Sir')] <- 'Sir'
data$Title[data$Title %in% c('Dona', 'Lady', 'the Countess', 'Jonkheer')] <- 'Lady'

# Convert to a factor
data$Title <- factor(data$Title)

# Engineered variable: Family size
data$FamilySize <- data$SibSp + data$Parch + 1

# Engineered variable: Family
data$Surname <- sapply(data$Name, FUN=function(x) {strsplit(x, split='[,.]')[[1]][1]})
data$FamilyID <- paste(as.character(data$FamilySize), data$Surname, sep="")
data$FamilyID[data$FamilySize <= 2] <- 'Small'

# Delete erroneous family IDs
famIDs <- data.frame(table(data$FamilyID))
famIDs <- famIDs[famIDs$Freq <= 2,]
data$FamilyID[data$FamilyID %in% famIDs$Var1] <- 'Small'
# Convert to a factor
data$FamilyID <- factor(data$FamilyID)

# Fill in Age NAs
summary(data$Age)
Agefit <- rpart(Age ~ Pclass + Sex + SibSp + Parch + Fare + Embarked + Title + FamilySize, 
                data=data[!is.na(data$Age),], method="anova")
data$Age[is.na(data$Age)] <- predict(Agefit, data[is.na(data$Age),])

# Check what else might be missing
summary(data)

# Fill in Embarked blanks
summary(data$Embarked)
which(data$Embarked == '')
data$Embarked[c(62,830)] = "S"
data$Embarked <- factor(data$Embarked)

# Fill in Fare NAs
summary(data$Fare)
which(is.na(data$Fare))
data$Fare[1044] <- median(data$Fare, na.rm=TRUE)

# New factor for Random Forests, only allowed <32 levels, so reduce number
data$FamilyID2 <- data$FamilyID
# Convert back to string
data$FamilyID2 <- as.character(data$FamilyID2)
data$FamilyID2[data$FamilySize <= 3] <- 'Small'
# And convert back to factor
data$FamilyID2 <- factor(data$FamilyID2)

# Split back into test and train sets
train <- data[1:891,]
test <- data[892:1309,]

# Build Random Forest Ensemble
set.seed(415)
fit <- randomForest(as.factor(Survived) ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + Title + FamilySize + FamilyID2,
                    data=train, importance=TRUE, ntree=2000)
# Look at variable importance
varImpPlot(fit)
# Now let's make a prediction and write a submission file
Prediction <- predict(fit, test)
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "firstforest.csv", row.names = FALSE)

# Build condition inference tree Random Forest
set.seed(415)
fit <- cforest(as.factor(Survived) ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + Title + FamilySize + FamilyID,
               data = train, controls=cforest_unbiased(ntree=2000, mtry=3)) 

# Now let's make a prediction and write a submission file
Prediction <- predict(fit, test, OOB=TRUE, type = "response")
submit <- data.frame(PassengerId = test$PassengerId, Survived = Prediction)
write.csv(submit, file = "try.csv", row.names = FALSE)
