#!/bin/bash
mkdir -p $HOME/goinfre/.tmp_francinette
if ls -l $HOME/goinfre/francinette-image | grep "francinette.tar" &> /dev/null; then
    mv /home/$USER/goinfre/francinette-image/francinette.tar /home/$USER/goinfre/.tmp_francinette/
fi
