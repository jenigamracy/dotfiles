#!/bin/bash

# Append contents of a file to one of the same name in the home directory,
# or copy the file to the home directory if file doesn't exist
function catDotFile {
    if [[ -e $1 ]]; then
        # If the file in the home directory exists,
        # cat the dot file in the repo to it
        echo -e "About to cat: \e[1;34m$1\e[0m"
        echo -e "### START ADD - $(date +%Y%m%d)_$(date +%H%M)" >> $1
        cat ${THIS_DIR}/$1 >> $1
        echo -e "### END ADD - $(date +%Y%m%d)_$(date +%H%M)" >> $1
    else
        # It doesn't exist, so copy the dotfile to the home directory
        echo -e "Copying to home directory: \e[1;34m$1\e[0m"
        cp ${THIS_DIR}/$1 $1
    fi
}

# Link to this file from the home directory
function linkDotFile {
    if [[ -e $1 ]]; then
        if [[ -L $1 ]]; then
            # If it's a symlink, simply rm the link
            rm $1
        else 
            # Back up the file just in case
            echo -e "Backing up: \e[1;34m$1\e[0m"
            mv $1 ${THIS_DIR}/backups/$(date +%Y%m%d)_$(date +%H%M)_$1  > /dev/null 2>&1
        fi
    fi

    # Finally create the symlink
    echo -e "Symlinking: \e[1;32m${THIS_DIR}/$1\e[0m"
    ln -s ${THIS_DIR}/$1
}

THIS_DIR=$PWD
cd ~

catDotFile fileDoesNotExistInHomeDir.txt
catDotFile fileDoesExistInHomeDir.txt

linkDotFile .linkFile
linkDotFile .linkDir

# we want to link these
#linkDotFile .vimrc
#linkDotFile .vim

# but we append to these so as to not overwrite the contents
#catDotFile .bash_aliases
#catDotFile .bashrc
#catDotFile .bash_profile
