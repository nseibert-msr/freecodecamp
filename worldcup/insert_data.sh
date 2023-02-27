#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
if [[ $YEAR != "year" ]]
then
  #get team_id
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name=('$WINNER');")
  TEAM_ID_2=$($PSQL "SELECT team_id FROM teams WHERE name=('$OPPONENT');")
  #check if team already exists
  if [[ -z $TEAM_ID ]]
  #insert winners into teams
  then
    INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');") 
    if [[ $INSERT_TEAM == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $WINNER
    fi
  fi
  if [[ -z $TEAM_ID_2 ]]
  #insert opponents into teams
  then
    INSERT_TEAM_2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');") 
    if [[ $INSERT_TEAM_2 == "INSERT 0 1" ]]
    then
      echo Inserted into teams, $OPPONENT
    fi
  fi
  #log game results
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name=('$WINNER');")
  TEAM_ID_2=$($PSQL "SELECT team_id FROM teams WHERE name=('$OPPONENT');")
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES( $YEAR, '$ROUND', $TEAM_ID, $TEAM_ID_2, $WINNER_GOALS, $OPPONENT_GOALS);")
fi

done
