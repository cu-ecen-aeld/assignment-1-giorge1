#!/bin/bash
# Write a shell script finder-app/finder.sh as described below:

#     Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr

#     Exits with return value 1 error and print statements if any of the parameters above were not specified

#     Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

#     Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains searchstr (and may also contain additional content).

filesdir=$1
searchstr=$2

if [ $# -ne 2 ]; then 
    echo "Param number not correct"
    exit 1
fi

if [ ! -d "$filesdir" ]; then
  echo "The directory ${filesdir} does not exists."
  exit 1
fi

files=$(find -L "$filesdir"  -type f)
number=$(echo "$files" | wc -l)
echo "The number of files are ${number} and the number of matching lines are $(cat $(find -L "$filesdir"  -type f) | grep "$searchstr" | wc -l)"



