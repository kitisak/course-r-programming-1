train <- read.table("train.csv",  row.names="PassengerId",
                    header = TRUE, sep=",",
                    stringsAsFactors = FALSE)

test <- read.table("test.csv",
                   header = TRUE, sep=",")

# TODO
test$Survived <- rep(0, 418)

submit <- data.frame( PassengerId = test$PassengerId,
                      Survived = test$Survived)

write.csv(submit, file = "send_01.csv", row.names = FALSE)