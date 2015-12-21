###Introduction
These scripts are intended to find typos in .tex files. Because I did not find a script that converts .tex files into  a simple .txt, I just started to work with .pdf files.
Therefore I made a script named pdftypo.sh.
Firstly it will generate a .txt from a .pdf file.
Then a python script will generate a file from the .txt, where all the words (that do not start with '-') will be in separate lines.
Finally it will use the "spell" command ( www.linfo.org/spell ) to generate a .typo file.
Unfortunately it will think that all the abbreviations and the "special" words are misspelled, so I opened gedit and deleted the words manually that do not contain typos.
After that I made a file named "all_the_typos.txt" and put the words that have typos. The reason for this is I searched for typos in 3 different .pdf files: ARM, PowerPC and TriCore Users guide. Every one of them has a .typo file with different words. In "all_the_typos.txt" I collected every misspelled words that sould be found in .tex files.

NOTE: if you find a typo, just put it in a new line in "all_the_typos.txt" file, uppercased. It should find .tex file that contain the misspelled word you found.

###How to use
* Put script_findtextypo folder in the root.
* Run pdftypo.sh script. It should have one parameter, the .pdf you want to check.
* Now you have to check manually for typos in .txt.words.typo file.
* Make a file named "all_the_typos.txt", and put the misspelled words you would like to find in the .tex files. Every word should be in a different line.
* Run findtextypo.sh script with the parameter "all_the_typos.txt". It will generate the "all_the_typos.log" file.
