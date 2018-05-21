datas <- read.table("data01.csv", header=TRUE, 
                    row.names="StudentID", sep=",")
datas
str(datas)
datas["First name"]

datas <- read.table("data01.csv", header=TRUE, 
                    row.names="StudentID", sep=",",
                    stringsAsFactors = FALSE)
str(datas)

datas <- read.table("data01.csv", header=TRUE, 
                    row.names="StudentID", sep=",",
                    stringsAsFactors = FALSE,
                    colClasses = c("character", "character", "character", "numeric", "numeric"))
str(datas)


# With fixed length
datas <-  read.fwf("scores.txt",
         widths= c(7,-14,1,-2,1,1,1,1,1,1),
         col.names=c("subject","sex","s1","s2","s3","s4","s5","s6"),
         strip.white=TRUE)

datas
mode(datas)