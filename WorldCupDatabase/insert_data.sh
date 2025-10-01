#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
echo -e "\n$($PSQL "TRUNCATE TABLE teams, games;")"
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" && $OPPONENT != "opponent" ]]
  then
    #get_Winner_id
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER';")
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER == "INSERT 0 1" ]]
      then
        echo "INSERTED INTO Teams, WINNER: $WINNER"
      fi
    fi
    #get_Opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT == "INSERT 0 1" ]]
      then
        echo "INSERTED INTO teams, OPPONENT: $OPPONENT"
      fi
    fi
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    GAME_ID=$($PSQL "SELECT * from games WHERE winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID AND year=$YEAR AND round='$ROUND' AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS")
    if [[ -z $GAME_ID ]]
    then
      INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOALS, $OPPONENT_GOALS, $WINNER_ID, $OPPONENT_ID)") 
      if [[ $INSERT_GAME == "INSERT 0 1" ]]
      then
        echo "INSERTED INTO games: $WINNER X $OPPONENT - $WINNER_GOALS-$OPPONENT_GOALS - $ROUND - $YEAR"
      fi
    fi
  fi
done


# Do not change code above this line. Use the PSQL variable above to query your database.
