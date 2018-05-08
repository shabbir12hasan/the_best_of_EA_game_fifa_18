##########################
### importing data ###
##########################
df <- read.csv("fifa18_cleanData", encoding = "UTF-8")

#Checking available positions
availablePositions <- unique(df$Preferred.Positions)

#Creating function to pick players who have hight potential to grow
getPlayers = function(pos_plyr, num_plyr){
  selection = df[df$Preferred.Positions==pos_plyr,]
  selection = selection[selection$Growth.scope==max(selection$Growth.scope),]
  
  if(num_plyr == 1 | (dim(selection)[1] > 1 & num_plyr == 2 )){
    selection = selection[selection$Growth.scope==max(selection$Growth.scope),]
    selection = selection[order(selection$Growth.scope, decreasing = T),]
    selection[1:num_plyr,]
  }
  #sample_n(selection, num_plyr)
  else if (dim(selection)[1] < 2 & num_plyr == 2 ){
    selection = df[df$Preferred.Positions==pos_plyr,]
    selection = selection[selection$Growth.scope >= sort(unique(selection$Growth.scope), TRUE)[2],]
    selection = selection[order(selection$Growth.scope, decreasing = T),]
    selection[1:num_plyr,]
    #print("here")
  }
  else if (dim(selection)[1] < 3 & num_plyr == 3 ){
    selection = df[df$Preferred.Positions==pos_plyr,]
    selection = selection[selection$Growth.scope >= sort(unique(selection$Growth.scope), TRUE)[3],]
    selection = selection[order(selection$Growth.scope, decreasing = T),]
    selection[1:num_plyr,]
    #print("here")
  }
  
}

#picking team
team <- getPlayers('ST', 2)
team <- rbind(team, getPlayers('LW', 1))
team <- rbind(team, getPlayers('RW', 1))
team <- rbind(team, getPlayers('CM', 2))
team <- rbind(team, getPlayers('LB', 1))
team <- rbind(team, getPlayers('RB', 1))
team <- rbind(team, getPlayers('CB', 2))
team <- rbind(team, getPlayers('GK', 1))
