#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# Program: yoda.sh
# Author:  Vitor Britto
#
# Description:
#       A simple method to collect your links
#       and saves into a file using Shell Script.
#
# Important:
#       First of all, define where you want to save your "readlater" file
#       then make this script executable to easily run it.
#       $ chmod u+x yoda.sh &&
#
# Usage:
#       INSERT: ./yoda.sh 'ENTER URL HERE'
#       VIEW:   ./yoda.sh [ -l, --list ]
#       OPEN:   ./yoda.sh [ -o, --open ]
#
# Assumptions:
#       - There is not more than one url per line of text.
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
URL="$1"
CAT="cat -n $HOME/${DIR}/${FILE}"

# ------------------------------------------------------------------------------
# | FUNCTIONS                                                                  |
# ------------------------------------------------------------------------------

# add url
yoda_add() {
    echo "Saving..."
    echo ${URL} >> $HOME/${DIR}/${FILE}
    echo "✔ Done!"
}

# view content
yoda_list() {
    echo "---------------------------------------------------"
    echo "                     FAVORITES                     "
    echo "---------------------------------------------------"
    ${CAT}
}

# open file
yoda_open() {
    echo "Opening..."
    ${OPEN_COMMAND} $HOME/${DIR}/${FILE}
    echo "✔ Done!"
}


# ------------------------------------------------------------------------------
# | OPTIONS                                                                    |
# ------------------------------------------------------------------------------

# View "READ LATER" file
if [[ "$URL" == "-l" || "$URL" == "--list" ]]; then
    yoda_list
    exit
fi

# Open "READ LATER" file
if [[ "$URL" == "-o" || "$URL" == "--open" ]]; then
    yoda_open
    exit
fi

if [[ "$URL" ]]; then
    yoda_add
    exit
fi
