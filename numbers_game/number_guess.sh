#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

USERNAME(){
  echo "Enter your username:"
  read USERNAME
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  #if user does not exist
  if [[ -z $USER_ID ]]
  then
    #save new user to users table
    NEW_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME');")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
  else
    GAMES_PLAYED=$($PSQL "SELECT count(user_id) FROM games WHERE user_id=$USER_ID;")
    BEST=$($PSQL "SELECT min(guess_num) FROM games WHERE user_id=$USER_ID;")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST guesses."
  fi
  GENERATE_NUM
}

GENERATE_NUM() {
  #generate random number
  RANDOM_NUM=$((1 + $RANDOM % 1000))
  GUESS_NO=0
  echo "Guess the secret number between 1 and 1000:"
  read GUESS
  GUESS_FUN
}
  
GUESS_FUN() {
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    GUESS_NO=$((GUESS_NO+1))
    GAME
  else
    echo "That is not an integer, guess again:"
    read GUESS
    GUESS_FUN
  fi
}

GAME(){
  if [[ $GUESS -lt $RANDOM_NUM ]]
  then
    echo "It's higher than that, guess again:"
    read GUESS
    GUESS_FUN
  else
    if [[ $GUESS -gt $RANDOM_NUM ]]
    then
      echo "It's lower than that, guess again:"
      read GUESS
      GUESS_FUN
    else
      NEW_GAME=$($PSQL "INSERT INTO games(rand_no, guess_num, user_id) VALUES ($RANDOM_NUM, $GUESS_NO, $USER_ID);")
      echo "You guessed it in $GUESS_NO tries. The secret number was $RANDOM_NUM. Nice job!"
    fi
  fi
}

USERNAME
