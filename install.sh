#!/bin/bash

if [ $( ls -a $HOME | grep -w "\.env" | wc -l) -gt 0 ]; then
    echo "copying bashrc to .env"
    cp -r ./root/ $HOME/.env/
else
    echo "creating directory and copying bashrc into it"
    mkdir $HOME/.env
    cp -r ./root/ $HOME/.env/
fi
