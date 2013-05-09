legoSim <- function(n) {
  figs <- c()
  while(length(unique(figs)) < n) {
    figs <- c(figs, ceiling(runif(1, 0, n)))
  }
  return(length(figs))
}
# Run 1k trials to approximate purchases needed like so:
#mean(replicate(1000, legoSim(16)))

legoRemaining <- function(n, seen) {
  figs <- 1:seen
  while(length(unique(figs)) < n) {
    figs <- c(figs, ceiling(runif(1, 0, n)))
  }
  return(length(figs))
}
# Run 1k trials to approximate how many purchases left to complete the collection like so:
#mean(replicate(1000, legoRemaining(16, 15)))

nextUniqueLego <- function(n, seen) {
  figs <- 1:seen
  while(length(unique(figs)) < seen+1) {
    figs <- c(figs, ceiling(runif(1, 0, n)))
  }
  return(length(figs)-seen)
}
# Run 1k trials to approximate how many purchases it will take to get the next unique figure:
#mean(replicate(1000, nextUniqueLego(16, 8)))

# Assuming a store price of $3 and an ebay price of $7, how many figs should I get before going to ebay?
# trials <- c()
# for(i in 1:15) {
#   trials <- c(trials, mean(replicate(1000, nextUniqueLego(16, i))))
# }
#length(which(trials < 7/3))

# Now let's do a full-blown example complete with plot, trend line, everything!
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