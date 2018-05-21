#Infix operator
5+3
`+`(5,3)
`-`(5,3)
`-`(`*`(5,3),1)

# Create infix operator
`%divisible%` <- function(x,y)
{
  if (x%%y ==0) return (TRUE)
  else          return (FALSE)
}

10 %divisible% 3
10 %divisible% 2
