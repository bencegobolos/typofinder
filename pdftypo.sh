#!/bin/bash

# Check input argument if it's a .pdf file.
if (( $# != 1)); then
  echo "Illegal number of arguments."
  exit
fi

if [[ ! "$1" =~ ".pdf"  ]]; then
  echo "Input argument should be a .pdf file."
  exit
fi

# Get the file name, make a .txt
txt_file="$1"
txt_file="${txt_file##*/}"
txt_file="${txt_file%.*}.txt"

pdftotext "$1"
echo "$1 has been converted to .txt: $txt_file"

# Calling python script for getting all the words.
python sortwords.py $txt_file
wordsfile="$txt_file.words"

# Check for typos with spell
spell $wordsfile > "$wordsfile.typo.tmp"
uniq "$wordsfile.typo.tmp" > "$wordsfile.typo"
echo "NOTE: All the typos found are in $wordsfile.typo file!"
echo "Now you should check the words in it if they are really a typo."
echo "If you find a new typo, just type in the file in a new line."

rm "$wordsfile.typo.tmp"
rm "$wordsfile.tmp"
