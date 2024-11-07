#!/bin/bash

MY_PATH=$HOME/goinfre

mkdir -p $MY_PATH/.tmp_francinette

git clone https://github.com/WaRtr0/francinette-image.git $MY_PATH/.tmp_francinette/francinette-image

source $MY_PATH/.tmp_francinette/francinette-image/utils/remove_docker.sh
source $MY_PATH/.tmp_francinette/francinette-image/utils/remove_zshrc.sh

rm -rf $MY_PATH/francinette-image
rm -rf $MY_PATH/.tmp_francinette

WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
echo -e "${BLUE}[Francinette] ${WHITE}Uninstalled ${GREEN}OK"
exec "$SHELL"
