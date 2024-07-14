#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [ -z $1 ]
then
  echo "Please provide an element as an argument."
  exit
fi

if [[ $1 =~ ^[1-9]+$ ]]
then
  ELEMENTS=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements JOIN properties USING (atomic_number) JOIN types USING (type_id) WHERE atomic_number = $1;") 
else
ELEMENTS=$($PSQL "SELECT atomic_number, name, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements JOIN properties USING (atomic_number) JOIN types USING (type_id) WHERE name = '$1' OR symbol = '$1';")
fi

if [[ -z $ELEMENTS ]]
then
 echo "I could not find that element in the database."
 exit
else
  echo $ELEMENTS | while IFS=" |" read AN NAME SYMBOL MASS MELTING BOILING TYPE 
  do
    echo "The element with atomic number $AN is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
fi
