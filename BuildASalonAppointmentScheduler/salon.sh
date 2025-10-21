#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"
MAIN_MENU(){
  if [[ $1 ]]
  then
    echo "$1"
  fi
  echo -e "\n~~  My Salon ~~"
  echo -e "\nWelcome to my salon, how may i help you?\n"
  OPTIONS=$($PSQL "select service_id, name from services order by service_id;")
  echo "$OPTIONS" | while IFS='|' read NUMBER SERVICE
  do
    echo "$NUMBER) $SERVICE"
  done
  #Leio a opção de serviço
  read SERVICE_ID_SELECTED
  if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then 
    SERVICE_ID=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED;")
    # Se a opção não for encontrada
    if [[ -z $SERVICE_ID ]]
    then
      MAIN_MENU "Sorry, we don't have that option of service! Try again."
    # Se for uma opção válida
    else
      echo -e "\nWhat is your phone number?"
      read CUSTOMER_PHONE
      if [[ -z $CUSTOMER_PHONE ]]
      then
        MAIN_MENU "Sorry! Please, type a valid phone number!"
      else
        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
        if [[ -z $CUSTOMER_ID ]]
        then
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME
          if [[ -z $CUSTOMER_NAME ]]
          then
            MAIN_MENU "Sorry! Please, type a valid customer name!"
          else
            INSERT_CUSTOMER_RESULT=$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
            if [[ $INSERT_CUSTOMER_RESULT == "INSERT 0 1" ]]
            then
              CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
              SERVICE_NAME=$($PSQL "select name from services where service_id='$SERVICE_ID';")
              CUSTOMER_NAME=$($PSQL "select name from customers where customer_id=$CUSTOMER_ID")
              echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME."
              read SERVICE_TIME
              if [[ ! -z $SERVICE_TIME ]]
              then
                APPOINTMENT_INSERT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME');")
                if [[ ! -z $APPOINTMENT_INSERT ]]
                then
                  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
                fi
              else
                MAIN_MENU "Sorry! That time is invalid, try again!"
              fi
            else
              MAIN_MENU "Sorry! Please, that phone number already exist, try again!"
            fi
          fi
        else
          CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
          SERVICE_NAME=$($PSQL "select name from services where service_id='$SERVICE_ID';")
          CUSTOMER_NAME=$($PSQL "select name from customers where customer_id=$CUSTOMER_ID")
          echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME."
          read SERVICE_TIME
          if [[ ! -z $SERVICE_TIME ]]
          then
            APPOINTMENT_INSERT=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME');")
            if [[ ! -z $APPOINTMENT_INSERT ]]
            then
              echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
            fi
          else
            MAIN_MENU "Sorry! That time is invalid, try again!"
          fi
        fi
      fi
    fi
  else
    MAIN_MENU "Sorry, that's not a valid option! Try again"
  fi
}

MAIN_MENU