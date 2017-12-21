# Exploratory

# libraries

library(quanteda)

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

# Create document feature matrix (dfm)

Mydfm <- dfm(TxtCorp,
         tolower = T, stem = F, remove_punct = T,
         remove_numbers=T)

save(Mydfm, file = "Mydfm.Rda")

# Display top features

topfeatures(Mydfm, n=100)

tbl<-textstat_frequency(Mydfm)

save(tbl, file="tbl.Rda")

# Make a wordcloud

set.seed(100)

textplot_wordcloud(Mydfm, min.freq = 30000, random.order = FALSE,
                   rot.per = .25, 
                   colors = RColorBrewer::brewer.pal(8,"Dark2"))


