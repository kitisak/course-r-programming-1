#First function
pow <- function(x, y = 1) {
  result <- x^y
  print(paste(x,"raised to the power", y, "is", result))
}

pow(2,3)
pow(x = 2, y = 3)
pow(y = 3, x = 2)

#Default value !!
pow(x = 3)


# Recursive function
recursive.factorial <- function(x) {
  if (x == 0)    return (1)
  else           return (x * recursive.factorial(x-1))
}

recursive.factorial(0)
recursive.factorial(5)
recursive.factorial(7)
recursive.factorial(111111)  # Limit of stack
