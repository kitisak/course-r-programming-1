my.mat <- matrix(nrow = 2, ncol = 4)
my.mat

attributes(my.mat)
dim(my.mat)


my.mat <- matrix(1:8, nrow = 2, ncol = 4)
my.mat

barplot(my.mat, names.arg=c(1,2,3,4))


# Create matric from vector
my.vec <- 1:8
dim(my.vec) <- c(2, 4)
my.vec

# Create matrix from vector + sample data
vec1 <- 1:4
vec2 <- sample(1:100, 4, replace = FALSE)
vec3 <- rnorm(4, mean = 0, sd = 1)

column.mat <- cbind(vec1, vec2, vec3)
column.mat

barplot(column.mat)
barplot(column.mat, beside = TRUE)
barplot(column.mat, beside = TRUE, horiz = TRUE)
