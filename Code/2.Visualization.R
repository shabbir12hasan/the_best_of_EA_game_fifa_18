##########################
### importing data ###
##########################
df <- read.csv("fifa18_cleanData", encoding = "UTF-8")

##########################
### Data Viz ###
##########################
head(df)
# plotting growth scope
ggplot(df, aes(x=Growth.scope)) + geom_bar()

# players who have growing potential more than 20
ggplot(df[df$Growth.scope>20,], aes(x=Growth.scope)) + geom_histogram(binwidth = .5)

# checking which players in fifa18 have maximum capacity to grow
View(df[df$Growth.scope==max(df$Growth.scope),])




