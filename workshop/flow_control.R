n <- c(1,2,3,4,5)
for(i in n) {
  print(i)
}

i <- 1
repeat {
  i <- i+1
  print(i)
  if(i > 10) {
    break
  }  
}