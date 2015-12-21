###Introduction
These scripts are intended to find typos in .tex files. But firstly, I made a script that works with a .txt file.
After this script is done, findtextypo.sh will find every occurrence in .tex file(s) of the misspelled words.
The benefit of this fragmentation is the script can also be used to find typos in another type of files, if you convert them to .txt first (pdf, html, etc. It's really up to you).

NOTE: if you find a typo, just put it in a new line in your ".typos" file, uppercased. It should find .tex file that contain the misspelled word you found.

###How to use
* Run pdftypo.sh. There must be one argument; the .txt file you want to check. This script will make a folder - named after the .txt file - in /gen where you can find the results.
* You have to make a .typos file (basically anywhere, but I suggest you to put it in gen/<your_folder>) file based on the .typo file generated in gen/<your_folder>/*.typo
* Run findtextypo.sh with two parameters; first should be the .typos file, second should be the root folder where you want to find and check .tex files.
