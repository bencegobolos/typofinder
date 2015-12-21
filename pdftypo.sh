#!/bin/bash

# Check input argument if it's a .pdf file.
if (( $# != 1)); then
  echo "Illegal number of arguments."
  exit
fi

if [[ ! "$1" =~ ".txt"  ]]; then
  echo "Input argument should be a .txt file."
  exit
fi

# Get the file name, path.
txt_file="$1"
txt_file_name="$(basename ${txt_file##*/})"
folder_name="${txt_file_name%.*}"

# Calling python script for getting all the words.
python sortwords.py $txt_file $txt_file_name $folder_name
path="gen/$folder_name"
wordsfile="$path/$txt_file_name.words"

# Check for typos with spell
spell $wordsfile > "$wordsfile.typo.tmp"
uniq "$wordsfile.typo.tmp" > "$wordsfile.typo"
rm "$wordsfile.typo.tmp"

echo "NOTE: All the typos found are in $wordsfile.typo file!"
echo "Now you should check the words in it if they are really a typo."
echo "If you find a new typo, just type in the file in a new line."
