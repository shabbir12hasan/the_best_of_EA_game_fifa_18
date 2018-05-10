##########################
### importing Libraries ###
##########################
library(ggplot2)

##########################
### importing data ###
##########################
df <- read.csv("fifa18_cleanData", encoding = "UTF-8")

##############################
### 2.1.VisualizingPlayers ###
##############################

head(df)
# 2.1 plotting growth scope
ggplot(df, aes(x=Growth.scope)) + geom_bar()

#  players who have growing potential more than 20
ggplot(df[df$Growth.scope>20,], aes(x=Growth.scope)) + geom_histogram(binwidth = .5)

# It could be seen that there are few players who have good potential to grow 
# checking which players in fifa18 have maximum capacity to grow
View(df[df$Growth.scope==max(df$Growth.scope),])

# 2.2 plotting age of players
# alpha is the transparency of the overlaid color
ggplot(df, aes(df$Age)) + geom_density(aes(fill=df$Preferred.Positions,colour=df$Preferred.Positions), alpha=0.5) +xlab("Age")
# Making a facet
ggplot(df, aes(df$Age)) + geom_density(size=1)+ facet_wrap(~df$Preferred.Positions)

# 2.3 plotting overall of players
ggplot(df, aes(df$Overall)) + geom_density(aes(fill=df$Preferred.Positions,colour=df$Preferred.Positions), alpha=0.5)+ xlab("Overall")

# Getting top 100 players
topPlayers <- head(df[order(df$Overall, decreasing = TRUE),],100)

# 2.4 Plotting top 100 players according to their nationality
ggplot(topPlayers, aes(topPlayers$Nationality)) + geom_bar()
#reordering graph
#reordering graph
ggplot(topPlayers, aes(x=reorder(topPlayers$Nationality,topPlayers$Nationality,
                 function(x)-length(x)))) + geom_bar(aes(fill='blue')) + xlab("Countries") +
                    theme(axis.text.x = element_text(angle = 90, hjust = 1))


# 2.5 checking players with respect to strength. Splitting graphs according to preffered position
ggplot(df, aes(df$Strength)) + geom_density() + facet_wrap(~df$Preferred.Positions)

