# Exploratory

# libraries

library(quanteda)

# paths to data

pblog<-"C:/Coursera/Capstone/final/en_US.blogs.txt"
pnews<-"C:/Coursera/Capstone/final/en_US.news.txt"
ptweet<-"C:/Coursera/Capstone/final/en_US.twitter.txt"

# load text into data frames, combine into one df

blogs<-as.data.frame(readLines(pblog))
names(blogs)<-c("Text")
blogs$Text<-as.character(blogs$Text)
blogs$Source<-c("Blogs")

news<-as.data.frame(readLines(pnews))
names(news)<-c("Text")
news$Text<-as.character(news$Text)
news$Source<-c("News")

tweets<-as.data.frame(readLines(ptweet))
names(tweets)<-c("Text")
tweets$Text<-as.character(tweets$Text)
tweets$Source<-c("Tweets")

AllText<-as.data.frame(rbind(blogs,tweets,news))

save(AllText, file = "AllText.Rda")

# Create corpus of all text data

TxtCorp <- corpus(AllText$Text)

summary(TxtCorp, n=5)

docvars(TxtCorp, "Source")<-AllText$Source

# Create document feature matrix (dfm)

Mydfm <- dfm(TxtCorp,
         tolower = TRUE, stem = FALSE, remove_punct = TRUE,
         remove = stopwords("english"), remove_numbers=TRUE)

# Display top features

topfeatures(Mydfm, n=1000)

tbl<-textstat_frequency(Mydfm)


