# BASIC program label to line number converter

## In the 1980's, I wanted a better way to write software for my C64.   Line numbers were a pain, renumbering was a mess when I ran out of room, and there was no IDE to speak of.   I turned to using word processors, mostly Super-Text, to write my code as text files with no line numbers, and converting later.
## Anything beginning in column 1 is a label.   Anything indented is regular code.   All labels become remark statements.


* label.bas 
  - This program reads a labeled BASIC program and converts it to have line numbers.  Not a big deal today, but it was pretty cool on a C64 in the 1980's.
* load.bas 
  - This puts a machine language program into the cassette buffer, opens a file, then does a new and effectively types in the file from a test file.   This can load the numbered program into memory like a normal program, then it can be run or saved.   The break at the end is not working yet, so you need to use run/stop restore to break out when it completes.
* ml_loader.txt 
  - This is an example program that will take a machine language program on disk and convert it to a series of data statements and a poke loop for loading ML from BASIC.   Useful for mixing the two.
* reader3.txt 
  - Simple example sequential file reader that writes to screen.
* ascii_convert.txt 
  - Simple ASCII/PETSCII converter.
* build_d64.sh 
  - BASH shell script to build a disk image of the items in the repo.

## How-To:
* Run build_d64.sh
* Mount test test.d64 disk in VICE
* load"label",8
* run
* use the filename reader3
* run again for ml-loader and ascii-convert
* load"load",8
* run
* use the filename b-reader3
* hit enter to begin
* run/stop restore when it completes
* The BASIC program is in memory for you to run, list, save, whatever you like.
