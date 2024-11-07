#!/bin/bash

RC_FILE="$HOME/.zshrc"
MY_PATH="$HOME/goinfre"

#if ! grep "francinette-image" "$RC_FILE" &> /dev/null; then
#printf "\nif ! systemctl status docker | grep "running" &> /dev/null; then" "$MY_PATH" >> "$RC_FILE"
#printf "\n\t\techo \"[Francinette] Starting Docker...\"" "$MY_PATH" >> "$RC_FILE"
#printf "\n\t\tsleep 1" "$MY_PATH" >> "$RC_FILE"
#printf "\n\t\texec \"$SHELL\"" "$MY_PATH" >> "$RC_FILE"
#printf "\nfi" "$MY_PATH" >> "$RC_FILE"
#
#printf "\nif ! docker image ls | grep "francinette-image" &> /dev/null; then" "$MY_PATH" >> "$RC_FILE"
#printf "\n\t\techo \"[Francinette] Loading the docker container\"" "$MY_PATH" >> "$RC_FILE"
#printf "\n\t\tdocker load < %s/francinette-image/francinette.tar" "$MY_PATH" >> "$RC_FILE"
#printf "\n\t\texec \"$SHELL\"" "$MY_PATH" >> "$RC_FILE"
#printf "\nfi" "$MY_PATH" >> "$RC_FILE"
#
#printf "\nif ! docker ps | grep \"francinette-image\" &> /dev/null; then" "$MY_PATH" >> "$RC_FILE"
#printf "\n\tif docker run -d -i -v /home:/home -v /goinfre:/goinfre -v /sgoinfre:/sgoinfre -v %s/francinette-image/logs:/francinette/logs-t --name run-paco francinette-image /bin/bash 2>&1 | grep \"already\" &> /dev/null; then" "$MY_PATH" >> "$RC_FILE"
#printf "\n\t\tdocker start run-paco" "$MY_PATH" >> "$RC_FILE"
#printf "\n\tfi" "$MY_PATH" >> "$RC_FILE"
#printf "\nfi" "$MY_PATH" >> "$RC_FILE"
#fi

if ! grep "francinette-image" "$RC_FILE" &> /dev/null; then
printf "\nif ! systemctl status docker | grep "running" &> /dev/null; then" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\techo \"[Francinette] Starting Docker...\"" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\tsleep 1" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\texec \"$SHELL\"" "$MY_PATH" >> "$RC_FILE"
printf "\nfi" "$MY_PATH" >> "$RC_FILE"

printf "\nif ! docker image ls | grep "francinette-image" &> /dev/null; then" "$MY_PATH" >> "$RC_FILE"
printf "\n\tif docker image ls 2>&1 | grep permission &> /dev/null; then" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\techo \"[Francinette] Permission Error\"" "$MY_PATH" >> "$RC_FILE"
printf "\n\telse" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\tif ! [ -f %s/francinette-image/francinette.tar ] || docker load < %s/francinette-image/francinette.tar 2>&1 | grep \"no such file\"  &> /dev/null; then" "$MY_PATH" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\t\techo \"[Francinette] Error width file \"francinette.tar\"\"" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\t\tdocker build -t francinette-image %s/francinette-image" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\t\tdocker image save francinette-image > %s/francinette-image/francinette.tar" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\telse" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\t\techo \"[Francinette] Loading the docker container\"" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\t\tdocker load < %s/francinette-image/francinette.tar" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\tfi" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\texec \"$SHELL\"" "$MY_PATH" >> "$RC_FILE"
printf "\n\tfi" "$MY_PATH" >> "$RC_FILE"
printf "\nfi" "$MY_PATH" >> "$RC_FILE"

printf "\nif ! docker ps | grep \"francinette-image\" &> /dev/null; then" "$MY_PATH" >> "$RC_FILE"
printf "\n\tif docker run -d -i -v /home:/home -v /goinfre:/goinfre -v /sgoinfre:/sgoinfre -v %s/francinette-image/logs:/francinette/logs-t --name run-paco francinette-image /bin/bash 2>&1 | grep \"already\" &> /dev/null; then" "$MY_PATH" >> "$RC_FILE"
printf "\n\t\tdocker start run-paco" "$MY_PATH" >> "$RC_FILE"
printf "\n\tfi" "$MY_PATH" >> "$RC_FILE"
printf "\nfi" "$MY_PATH" >> "$RC_FILE"
fi


if ! grep "francinette=" "$RC_FILE" &> /dev/null; then
	printf "\nalias francinette=%s/francinette-image/run.sh\n" "$MY_PATH" >> "$RC_FILE"
fi

if ! grep "paco=" "$RC_FILE" &> /dev/null; then
	printf "\nalias paco=%s/francinette-image/run.sh\n" "$MY_PATH" >> "$RC_FILE"
fi

WHITE='\033[0;37m' 
BLUE='\033[0;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
BWhite='\033[1;37m' 
NC='\033[0m'
echo -e "${BLUE}[Francinette] ${WHITE}zshrc params installed"
