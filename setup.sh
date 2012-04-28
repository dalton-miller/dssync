#!/bin/bash
echo "Script will require sudo password, press enter to continue"
read something
if [[ $1 == "install" ]]; then
	mkdir -p ~/.config/bridge/settings
	cp dirlist.conf ~/.config/bridge/settings
	cp archive.conf ~/.config/bridge/settings
	sudo cp ssync.pyc /usr/bin/ssync
	sudo chmod +x /usr/bin/ssync
	cp -R dropbox ~/.config/bridge/settings
	cp archive.sh ~/.config/bridge/settings
	cp extract.sh ~/.config/bridge/settings
	chmod +x ~/.config/bridge/settings/archive.sh
	chmod +x ~/.config/bridge/settings/extract.sh
elif [[ $1 == "remove" ]]; then
	rm -r ~/.config/bridge/settings
	sudo rm /usr/bin/ssync
fi