#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

FIND_INFORMATION() {
  #if 1st argument is missing
  if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
  else
    INPUT=$1
    CONVERT_INPUT_TO_ELEMENT
  fi
}

CONVERT_INPUT_TO_ELEMENT() {
  #if 1st argument is a number
  if [[ $INPUT =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$INPUT
    PRINT_INFORMATION
  else
    LEN=${#INPUT}
    if [[ $LEN -lt 3 ]]
    #if 1st argument is one or two characters
    then
      #lookup name based on symbol
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements where symbol='$INPUT';")
      PRINT_INFORMATION
    else
      #look up name based on name
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements where name='$INPUT';")
      PRINT_INFORMATION
    fi
  fi

}

PRINT_INFORMATION(){
if [[ -z $ATOMIC_NUMBER ]]
then
  echo -e "I could not find that element in the database."
else
  ATOMIC_NAME=$($PSQL "SELECT name FROM elements where atomic_number='$ATOMIC_NUMBER';")
  SYMBOL=$($PSQL "SELECT symbol FROM elements where atomic_number='$ATOMIC_NUMBER';")
  MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number='$ATOMIC_NUMBER';")
  MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number='$ATOMIC_NUMBER';")
  BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number='$ATOMIC_NUMBER';")
  TYPE_NO=$($PSQL "SELECT type_ID FROM properties WHERE atomic_number='$ATOMIC_NUMBER';")
  TYPE=$($PSQL "SELECT type FROM types WHERE type_id='$TYPE_NO';")
  echo -e "The element with atomic number $ATOMIC_NUMBER is $ATOMIC_NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $ATOMIC_NAME has a melting point of $MP celsius and a boiling point of $BP celsius."

fi

}


FIND_INFORMATION $1
