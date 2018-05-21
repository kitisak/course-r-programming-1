# Numeric 
i <- 1

class(i)
is.integer(i)
is.numeric(i)

# Character
x <- "Hello"
x

y = factor("data")
y

nchar(x)
nchar("Hello")

nchar(1)
nchar(123)

# Date = from January 1, 1970
date1 <- as.Date("2017-08-09")  #Day
date1

class(date1)
as.numeric(date1)

date2 <- as.POSIXct("2017-08-09 08:00") #Second
date2

class(date2)
as.numeric(date2)

# Logical
TRUE * 5
FALSE * 5

T * 5  # Don't use !!
F * 5  # Don't use !!

flag <- TRUE

class(flag)
is.logical(flag)


# Testing type
is.character(my.character)
is.numeric(my.character)

# Change type
as.character(9)
as.numeric(my.character)
