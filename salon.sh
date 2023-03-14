#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~ Welcome to The Salon ~~~\n"


SERVICES_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  # display services
  echo -e "\nHere are the services we have available:"
  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services where service_id > 0")
  echo -e "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    #only display current services
    if [[ $SERVICE_ID =~ ^[0-9]+$ ]]
    then
      echo "$SERVICE_ID) $NAME"
    fi
  done
  echo "What service would you like today?"
  read SERVICE_ID_SELECTED
  #echo $SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    SERVICES_MENU
  else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
    # get service availability
    if [[ -z $SERVICE_NAME ]]
    then
      SERVICES_MENU 
    else
      REGISTRATION
    fi
  fi
}
  
REGISTRATION() {
  #get phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
     
  # if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  echo "What time would you like to come in?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')") 
  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}



SERVICES_MENU