#!/bin/bash
WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

MY_PATH=$HOME/goinfre

if ls -l $MY_PATH | grep "francinette-image" &> /dev/null; then
    mkdir -p $MY_PATH/.tmp_francinette
    git clone https://github.com/WaRtr0/francinette-image.git $MY_PATH/.tmp_francinette/francinette-image

    source $MY_PATH/.tmp_francinette/francinette-image/utils/move_tmp.sh
    source $MY_PATH/.tmp_francinette/francinette-image/utils/remove_docker.sh
    source $MY_PATH/.tmp_francinette/francinette-image/utils/remove_zshrc.sh

    rm -rf $MY_PATH/francinette-image

    mkdir -p $MY_PATH/francinette-image
    mv $MY_PATH/.tmp_francinette/francinette-image/* $MY_PATH/francinette-image/
    if ls -l $MY_PATH/.tmp_francinette | grep "francinette.tar" &> /dev/null; then
        mv $MY_PATH/.tmp_francinette/francinette.tar $MY_PATH/francinette-image/
    fi

    rm -rf $MY_PATH/.tmp_francinette

    source $MY_PATH/francinette-image/install.sh

    
    echo -e "${BLUE}[Francinette] ${WHITE}Updated ${GREEN}OK"
fi
if ! ls -l $MY_PATH | grep "francinette-image" &> /dev/null; then
    echo -e "${BLUE}[Francinette] ${WHITE}Updated ${RED}ERROR (francinette not installed...)"
fi
