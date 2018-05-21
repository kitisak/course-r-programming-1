# Function
pow <- function(x, y) {
  result <- x^y
}
a = pow(10, 2)

# Named arguments
a = pow(x=10, y=3)

# Default values for arguments
pow <- function(x, y = 2) {
  result <- x^y
}
a = pow(10)

# Return value from function
check <- function(x) {
  if(x>0) {
    result <- "Positive"
  } else if(x<0) {
    result <- "Negative"
  } else {
    result <- "Zero"
  }
  return(result)
}


# Return from function without return()
check <- function(x) {
  if(x>0) {
    result <- "Positive"
  } else if(x<0) {
    result <- "Negative"
  } else {
    result <- "Zero"
  }
  result
}

# Multiple return
multi <- function() {
  my_list <- list("id" = 1, "name" = "Somkiat", "age"= 30)
  return(my_list)
}

a = multi()
a$id
a$name
a$age

