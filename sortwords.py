#!/usr/bin/python
import sys
import re
import time
import os

# Create a file named: words
def write(txt_name, folder):
    try:
        wordsfile = txt_name + ".words"
        print("CREATING a new file: " + wordsfile + " in the gen/" + folder + " folder.")
        os.mkdir("gen/" + folder)
        path = os.path.join("gen", folder, wordsfile)
        file = open(path, 'a')
        file.close()
        return wordsfile;

    except:
        print("Something went wrong! Can\'t tell what?")
        sys.exit(0)

# Read from input file
def readfile(filepath):
    print("READING from file: " + filepath + ".")
    f = open(filepath, "r")
    for line in f:
        words.extend(filter(None, re.split("[, .!?:()]+", line)))
    f.close()

# Write all the words into file: words
def writeintofile(filename, folder):
    print("WRITING into file: " + filename + ".")
    path = os.path.join("gen", folder, filename)
    f = open(path, "w")
    for w in words:
        f.write(w + '\n')
    f.close()

input_txt = str(sys.argv[1])
input_txt_name = str(sys.argv[2])
folder_name = str(sys.argv[3])

# Creating new file with the name: words.txt
wordsfile = write(input_txt_name, folder_name)

# List where all the words will be.
words = []

# Reading from file.
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

writeintofile(wordsfile, folder_name)
print("All the words from " + input_txt + " are in gen/" + wordsfile + ".")
