# Working with vector operation
u <- c(5,2,8)
v <- c(1,3,9)
u > v

w <- function(x) return(x+1)
w(u)
u+1
'+'(u, 1)


# NA and NULL values
x <- c(88,NA,12,168,13)
x
mean(x)
mean(x, na.rm=T) #Remove NA

x <- c(88,NULL,12,168,13)
mean(x)  # R skipped NULL value

x <- c(5,NA,12)  # Multiple NA value
mode(x[2])
x * x

seq(2, 10, 2)
2*1:5

# NA vs NULL
u <- NULL  # Null is a special R object with no mode
length(u)

u <- NA
length(u)

# Filter data in vector
z <- c(5, 2, -3, 8)
w <- z[z*z > 8]
w

z*z > 8
">"(2,1)
">"(2,5)

">"(z*z,8)

# Replace number > 3 with 0
x <- c(1, 3, 8, 2, 20)
x[x > 3] <- 0
x

# Show position of data that matched with condition
z <- c(5, 2, -3, 8)
which(z*z > 8)