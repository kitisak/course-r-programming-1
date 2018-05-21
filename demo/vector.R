# Create vector
datas <- c(1, 2, 3, 4, 5)
datas
class(datas)

datas + 2
datas - 2
datas * 2
datas / 2
datas ^ 2
sqrt(datas)
min(datas)
max(datas)

1:10
10:1
-5:5
5:-7

seq(from=0,to=10,by=2)

x <- 1:10
y <- -5:4
x + y
x - y
x * y
x / y
x ^ y

length(x)
nchar(x)
nchar(y)


x <= 5
y <= 5
x < y


any(x<y)
all(x<y)


# Start index with 1 !!
x[0]
x[1]
x[100]
x[1:2]
y[c(1,9)]

for(d in datas) {
  print(d)
}
