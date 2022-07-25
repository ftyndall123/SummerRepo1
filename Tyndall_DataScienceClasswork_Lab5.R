library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")


text4 <- readLines(file.choose("poetry"))
text4

docs1 <- Corpus(VectorSource(text4))
docs1


inspect(docs1)

toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs1 <- tm_map(docs1, toSpace, "/")
docs1 <- tm_map(docs1, toSpace, "@")
docs1 <- tm_map(docs1, toSpace, "\\|")

docs1 <- tm_map(docs1, content_transformer(tolower))
# Remove numbers
docs1 <- tm_map(docs1, removeNumbers)
# Remove english common stopwords
docs1 <- tm_map(docs1, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs1 <- tm_map(docs1, removeWords, c("blabla1", "blabla2"))
# Remove punctuations
docs1 <- tm_map(docs1, removePunctuation)
# Eliminate extra white spaces
docs1 <- tm_map(docs1, stripWhitespace)

dtm <- TermDocumentMatrix(docs1)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35,
          colors=brewer.pal(8, "PuBuGn"))






