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
#       INSERT: ./yoda.sh 'ENTER URL HERE'
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
URL="$1"
CAT="cat -n $HOME/${DIR}/${FILE}"


# ------------------------------------------------------------------------------
# | FUNCTIONS                                                                  |
# ------------------------------------------------------------------------------

# Add URL
yoda_add() {
    echo "Saving..."
    echo ${URL} >> $HOME/${DIR}/${FILE}
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

# Everybody need some help
yoda_help() {

cat <<EOT

------------------------------------------------------------------------------
YODA SAVES - May the Force be with your favorites
------------------------------------------------------------------------------

Usage: ./yoda.sh [url, options]

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
# | OPTIONS                                                                    |
# ------------------------------------------------------------------------------

# View file option
if [[ "$URL" == "-l" || "$URL" == "--list" ]]; then
    yoda_list
    exit
fi

# Open file option
if [[ "$URL" == "-o" || "$URL" == "--open" ]]; then
    yoda_open
    exit
fi

# Show help option
if [[ "$URL" == "-h" || "$URL" == "--help" ]]; then
    yoda_help
    exit
fi

# Add url option
if [[ "$URL" ]]; then
    yoda_add
    exit
fi
