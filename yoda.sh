#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# Program: yoda.sh
# Author:  Vitor Britto
#
# Description:
#       This is my personal READ LATER method.
#
# Important:
#       First of all, define where you want to save your "readlater" file
#       then make this script executable to easily run it.
#       $ chmod u+x yoda.sh &&
#
# Usage:
#       INSERT: ./yoda.sh 'NAME' 'http://URL'
#       VIEW:   ./yoda.sh [ -l, --list ]
#       OPEN:   ./yoda.sh [ -o, --open ]
#       HELP:   ./yoda.sh [ -h, --help ]
#
# Assumptions:
#       - The url of interest is a simple one.
#
# Alias:
#       alias yoda="bash ~/path/to/script/yoda.sh"
# ---------------------------------------------------------------------------------------------------


# ------------------------------------------------------------------------------
# | VARIABLES                                                                  |
# ------------------------------------------------------------------------------

FILE="FAVORITES.md"
DIR="Desktop"
OPEN_COMMAND="/usr/bin/open"
CAT="cat -n $HOME/${DIR}/${FILE}"
EXT="${FILE##*.}"


# ------------------------------------------------------------------------------
# | FUNCTIONS                                                                  |
# ------------------------------------------------------------------------------

main(){
  #echo "Number of params = $#"

  # View file option
  if [[ "${1}" == "-l" || "${1}" == "--list" ]]; then
      yoda_list ${1}
      exit
  fi

  # Open file option
  if [[ "${1}" == "-o" || "${1}" == "--open" ]]; then
      yoda_open ${1}
      exit
  fi

  # Show help option
  if [[ "${1}" == "-h" || "${1}" == "--help" ]]; then
      yoda_help ${1}
      exit
  fi

  # Export bookmarks chrome
  if [[ "${1}" == "-e" || "${1}" == "--export" ]]; then
      _architerure archt
      yoda_export_chrome $archt
      exit
  fi

  # Add url option
  if [[ "$*" =~ "http://" ]]; then
      yoda_add $*
      exit
  else
      echo "Sorry, any valid parameter."
  fi

  echo "Sorry, any valid parameter."
  exit
}

# Add URL
yoda_add() {
    echo "Saving..."
    if [[ "${EXT}" == 'md' ]]; then
        echo "- [${1}](${2})" >> $HOME/${DIR}/${FILE}
    else
        echo "${1} ${2}" >> $HOME/${DIR}/${FILE}
    fi

    echo "✔ Done!"
}

# View file content
yoda_list() {
    echo "---------------------------------------------------"
    echo "                     FAVORITES                     "
    echo "---------------------------------------------------"
    ${CAT}
}

# Open file
yoda_open() {
    echo "Opening..."
    ${OPEN_COMMAND} $HOME/${DIR}/${FILE}
    echo "✔ Done!"
}

yoda_export_chrome(){
  ach=$1
  OS="$( uname )"
  if [ "$OS" == "Darwin" ]; then
    file="$HOME/Library/Application Support/Google/Chrome/Default/Bookmarks"
  else
    file="$HOME/.config/google-chrome/Default/Bookmarks"
  fi
  while read line; do
    if [[ $line =~ '"name":' ]]; then
      fav=$line
    fi
    if [[ $fav =~ '"name":' && $line =~ '"http://' ]]; then
      fav+=$line
      search1='"name":'
      search2=',"url": '
      name=${fav//$search1/''}
      fav=${name//$search2/' '}
      read name url <<<$(IFS='" "'; echo $fav)
      yoda_add "$name" "$url"
    fi
  done < "$file"
}

_architerure(){
  archt="$(uname -m)"
  if [ $archt == "x86_64" ]; then
    ret='64'
  else
    ret='32'
  fi
  return $ret
}


# Everybody need some help
yoda_help() {

cat <<EOT
------------------------------------------------------------------------------
YODA SAVES - May the Force be with your favorites
------------------------------------------------------------------------------

Usage: ./yoda.sh <name> <url> [, options]

Example:
Add a favorite with name
$ yoda GitHub http://github.com

Add a favorite without name
$ yoda http://github.com

Options:
    -h, --help      Print this help text
    -l, --list      Print a list of your favorites
    -o, --open      Open your favorites file

Documentation can be found at https://github.com/vitorbritto/yoda/

Copyright (c) Vitor Britto
Licensed under the MIT license.

------------------------------------------------------------------------------
EOT

}


# ------------------------------------------------------------------------------
# | MAIN OPTIONS                                                               |
# ------------------------------------------------------------------------------

main $*
