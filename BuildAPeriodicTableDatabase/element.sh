#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"
SHOW_INFO(){
  SYMBOL=$($PSQL "select symbol from elements where atomic_number=$1;")
  NAME=$($PSQL "select name from elements where atomic_number=$1;")
  TYPE=$($PSQL "select types.type from properties inner join types using(type_id) where atomic_number=$1;")
  ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$1;")
  MELTING_POINT_CELSIUS=$($PSQL "select melting_point_celsius from properties where atomic_number=$1;")
  BOILING_POINT_CELSIUS=$($PSQL "select boiling_point_celsius from properties where atomic_number=$1;")
  echo "The element with atomic number $1 is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
}
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+ ]]
  then
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where atomic_number=$1;")
    if [[ ! -z $ATOMIC_NUMBER ]]
    then
      SHOW_INFO $ATOMIC_NUMBER  
    fi
  else
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol='$1';")
    if [[ ! -z $ATOMIC_NUMBER ]]
    then
      SHOW_INFO $ATOMIC_NUMBER  
    else
      ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where name='$1';")
      if [[ ! -z $ATOMIC_NUMBER ]]
      then
        SHOW_INFO $ATOMIC_NUMBER  
      else
        echo "I could not find that element in the database."
      fi
    fi
  fi
fi