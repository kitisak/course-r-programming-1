my.data <- data.frame(
  column1 = c(1,2,3),
  column2 = c('one','two','three'),
  column3 = c(TRUE,TRUE,FALSE))
my.data

# About data frame
dim(my.data)
colnames(my.data)
rownames(my.data)

# Access data in data frame
my.data[1, 3]

my.data[1:3, 1:2]
my.data[1:3, 1:3]

my.data[1:3, 1]
my.data[1:3, 2]
my.data[1:3, 3]

# Operater from list
str(my.data)

my.data['column1']
my.data[c('column1', 'column3')]

my.data$column1

# Add new column
my.date = as.Date("2017-08-09")
my.data$new_column2 <- c(my.date, my.date+7, my.date-7)
my.data['new_column3'] <- c(my.date, my.date+7, my.date-7)
my.data


# Partial matching with the dollar operator
my.data$really.long.and.complicated.variable.name <- 1000
my.data$r

# Combine data frame
rbind(my.data, my.data)   # Row
cbind(my.data, my.data)   # Column


# More
studentID <- paste("S#", sample(c(6473:7392), 10), sep = "")
score <- sample(c(0:100), 10)
gender <- sample(c("female", "male"), 10, replace = TRUE)
data <- data.frame(studentID = studentID, score = score, gender = gender)
head(data)

str(data)

plot(data)
