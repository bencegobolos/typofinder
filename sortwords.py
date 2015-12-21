#!/usr/bin/python
import sys
import re
import time

# Create a file named: words
def write(filename):
    wordsfile = filename + ".words"
    print("Creating a new file: " + wordsfile) 

    try:
        file = open(wordsfile,'a')
        file.close()
        return wordsfile;

    except:
        print("Something went wrong! Can\'t tell what?")
        sys.exit(0)

# Read from input file
def readfile( filename ):
    print("Reading from file: " + filename)
    f = open(filename, "r")
    for line in f:
        words.extend(filter(None, re.split("[, .!?:()]+", line)))
    f.close()

# Write all the words into file: words
def writeintofile( filename ):
    print("Writing into file: " + filename)
    f = open(filename, "w")
    for w in words:
        f.write(w + '\n')
    f.close()

input_txt = str(sys.argv[1])

# Creating new file with the name: words.txt
wordsfile = write(input_txt)

# List where all the words will be.
words = []

# Reading from file: 0.txt
readfile(input_txt)

# Filter words with regex.
regex1 = "^[-]"
regex2 = "[A-Za-z-']"
print("Filtering words...")
words = [w for w in words if not re.match(regex1, w)]
words = [w for w in words if re.match(regex2, w)]

# Every word is uppercased. List sorting alphabetically.
words = [x.upper() for x in words]
words.sort()

writeintofile(wordsfile)
print("All the words from " + input_txt + " are in " + wordsfile + ".")
