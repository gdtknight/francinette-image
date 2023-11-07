#!/bin/bash

cd $HOME
git clone https://github.com/WaRtrO89/francinette-image.git
cd $HOME/francinette-image
chmod +x run.sh
docker build -t francinette-image $HOME/francinette-image

RC_FILE="$HOME/.zshrc"

if ! grep "francinette-image" "$RC_FILE" &> /dev/null; then
printf "\nif ! docker ps | grep "francinette-image" &> /dev/null; then" "$HOME" >> "$RC_FILE"
printf "\n\tdocker run -d -i -v /home:/home -t --name run-paco francinette-image /bin/bash" "$HOME" >> "$RC_FILE"
printf "\nfi" "$HOME" >> "$RC_FILE"
fi

if ! grep "francinette=" "$RC_FILE" &> /dev/null; then
	echo "francinette alias not present"
	printf "\nalias francinette=%s/francinette-image/run.sh\n" "$HOME" >> "$RC_FILE"
fi

if ! grep "paco=" "$RC_FILE" &> /dev/null; then
	echo "Short alias not present. Adding it"
	printf "\nalias paco=%s/francinette-image/run.sh\n" "$HOME" >> "$RC_FILE"
fi
