#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if there is an arguement
if [[ -z $1 ]]; then
  echo -e "Please provide an element as an argument."
  exit
fi

# Check elements by atomic number
if [[ $1 =~ ^[1-9]+$ ]]; then
  ELEMENT_AVAILABILITY=$($PSQL "SELECT * FROM elements WHERE atomic_number = '$1'")
# Check elements by symbol or name
else
  ELEMENT_AVAILABILITY=$($PSQL "SELECT * FROM elements WHERE symbol = '$1' OR name = '$1'")
fi

# If not available
if [[ -z $ELEMENT_AVAILABILITY ]]; then
  echo -e "I could not find that element in the database."
  exit
# If available
else
  echo $ELEMENT_AVAILABILITY | while IFS='|' read ATOMIC_NUMBER SYMBOL NAME
  do
    # Fetch element properties from the db
    ELEMENT_PROPERTIES=$($PSQL "SELECT atomic_mass, melting_point_celsius, boiling_point_celsius, types.type 
                                FROM properties INNER JOIN types USING (type_id) 
                                WHERE atomic_number = $ATOMIC_NUMBER")
    # Read the properties from the result of the SQL query
    echo $ELEMENT_PROPERTIES | while IFS='|' read ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
    do
      # Print the details of the element
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  done
fi