#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))
NUMBER_OF_GUESSES=0

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, 0);")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"

while true; do
  read PLAYER_GUESS

  if [[ ! $PLAYER_GUESS =~ ^-?[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
  else
    ((NUMBER_OF_GUESSES++))
    if [[ $PLAYER_GUESS -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    elif [[ $PLAYER_GUESS -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    else
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      if [[ -z $GAMES_PLAYED ]]
      then
        GAMES_PLAYED=0
      fi
      if [[ -z $BEST_GAME ]] || [[ $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
      then
        UPDATE_BEST_SCORE=$($PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID;")
      fi
      ((GAMES_PLAYED++))
      UPDATE_NUMBER_OF_GAMES=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED WHERE user_id=$USER_ID;")
      exit
    fi
  fi
done
