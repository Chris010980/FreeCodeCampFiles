#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo "Enter your username:"
read NAME

# check if name has only characters
if [[ $NAME =~ ^[a-zA-Z0-9\_]{1,22}$ ]]
then
  #echo "valid"
  # check if name is already in database
  PLAYER=$($PSQL "SELECT name FROM player WHERE name = '$NAME'")
  if [[ -z $PLAYER ]]
  then
    # if not in database
    echo "Welcome, $NAME! It looks like this is your first time here."
  else
    # if already in database
    PLAYER_ID=$($PSQL "SELECT player_id FROM player WHERE name = '$NAME'")
    NUM_GAMES=$($PSQL "SELECT COUNT(game_id) FROM games WHERE player_id = $PLAYER_ID" | sed -E 's/ //g')
    MIN_GUESS=$($PSQL "SELECT MIN(number_guesses) FROM games WHERE player_id = $PLAYER_ID" | sed -E 's/ //g')
    echo "Welcome back, $NAME! You have played $NUM_GAMES games, and your best game took $MIN_GUESS guesses."
  fi
else
  echo "invalid"
fi


NUMBER=$((1 + RANDOM % 1000))

#echo $NUMBER

echo "Guess the secret number between 1 and 1000:"

GUESS=0
TRIES=0
while [[ $GUESS != $NUMBER ]]
do
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]{1,3}$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS > $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    TRIES=$((TRIES+1))
  elif [[ $GUESS < $NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    TRIES=$((TRIES+1))
  elif [[ $GUESS == $NUMBER ]]
  then
    TRIES=$((TRIES+1))
    if [[ -z $PLAYER ]]
    then 
      INSERT_PLAYER=$($PSQL "INSERT INTO player(name) VALUES('$NAME')") 
    fi
    PLAYER_ID=$($PSQL "SELECT player_id FROM player WHERE name = '$NAME'")
    INSERT_GAME=$($PSQL "INSERT INTO games(player_id, secret_number, number_guesses) VALUES($PLAYER_ID, $NUMBER, $TRIES)")

    echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
  else
    echo "That is not an integer, guess again:"
  fi
done
