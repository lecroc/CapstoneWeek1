# Capstone Week 1 

# libraries

library(gdata)

# paths to data

pblog<-"C:/Coursera/Capstone/final/en_US.blogs.txt"
pnews<-"C:/Coursera/Capstone/final/en_US.news.txt"
ptweet<-"C:/Coursera/Capstone/final/en_US.twitter.txt"


blogs<-as.data.frame(readLines(pblog))
news<-as.data.frame(readLines(pnews))
tweets<-as.data.frame(readLines(ptweet))

# Q1

j<-file.size(pblog)

humanReadable(j)

# Q2

nrow(tweets)

# Q3

names(blogs)<-c("Text")
names(news)<-c("Text")
names(tweets)<-c("Text")

blogs$Text<-as.character(blogs$Text)
news$Text<-as.character(news$Text)
tweets$Text<-as.character(tweets$Text)

blogs$Char<-nchar(blogs$Text)
news$Char<-nchar(news$Text)
tweets$Char<-nchar(tweets$Text)

max(blogs$Char)
max(news$Char)
max(tweets$Char)

#Q4

x1<-sum(grepl("love",tweets$Text))
x2<-sum(grepl("hate",tweets$Text))

x1/x2

#Q5

z<-grep("biostats", tweets$Text)

tweets[z,]

#Q6

j<-grep("A computer once beat me at chess, but it was no match for me at kickboxing", tweets$Text)

tweets[j,]