print("Choose operation")
print("1. Add")
print("2. Minus")
print("3. Multiply")
print("4. Divide")

selected <- as.integer(readline(prompt = "Choose [1/2/3/4]: "))
first <- as.integer1(readline(prompt = "Fill in first number: "))
second <- as.integer(readline(prompt = "Fill in second number: "))

add <- function(a, b) {
  return(a+b)
}

operator <- switch(selected, "+", "-", "*", "/")
result <- switch(selected, add(first, second))
print(paste(first, operator, second, "=", result))