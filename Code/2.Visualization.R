##########################
### importing Libraries ###
##########################
library(ggplot2)

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

# 1.1 players who have growing potential more than 20
ggplot(df[df$Growth.scope>20,], aes(x=Growth.scope)) + geom_histogram(binwidth = .5)

# 1.2 It could be seen that there are few players who have good potential to grow 
# checking which players in fifa18 have maximum capacity to grow
View(df[df$Growth.scope==max(df$Growth.scope),])

# 2.1 plotting age of players
ggplot(df, aes(df$Age)) + geom_density(size=1)

# 2.2 plotting overall of players
ggplot(df, aes(df$Overall)) + geom_density(size=1)

# 3.1 Grouping players by club and applying average on players rating
teamOverall <- aggregate(df[, 4], list(df$Club), mean)
# Ordering data according to average overall
teamOverall <- teamOverall[order(teamOverall$x, decreasing = TRUE),c(1,2)]
# resttting row names
rownames(teamOverall) <- NULL

# 3.2 Top 10 teams which have highest overall
head(teamOverall,10)

# 3.3 Bottom 10 teams which have lowest overall
tail(teamOverall,10)

# Getting top 100 players
topPlayers <- head(df[order(df$Overall, decreasing = TRUE),],100)

#nationality
ggplot(topPlayers, aes(topPlayers$Nationality)) + geom_bar()
#reordering graph
ggplot(topPlayers, aes(x=reorder(topPlayers$Nationality,topPlayers$Nationality,
                 function(x)-length(x)))) + geom_bar() + xlab("Countries") +
                    theme(axis.text.x = element_text(angle = 90, hjust = 1))


#checking players with respect to strength. Splitting graphs according to preffered position
ggplot(df, aes(df$Strength)) + geom_density() + facet_wrap(~df$Preferred.Positions)

