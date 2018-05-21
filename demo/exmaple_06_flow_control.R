# For loop
numbers <- c(1, 2, 3, 4, 5)
for(number in numbers) {
  print(number)
}

# Repeat loop
i <- 1
repeat {
  if(numbers[i] > 4) {
    break
  } 
  print(numbers[i])
  i <- i+1
}