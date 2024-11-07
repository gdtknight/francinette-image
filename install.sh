#!/bin/bash
WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m'
MY_PATH=$HOME/goinfre

if ! ls -l $MY_PATH | grep "francinette-image" &> /dev/null; then
	git clone https://github.com/WaRtr0/francinette-image.git $MY_PATH/francinette-image
fi

chmod +x $MY_PATH/francinette-image/run.sh

if ! ls -l $MY_PATH/francinette-image | grep "francinette.tar" &> /dev/null; then
	if hostname | grep "42lyon.fr" &> /dev/null; then
 		if ls -l /sgoinfre/goinfre/Perso/mmorot/share | grep "francinette.tar" &> /dev/null; then
   			echo -e "${BLUE}[Francinette] ${WHITE}Copy of francinette.tar (${BWhite}/sgoinfre/goinfre/Perso/mmorot/share${WHITE})"
      			cp /sgoinfre/goinfre/Perso/mmorot/share/francinette.tar $MY_PATH/francinette-image/
	 		echo -e "${BLUE}[Francinette] ${WHITE}Copy ${GREEN}OK"
   		fi
 	fi
fi

if ! ls -l $MY_PATH/francinette-image | grep "francinette.tar" &> /dev/null; then
	docker build -t francinette-image $MY_PATH/francinette-image
	docker image save francinette-image > $MY_PATH/francinette-image/francinette.tar
fi
if ls -l $MY_PATH/francinette-image | grep "francinette.tar" &> /dev/null; then
	docker load < $MY_PATH/francinette-image/francinette.tar
fi

source $MY_PATH/francinette-image/utils/install_zshrc.sh


echo -e "${BLUE}[Francinette] ${GREEN}Installation completed!\n${WHITE}Use the ${BWhite}paco${WHITE} or ${BWhite}francinette${WHITE} commands in your project folder."

exec "$SHELL"

