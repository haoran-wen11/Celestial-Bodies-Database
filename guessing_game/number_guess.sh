#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN_MENU() {
  echo -e "\nEnter your username:"
  read USER_NAME
  USER_AVAILABILITY=$($PSQL "SELECT * FROM users WHERE name = '$USER_NAME'")

  if [[ -z $USER_AVAILABILITY ]]; then
    echo -e "\nWelcome, $USER_NAME! It looks like this is your first time here."
    USER_INSERT_RESULT=$($PSQL "INSERT INTO users (name) VALUES ('$USER_NAME')")
  else
    # Query number of games played
    NUMBER_GAME_PLAYED=$($PSQL "SELECT COUNT(*) FROM games INNER JOIN users USING (user_id) WHERE name = '$USER_NAME' ")
    BEST_GUESS=$($PSQL "SELECT MIN(tries) FROM games INNER JOIN users USING (user_id) WHERE name = '$USER_NAME' ")
    # Query the best game
    echo -e "\nWelcome back, $USER_NAME! You have played $NUMBER_GAME_PLAYED games, and your best game took $BEST_GUESS guesses."
  fi
  # Fetch user_id
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USER_NAME'")
  GAME
}

GAME() {
  # Number of guesses
  TRIES=0
  SECRET_NUMBER=$((1 + RANDOM % 1000))
  echo -e "\nGuess the secret number between 1 and 1000:"

  while [[ true ]]; do
    read GUESS
    ((TRIES++))
    if [[ $GUESS =~ ^[0-9]+$ ]]; then
      # Guessed!
      if [[ $GUESS = $SECRET_NUMBER ]]; then
        echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
        INSERT_TO_GAME=$($PSQL "INSERT INTO games (tries, user_id) VALUES ($TRIES, $USER_ID)")
        exit
      # Greater
      elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
        echo -e "\nIt's higher than that, guess again:"
      # Lower
      else
        echo -e "\nIt's lower than that, guess again:"
      fi
    else
      echo "That is not an integer, guess again:"
    fi
  done
}

MAIN_MENU