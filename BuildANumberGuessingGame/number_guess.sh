#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"
NUMBER=$(($RANDOM % 1000))
echo "Enter your username:"
read NAME
PLAYER_ID=$($PSQL "select player_id from players where name='$NAME';")
if [[ -z $PLAYER_ID ]]
then
  INSERT_PLAYER=$($PSQL "insert into players(name) values('$NAME');")
  echo "Welcome, $NAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "select count(*) from games where player_id=$PLAYER_ID;")
  BEST_GAME=$($PSQL "select min(number_tries) from games where player_id=$PLAYER_ID;")
  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
FIND="FALSE"
NUMBER_GUESSINGS=0
echo "Guess the secret number between 1 and 1000:"
read ANSWER
while [ $FIND == "FALSE" ]
do
  if [[ ! $ANSWER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $ANSWER > $NUMBER ]]
    then
      NUMBER_GUESSINGS=$((NUMBER_GUESSINGS + 1))
      echo "It's lower than that, guess again:"
    elif [[ $ANSWER < $NUMBER ]]
    then
      NUMBER_GUESSINGS=$((NUMBER_GUESSINGS + 1))
      echo "It's higher than that, guess again:"
    fi
  fi
  read ANSWER
  if [[ $ANSWER == $NUMBER ]]
  then
    NUMBER_GUESSINGS=$((NUMBER_GUESSINGS + 1))
    echo "You guessed it in $NUMBER_GUESSINGS tries. The secret number was $NUMBER. Nice job!"
    PLAYER_ID=$($PSQL "select player_id from players where name='$NAME';")
    INSERT_GAME_RESULT=$($PSQL "insert into games(player_id, number_tries) values('$PLAYER_ID', $NUMBER_GUESSINGS);")
    FIND="TRUE"
  fi
done