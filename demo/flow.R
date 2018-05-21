# If-else
score <- 70
if(score > 80) {
  grade = "A"
} else {
  grade = "B"
}
grade

# Assignment 
grade <- if(score > 80) "A" else "B"
grade

# Function ifelse()
number = c(5,7,2,9)
ifelse(number %% 2 == 0, "even", "odd")

# For loop
data <- 1:5
for(i in data ) {
  print(i)
}

# While loop
counter <- 0
while(counter<5) {
  print(counter)
  counter <- counter+1
}

# Repeat loop
repeat {
  print("q")
}

i <- 0
repeat {
  if(i>10) {
    print("Exit !!")
    break
  }
  print(i)
  i <- i+1
}

# For
for (i in 1:10) {
  print(i)
}
