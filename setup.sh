#!/bin/bash

THIS_DIR=$PWD
cd ~
mv .vimrc .vimrc_bak > /dev/null 2>&1
mv .vim .vim_bak > /dev/null 2>&1
ln -s ${THIS_DIR}/.vimrc
ln -s ${THIS_DIR}/.vim

