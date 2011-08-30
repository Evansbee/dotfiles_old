#!/bin/bash

set -e


#record where we started and where the script is being run from
STARTINGDIRECTORY=$(pwd)
DOTFILEDIRECTORY=$(dirname $(readlink -f $0))
BACKUPDIRECTORY=~/.dotfile_old

#jump to where the dotfiles are
cd $DOTFILEDIRECTORY

#beginning of the line that starts with a dot
FILES=$(ls -a | grep "^\." | grep -v -e "^..\?$" -e ".git")

#backup files
for file in $FILES; do
   if [ -e ~/$file ]; then
      echo "Backing up $file to $BACKUPDIRECTORY..."
      #do this here so we don't create it if there are no
      #files to backup...
      mkdir -p $BACKUPDIRECTORY
      #do a copy here so that the symlink
      cp ~/$file $BACKUPDIRECTORY/
      rm ~/$file
   fi
done


for file in $FILES; do 
   echo "Installing $file..."
   ln -s ${DOTFILEDIRECTORY}/${file} ~/${file}
done

cd $STARTINGDIRECTORY
