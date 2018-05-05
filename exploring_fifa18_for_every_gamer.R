##########################
### importing Libraries ###
##########################
library(tidyr)
library(ggplot2)

##########################
### importing data ###
##########################
df <- read.csv("theBestOf_fifa18/CompleteDataset.csv", encoding = "UTF-8")


##########################
### Cleaning and future engineering ###
##########################
# Taking only required data
df <-df[,c(2,3,5,7,8,9,11,12,15,42,43,45,64)]
View(head(df))

str(df)

# inspecting data for anamolies

#Checking for basic info
unique(df$Age)
unique(df$Overall)
unique(df$Potential)
# this data seems to be almost clean.

# checking for attribute data
unique(df$Aggression)
unique(df$Sprint.speed)
unique(df$Stamina)
unique(df$Strength)
# this data have uneven values, values are scattered over range.
# if we are going to use this data we would have to clean this data.

# prefered position as first choice
df <- separate(df, Preferred.Positions, into = c("Prefered.Position"), extra = "drop",sep = " ")

# creating column for growth that a player can achieve
# this would be (potential - overall)
df$Growth.scope <- df$Potential-df$Overall



##########################
### Data Viz ###
##########################

# plotting growth scope
ggplot(df, aes(x=Growth.scope)) + geom_bar()

# players who have growing potential more than 20
ggplot(df[df$Growth.scope>20,], aes(x=Growth.scope)) + geom_histogram(binwidth = .5)

# checking which players in fifa18 have maximum capacity to grow
View(df[df$Growth.scope==max(df$Growth.scope),])



