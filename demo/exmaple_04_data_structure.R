# Vector :: One-dimensional
a <- c(1, 2, 3, 4, 5)
a + 1
a - 2
a * 2
a ** 2
a / 2
a + a

a[1]
a[c(2:4)]

x <- c(1, 2, 3)
x[8] <- 8
x


# Matrix :: Two-dimensional array
b <- matrix(1:20, nrow=5, ncol=4)
b

# Create matrix with labels
cells <- c(1, 2, 3, 4)
rnames <- c('R1', 'R2')
cnames <- c('C1', 'C2')
c <- matrix(cells, nrow=2, ncol=2,
            byrow = TRUE, dimnames = list(rnames, cnames))
c

# Using matrix subscript
d <- matrix(1:10, nrow = 2)
d
d[1,1]
d[1,]
d[2,]
d[,2]
d[1, c(1,3)]

# Array :: as same as Matrix but can have more than 2 dimentions
d1 <- c('a1', 'a2')
d2 <- c('b1', 'b2', 'b3')
d3 <- c('c1', 'c2', 'c3')

e1 <- array(data=1:18, c(2, 3, 3))
e2 <- array(data=1:18, c(2, 3, 3), dimnames = list(d1, d2, d3 ))
e1
e2

# Data frame :: Different columns can contain different modes of data
# Most common data structure

patientId <- c(1, 2, 3, 4, 5)
age <- c(25, 35, 28, 52, 38)
status <- c('Poor', 'Improved', 'Excellent', 'Poor', 'Poor')
diabetes <- c("Type1", "Type2", "Type1", "Type1", "Type2")
data <- data.frame(patientId, age, status, diabetes)

data
data[1:1]
data[1:2]
data['age']
data[c('patientId','age')]
data$age
data$patient

table(data$diabetes, data$status)
str(data)
summary(data)
plot(data$diabetes, data$status)

with(data, {
  plot(diabetes, status)
})

# Factor
diabetes <- c("Type1", "Type2", "Type1", "Type1")
diabetes <- diabetes <- factor(diabetes)

status <- c("Poor", "Improved", "Excellent", "Poor")
status <- factor(status, order=TRUE,
                 levels=c("Poor", "Improved", "Excellent"))

patientId <- c(1, 2, 3, 4)
age <- c(25, 35, 28, 52)
gender <- c(1, 1, 2, 2)
patientdata <- data.frame(patientId, age, status, diabetes, gender)
str(patientdata)
summary(patientdata)

patientdata$gender <- factor(patientdata$gender,
                             levels = c(1,2),
                             labels = c("male", "female"))

patientdata$gender


# List :: the most complex data of the R data type
x <- "Somkiat"
y <- c(1, 2, 3, 4)
z <- matrix(1:10, nrow = 2)
my_list <- list(title = x, id = y, z)
my_list
my_list[[1]]
my_list[[2]]
my_list[[3]]

my_list[["title"]]
my_list[["id"]]

my_list$title
my_list$id


# Expand
x <- c(1, 2, 3, 4)
x[10] <- 10
x

x <- x[1:3]
x


