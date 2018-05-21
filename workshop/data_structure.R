c(1:9)
1:9
seq(1, 9)
seq()
runif(10)

a = c(1:3)
a[1]
a[a%%2==0]
a[a>5]
a[1:5]
names(a) <- c("A", "B")
a[1]
a["A"]

my.mat <- matrix(1:8, nrow = 2, ncol = 4)
my.mat

my.vec <- 1:8
dim(my.vec) <- c(2, 4)
my.vec

vec1 <- 1:4
vec2 <- sample(1:100, 4, replace = FALSE)
vec3 <- rnorm(4, mean = 0, sd = 1)
column.mat <- cbind(vec1, vec2, vec3)
column.mat

my.data <- data.frame(
  column1 = c(1,2,3),
  column2 = c('one','two','three'),
  column3 = c(TRUE,TRUE,FALSE))
my.data

patientId <- c(1, 2, 3, 4, 5)
age <- c(25, 35, 28, 52, 38)
status <- c('Poor', 'Improved', 'Excellent', 'Poor', 'Poor')
diabetes <- c("Type1", "Type2", "Type1", "Type1", "Type2")
data <- data.frame(patientId, age, status, diabetes)
data$xxx = 1
data
str(data)
summary(data)
table(data$status, data$age)
plot(data)
hist(data$age)
barplot(data$age)
class(data$diabetes)
class(data["diabetes"])

my.list = list(1, 'two', 3)
my.list
class(my.list)
my.list[1]
my.list[[1]]
str(my.list)


