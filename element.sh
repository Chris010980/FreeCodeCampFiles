#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
ERR="I could not find that element in the database."

# first check if there is no argument and give an error message
if [[ -z $1 ]]
then
  echo 'Please provide an element as an argument.'
else
  # check wether it is a number, symbol or name
  #
  # check only basic syntax not to run into error
  # because of a bad sql querry
  NUM="$(echo $1 | grep -E '^[0-9]{,2}$')"
  if [[ $NUM != '' ]]
  then
    OUT_NUM=$($PSQL "SELECT * FROM properties WHERE atomic_number = $NUM")
    if [[ $OUT_NUM != '' ]]
    then
      MAS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $NUM")
      MEL=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $NUM")
      BOI=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $NUM")
      TYP_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $NUM")
      TYP=$($PSQL "SELECT type FROM types WHERE type_id = $TYP_ID")
      NAM=$($PSQL "SELECT name FROM elements WHERE atomic_number = $NUM")
      SYM=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $NUM")
      echo "The element with atomic number $NUM is $NAM ($SYM). It's a $TYP, with a mass of $MAS amu. $NAM has a melting point of $MEL celsius and a boiling point of $BOI celsius."
      exit
    else
      echo $ERR
      exit
    fi
  fi
  SYM="$(echo $1 | grep -E '^[A-Z][a-z]?$')"
  if [[ $SYM != '' ]]
  then
    OUT_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$SYM'")
    if [[ $OUT_NUM != '' ]]
    then
      NUM=$OUT_NUM
      MAS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $NUM")
      MEL=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $NUM")
      BOI=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $NUM")
      TYP_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $NUM")
      TYP=$($PSQL "SELECT type FROM types WHERE type_id = $TYP_ID")
      NAM=$($PSQL "SELECT name FROM elements WHERE atomic_number = $NUM")
      SYM=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $NUM")
      echo "The element with atomic number $NUM is $NAM ($SYM). It's a $TYP, with a mass of $MAS amu. $NAM has a melting point of $MEL celsius and a boiling point of $BOI celsius."
      exit
    else
      echo $ERR
      exit
    fi
  fi  
  NAM="$(echo $1 | grep -E '^[A-Z][a-z]{2,}$')"
  if [[ $NAM != '' ]]
  then
    OUT_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$NAM'")
    if [[ $OUT_NUM != '' ]]
    then
      NUM=$OUT_NUM
      MAS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $NUM")
      MEL=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $NUM")
      BOI=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $NUM")
      TYP_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $NUM")
      TYP=$($PSQL "SELECT type FROM types WHERE type_id = $TYP_ID")
      NAM=$($PSQL "SELECT name FROM elements WHERE atomic_number = $NUM")
      SYM=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $NUM")
      echo "The element with atomic number $NUM is $NAM ($SYM). It's a $TYP, with a mass of $MAS amu. $NAM has a melting point of $MEL celsius and a boiling point of $BOI celsius."
      exit
    else
      echo $ERR
      exit
    fi
  fi
  echo $ERR
  exit  
fi
