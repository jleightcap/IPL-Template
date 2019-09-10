#!/bin/bash
# Command line argument for class folder
class=$1
mainpath=~/Documents/$class
maindoc=$mainpath/Notes.tex
lecpath=$mainpath/Lecture

# Find the first lecture number that doesn't already exist
i=1
while [[ -e $lecpath/$i.tex ]] ; do
	let i++
done
# Copy template lecture file
cp $lecpath/x.tex $lecpath/$i.tex #Create new Lecture file



# In order to render from the Lecture subdocuments, an \import
# must be used in the main Notes.tex file.

# Get the length of the main Notes.tex file
lines=`awk 'END {print NR}' $maindoc`
# String to be inserted into main Notes.tex file
insert='\import{Lecture/}{'$i'}'
# Insert String into second-from-bottom line of Notes.tex:
# 	$insert
# 	\end{document}
# This can be improved by just placing above \end{document} in case of extra bottom whitespace
sed -i ''$lines$'i \\\\'$insert'' $maindoc #Add string to Notes.tex


# Open new Lecture file for editing
# Start editing new file (this is used for my vim setup)
#vim $lecpath/$i.tex

