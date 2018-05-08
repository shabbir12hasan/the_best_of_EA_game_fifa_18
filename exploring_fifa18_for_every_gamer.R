##########################
### importing Libraries ###
##########################
library(tidyr)
library(ggplot2)
library(data.table)

##########################
### importing data ###
##########################
df <- read.csv("theBestOf_fifa18/CompleteDataset.csv", encoding = "UTF-8")


##########################
### Cleaning and future engineering ###
##########################
# Taking only required data
df <-df[,c(2,3,5,7,8,9,11,12,15,42,43,45,64)]

######### inspecting data for anamolies #############

#Checking for basic info
unique(df$Age)
unique(df$Overall)
unique(df$Potential)
# this data seems to be almost clean.

#### cleaning Aggression
df <- df %>% separate(Aggression, into = c('Aggression'), sep = 2)
# Converting it into numeric value
df$Aggression <- as.numeric(df$Aggression)

#### cleaning Sprint.speed
# changing column name, as to match format with other
setnames(df, "Sprint.speed", "SprintSpeed")
df <- df %>% separate(SprintSpeed, into = c('SprintSpeed'), sep = 2)
# Converting it into numeric value
df$SprintSpeed <- as.numeric(df$SprintSpeed)
# removing extra generated column
df <- subset(df, select = -c(12))

#### cleaning Strength
df <- df %>% separate(Strength, into = c('Strength'), sep = 2)
# Converting it into numeric value
df$Strength <- as.numeric(df$Strength)

#### cleaning Stamina
df <- df %>% separate(Stamina, into = c('Stamina'), sep = 2)
# Converting it into numeric value
df$Stamina <- as.numeric(df$Stamina)

# prefered position as first choice
# changing column name, as to match format with other
setnames(df, "Preferred.Positions", "PreferredPositions")
df <- df %>% separate(PreferredPositions, into = c('PreferredPositions'), sep = 2)
#df <- separate(df, df$Preferred.Positions, into = c("Prefered.Position"), extra = "drop",sep = " ")

# creating column for growth that a player can achieve
# this would be (potential - overall)
df$Growth.scope <- df$Potential-df$Overall

# removing extra generated column
df <- subset(df, select = -c(13,15))


#Cleaning Value
#Cleaning Wage

##########################
### Data Viz ###
##########################

# plotting growth scope
ggplot(df, aes(x=Growth.scope)) + geom_bar()

# players who have growing potential more than 20
ggplot(df[df$Growth.scope>20,], aes(x=Growth.scope)) + geom_histogram(binwidth = .5)

# checking which players in fifa18 have maximum capacity to grow
View(df[df$Growth.scope==max(df$Growth.scope),])




