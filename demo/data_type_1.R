class(FALSE)
class(pi)
class("Look at me")
class(as.Date("2018-08-09"))
class(factor(c('undergraduate','graduate')))


#Force to integer
number <- 5L

class(number)
is.integer(number)
is.numeric(number)


#Boolean
TRUE + TRUE
2 & 1
TRUE * TRUE
2 & -1
