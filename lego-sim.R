library(ggplot2)

setSize <- 16
itemPrice <- 3

minifigs <- c()
frm.figs <- data.frame(total=numeric(0), unique=numeric(0), spent=numeric(0))
while(length(unique(minifigs)) < setSize) {
  minifigs <- c(minifigs, ceiling(runif(1, 0, setSize)))
  figs.len <- length(minifigs)
  frm.figs <- rbind(frm.figs, data.frame(total=figs.len, unique=length(unique(minifigs)), spent=itemPrice*figs.len))
}

print(qplot(spent, unique, data=frm.figs, geom=c("line", "smooth"), xlab="Total Money Spent", ylab="Unique Minifigs Acquired", main="Money Spent to Acquire All Minifigs"))
print(frm.figs)