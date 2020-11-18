#!/bin/bash

function linkDotFile {
  if [[ -e $1 ]]; then
    echo -e "Backing up: \e[1;34m$1\e[0m"
    mv $1 ${THIS_DIR}/backups/$(date +%Y%m%d)_$(date +%H%M)_$1  > /dev/null 2>&1
  fi

  echo -e "Symlinking: \e[1;32m${THIS_DIR}/$1\e[0m"
  ln -s ${THIS_DIR}/$1
}

THIS_DIR=$PWD
cd ~
linkDotFile .vimrc
linkDotFile .vim
linkDotFile .bash_aliases
linkDotFile .bashrc
linkDotFile .bash_profile

