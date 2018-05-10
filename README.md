# EA sports FIFA 18

This is a data visualziation project involving analysis of players in fifa 18.

Data is extracted from kaggle competition, https://www.kaggle.com/thec03u5/fifa-18-demo-player-dataset/data.

## Files includes:

    -   1.DataCleaning: data cleaning and wrangling is done.
    -   2.Visualization: data exploration and visualization is done
        -   2.1.VisualizingPlayers: Exploring Players
        -   2.1.VisualizingTeams: Exploring Teams
    -   3.TeamCreation: creating teams with different capabilities.

## 1.DataCleaning: Wrangling data!! 
(FILE: https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/Code/1.DataCleaning.R)

We would create few more variables from data to get more insightfull information. 
 -  It could be seen from the data that lot of players have multiple preffered positions, selecting their first prefered position as prefered position
 -  Variables like Aggression, Stamina, Sprint.Speed and Strength have values as charaters, including + sign in middle. Probably showing extra growth of palyer. But we are only taking first two values and converting them into numerical values.
 -  With their total overall and potential we can calculate their scope of growth, this would state by how much overall they can grow with.


## 2.Visualization: Lets vizualize!!

## 2.1.VisualizingPlayers 
(FILE: https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/Code/2.1.VisualizingPlayers.R)

### 2.1.1 Let's look into who would be the best aspect in fifa, considering players which have high growing potential.

#### Creating a histogram for all players, counting their gowing potential.
<p align="center"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/player_growth.png" width="850"/></p>

#### It could be seen that lot of players have growing potential of 0, showing lot of people do not have any growth scope in the game. Lets consider more towards players who have growing potential of 20 or more.
<p align="center"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/player_growth_above20.png" width="850"/></p>
It could be seen that there are quite a few players which could make really good team in fifa, as their potential growth is very high.

#### Now lets look at the players who have maximum growth rate
Here are top players who will grow with the maximum potential,
<p align="center"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/best_growing_potential.png" width="850"/></p>

### 2.1.2 Plotting age of players
First plot all players age in a density map.
<p align="center"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/age.png" width="850"/></p>

Now, plotting age for each position.
<p align="center"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/age_density.png" width="850"/></p>

### 2.1.3 plotting overall of players
Plotting spread of overall of all players.
<p align="center"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/overall.png" width="850"/></p>

### 2.1.4 Plotting top 100 players according to their nationality
We will take top 100 players according to their overall, and then will plot a histogram according to their nationality. This will tell us which country have higher number of best players.
<p align="center"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/top100_&_countries.png" width="850"/></p>

### 2.1.5 Plotting strength of players according to their playing position
This will show us that which position needs more strength 
<p align="center"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/strength_density.png" width="850"/></p>

## 2.2.VisualizingTeams 
(FILE: https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/Code/2.2.VisualizingTeams.R )

### 2.2.1 Top 10 teams which have highest average overall of players
<p align="left"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/top10_teams.png" width="150"/></p>

### 2.2.2 Bottom 10 teams which have lowest average overall of players
<p align="left"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/bottom10_teams.png" width="150"/></p>

## 3.TeamCreation: Create teams or seach for players according to preferences!! 
(FILE: https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/Code/3.TeamCreation.R)

### 3.1 Creating a team with highest growing potential.
Function is created which will give players with growing potential as maximum. This function takes preffered position and number of players as input and it will generate number of players. Another function is created which generate 4-4-2 formation players using the former one.

#### These 11 players have maximum growing potential in their preffered playing position. To the gamers, if we build a team with these players they will grow really nice during season play.
<p align="center"><img src="https://github.com/shabbir12hasan/the_best_of_EA_game_fifa_18/blob/master/graphs/442bestGrowingPotentialteam.png" width="850"/></p>

