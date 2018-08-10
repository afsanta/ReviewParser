# A R script that opens a csv file, parses a column
# with the text entry for a product review, and then
# takes a subset of the reviews that are of an appropriate 
# length, and orders them by their star rating in 
# ascending order.

convert <- function(a) {
  a <- as.character(a)
  a <- parse(a)
  a <- lengths(a)
}

parse <- function(x) {
  strsplit(x, " ")
}

tdat <- read.csv("review.csv")
tdat$textlength <- sapply(tdat$reviewText, convert)
s <- subset(tdat, textlength > 100)
s <- s[order(-s$overall),]
write.csv(s, file = "parsed.csv")
