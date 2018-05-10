##########################
### importing Libraries ###
##########################
library(ggplot2)

##########################
### importing data ###
##########################
df <- read.csv("fifa18_cleanData", encoding = "UTF-8")

##############################
### 2.1.VisualizingTeams ###
##############################

# Grouping players by club and applying average on players rating
teamOverall <- aggregate(df[, 4], list(df$Club), mean)
# Ordering data according to average overall
teamOverall <- teamOverall[order(teamOverall$x, decreasing = TRUE),c(1,2)]
# resttting row names
rownames(teamOverall) <- NULL

# 2.4 Top 10 teams which have highest overall
head(teamOverall,10)
# 2.5 Bottom 10 teams which have lowest overall
tail(teamOverall,10)