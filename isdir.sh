#!/bin/bash
#copy the IFS so we can easily work on the 
#files with spaces.  Seems to only happen with
#chromium files, but that's okay.
OLDIFS=$IFS
IFS=$'\n'

#grab the script's direcctory so we can start
#working based on that path
THISDIR=$(dirname $(readlink -f $0))

#keep track of our director
STARTDIR=$(pwd)


#backup directory to use
BACKUPDIR=~/.dotfilebackup

#grab all nodes under our current directory
#strip out the leading ./
#only consider hidden files
#strip out git-stuff and anything below our directory
BASEFILES=$(find | cut -d "/" -f 2- | grep "^\." | grep -v -e "^..\?$" -e ".git" | tac)

#first we want to go through directories to create the 
#structure and the backup
for file in $BASEFILES; do
   if [ -d $THISDIR/$file ]; then
      #we're dealing with a directory, if it exists in the base dir
      #create a copy of it in the backup directory
      if [ -a ~/$file ]; then
         echo "~/$file exists, backing up..."
         mkdir -p $BACKUPDIR/$file
      fi
      
      #make the directory
      mkdir -p ~/$file
   fi
done

#let's do all the files now.
for file in $BASEFILES; do
   if [ ! -d $THISDIR/$file ]; then
      if [ -a $THISDIR/$file ]; then
         echo -n "Copying "
      
         #it's a file, let's see if she exists
         if [ -a ~/$file ]; then
            #copy the file to the backup directory
            echo -n "and backing up old "
            cp ~/$file $BACKUPDIR/$file
            rm ~/$file
         fi
         echo "~/$file"
         ln -s $THISDIR/$file ~/$file
      fi
   fi
done

IFS=$OLDIFS

