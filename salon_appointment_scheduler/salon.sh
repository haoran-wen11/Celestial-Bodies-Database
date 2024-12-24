#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~~ My Salon ~~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]; then
    echo -e "\n$1"
  fi

  # Display services
  SERVICES_LIST=$($PSQL "SELECT * FROM services;" )
  echo "$SERVICES_LIST" | while read SERVICE_ID BAR SERVICE
  do
    echo -e "$SERVICE_ID) $SERVICE"
  done

  # Pich a service
  echo -e "5) Exit\n\nPlease choose a service:"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    [1-4]) SERVE ;;
    5) EXIT ;;
    *) MAIN_MENU "Please enter a valid option.";;
  esac
}

SERVE() {
  echo -e "\nWhat's you phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_AVAILABILITY=$($PSQL "SELECT * FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  echo $PHONE_AVAILABLE
  # if customer not available
  if [[ -z $CUSTOMER_AVAILABILITY ]]; then
    echo "Please enter your name."
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  # get customer ID
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  # ask for service time
  echo -e "\nPlease enter the service time."
  read SERVICE_TIME
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
  SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}
MAIN_MENU