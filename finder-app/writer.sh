#!/bin/bash

# Accepts the following arguments: the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; the second argument is a text string which will be written within this file, referred to below as writestr

# Exits with value 1 error and print statements if any of the arguments above were not specified

# Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if it doesn’t exist. Exits with value 1 and error print 

if [ $# -ne 2 ]
then
    echo "Expected 2 parameters, but $# were provided, silly goose!"
    echo "Usage: finder.sh PATH STRING"
    echo "(1) PATH: Path to file to write STRING to."
    echo "(2) STRING: String to write to file."
    exit 1
fi

writefile=$1
writestr=$2

if [ ! -f $writefile ]
then
    # install utility is essential so it should always be available
    # It is actually used for copying files but it is handy in creating files
    # along with their parent directories
    install -D /dev/null $writefile
fi

(echo "$writestr")>$writefile

error=$?

if [ $error -ne 0 ]
then
    echo "Write to file failed with error $error"
    exit 1
fi

exit 0
