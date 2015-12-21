#!/bin/bash

if (( $# != 1  )); then
  echo "Illegal number of arguments."
  exit
fi

if [[ ! "$1" =~ "all_the_typos.txt"  ]]; then
  echo "Input argument should be \"all_the_typos.txt\" file."
  exit
fi

log_file="$1"
log_file="${log_file%.*}.log"

# texfiles: all the files ending with .tex
# spell_typos: file with typos found.
# findit.txt: LOG file containing where is a typo (which file, which line).
texfiles=(`find ../ -name *.tex`)
readarray typos < $1
printf "LOG file for typo's found.\n\n" > "$log_file"

# Get where are the typos in .tex files.
echo "Writing result in $log_file file. May take some time..."
for file in ${texfiles[@]}
do
  # Convert every line to uppercase in order to find typos.
  readarray mytexfile < $file
  mytexfile=("${mytexfile[@]^^}")

  for typo in ${typos[@]}
  do
    for idx in ${!mytexfile[@]}
    do
      if [[ "${mytexfile[$idx]}" =~ "$typo" ]]; then
        echo "TYPO FOUND in $file: $typo on line $((idx+1))" >> $log_file
      fi
    done
  done
done
