# Exploratory

# libraries

library(quanteda)
library(dplyr)

# Check if data file exists, if not, create

ifelse(!file.exists("AllText.Rda"),
       {
        pblog<-"C:/Coursera/Capstone/final/en_US.blogs.txt"
        pnews<-"C:/Coursera/Capstone/final/en_US.news.txt"
        ptweet<-"C:/Coursera/Capstone/final/en_US.twitter.txt"

        # load text into data frames, combine into one df

        blogs<-as.data.frame(readLines(pblog, encoding="UTF-8"))
        names(blogs)<-c("Text")
        blogs$Text<-as.character(blogs$Text)
        blogs$Source<-c("Blogs")

        news<-as.data.frame(readLines(pnews, encoding="UTF-8"))
        names(news)<-c("Text")
        news$Text<-as.character(news$Text)
        news$Source<-c("News")

        tweets<-as.data.frame(readLines(ptweet, encoding="UTF-8"))
        names(tweets)<-c("Text")
        tweets$Text<-as.character(tweets$Text)
        tweets$Source<-c("Tweets")

        AllText<-as.data.frame(rbind(blogs,tweets,news))

        save(AllText, file = "AllText.Rda")

        },

load(file = "AllText.Rda"))

# Create corpus of all text data

TxtCorp <- corpus(AllText$Text)

summary(TxtCorp, n=5)

docvars(TxtCorp, "Source")<-AllText$Source

set.seed(123)

sampsize<-ndoc(TxtCorp)*.03

TxtCorp<-corpus_sample(TxtCorp, sampsize)

# Create document feature matrix (dfm) of unigrams

Mydfm1 <- dfm(TxtCorp, tolower = T, stem = F, remove_punct = T, verbose=T,
         remove_numbers=T, remove = "badwords.txt", remove_symbols=T, ngrams = 1)

# Display top features

TF1<-topfeatures(Mydfm1, n=50)

tbl1<-textstat_frequency(Mydfm1)

fcm1<-fcm(Mydfm1)

# Create document feature matrix of bigrams

Mydfm2<-dfm(TxtCorp, tolower = T, stem = F, remove_punct = T, verbose=T,
            remove_numbers=T, remove = "badwords.txt", remove_symbols=T, ngrams = 1:2)

TF2<-topfeatures(Mydfm2, n=50)

tbl2<-textstat_frequency(Mydfm2)

fcm2<-fcm(Mydfm2)








