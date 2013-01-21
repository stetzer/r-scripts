library(tau)
grams <- function(vec, size) {
  frm <- data.frame(counts=unclass(textcnt(vec, n=size, method="string")))
  frm$term <- rownames(frm)
  return(frm[order(-frm$counts),])
}

#Example usage:
#unigrams <- grams(c("what is the capital of china", "what is the biggest city in china"), 1)
#bigrams <- grams(c("what is the capital of china", "what is the biggest city in china"), 2)
