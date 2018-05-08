##########################
### importing Libraries ###
##########################
library(tidyr)
library(ggplot2)
library(data.table)
library(tidyverse)

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


# Creating a method which take first two values
take_strating_two_values = function(val){
  return(str_sub(val,1,2))
}

#### cleaning Aggression, taking only two values from start
df$Aggression <- sapply(df$Aggression, take_strating_two_values)
# Converting it into numeric value
df$Aggression <- as.numeric(df$Aggression)

#### cleaning Sprint.speed, taking only two values from start
df$Sprint.speed <- sapply(df$Sprint.speed, take_strating_two_values)
# Converting it into numeric value
df$Sprint.speed <- as.numeric(df$Sprint.speed)

#### cleaning Strength, taking only two values from start
df$Strength <- sapply(df$Strength, take_strating_two_values)
# Converting it into numeric value
df$Strength <- as.numeric(df$Strength)

#### cleaning Stamina, taking only two values from start
df$Stamina <- sapply(df$Stamina, take_strating_two_values)
# Converting it into numeric value
df$Stamina <- as.numeric(df$Stamina)

# prefered position as first choice, taking only two values from start
df$Preferred.Positions <- sapply(df$Preferred.Positions, take_strating_two_values)

# creating column for growth that a player can achieve
# this would be (potential - overall)
df$Growth.scope <- df$Potential-df$Overall

####Cleaning Value
# Removing € sign
df <- df %>% mutate(Value = str_replace(Value, "€", ""))

# Creating a function which will take value which is in form of M and K, eg: 3.4M, 45K.
# Multiplying M value with 1000000 and K value with 1000, returning value as int.
valueCalculator <- function(val){
  if (str_sub(val,-1) == 'K'){  #checking last element if its K
    return(as.numeric(str_sub(val,1,-2))*1000)  #removing last element and multiplying
  }
  else if (str_sub(val,-1) == 'M'){  #checking last element if its M
    return(as.numeric(str_sub(val,1,-2))*1000000)  #removing last element and multiplying
  }
  else {
    return(as.numeric(val)) #if no K and M are found, returning value as it is. But in numeric.
  }
}
# Applying created formula to Value column
df$Value <- sapply(df$Value, valueCalculator)
# stopping R to display exponential values
options("scipen"=100, "digits"=4)

####Cleaning Wage
# Removing € sign
df <- df %>% mutate(Wage = str_replace(Wage, "€", ""))
df <- df %>% mutate(Wage = str_replace(Wage, "K", "000"))
df$Wage <- as.numeric(df$Wage)

#Saving cleaned file
write.csv(df, file = "fifa18_cleanData", row.names = FALSE)