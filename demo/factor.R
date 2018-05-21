my.factor <- factor(c('undergraduate','graduate','professor'))
levels(my.factor)


my.factor <- factor(c(1,2,3), 
                    levels=c(1,2,3), 
                    labels=c('undergraduate','graduate','professor'))
levels(my.factor)

table(my.factor)

plot(my.factor)
?rep
#Example of Factor
gender <- rep(c("Female", "Male"), times = 3)
genderFac1 <- factor(gender)
table(genderFac1)
plot(genderFac1)

# Append
gender <- c(gender, "Female")
gender <- append(gender, "Female")
genderFac1 <- factor(gender)

genderFac1 <- factor(gender)
genderFac1
levels(genderFac1)

table(genderFac1)

unclass(genderFac1)

plot(genderFac1)
