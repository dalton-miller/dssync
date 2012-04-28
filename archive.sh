#!/bin/bash

#Source config files
source ~/.config/bridge/settings/dirlist.conf
source ~/.config/bridge/settings/archive.conf

#Remove previous if it exists
if [ -e /tmp/settings.tar.bz2 ]; then
	rm -f /tmp/settings.tar.bz2
elif [ -e /tmp/settings.tar ]; then
	rm -f /tmp/settings.tar
fi

if [ "$all_dotfiles" == "false" ]; then
#Common
tar -cf /tmp/settings.tar "$core" &> /dev/null

#Start DEs
#KDE
if [ -e /usr/bin/kdesu ]; then
	tar --append -f /tmp/settings.tar "$kde" &> /dev/null
fi

#GNOME
if [ -e /usr/bin/gnome-session ]; then
	tar --append -f /tmp/settings.tar "$gnome" &> /dev/null
fi

#Xfce
if [ -e /usr/bin/xfce4-session ]; then
	tar --append -f /tmp/settings.tar "$xfce" &> /dev/null
fi

#LXDE
if [ -e /usr/bin/startlxde ]; then
	tar --append -f /tmp/settings.tar "$lxde" &> /dev/null
fi

#Openbox
if [ -e /usr/bin/openbox-session ]; then
	tar --append -f /tmp/settings.tar "$openbox" &> /dev/null
fi
#End DEs


#Emerald
if [ -e /usr/bin/emerald ]; then
	tar --append -f /tmp/settings.tar "$emerald" &> /dev/null
fi

#Chromium
if [ -e /usr/bin/chromium ]; then
	tar --append -f /tmp/settings.tar "$chromium" &> /dev/null
fi

#Compiz
if [ -e /usr/bin/compiz ]; then
	tar --append -f /tmp/settings.tar "$compiz" &> /dev/null
fi

#Eclipse
if [ -e /usr/bin/eclipse ]; then
	tar --append -f /tmp/settings.tar "$eclipse" &> /dev/null
fi

#Netbeans
if [ -e /usr/bin/netbeans ]; then
	tar --append -f /tmp/settings.tar "$netbeans" &> /dev/null
fi

#Conky
if [ -e /usr/bin/conky ]; then
	tar --append -f /tmp/settings.tar "$conky" &> /dev/null
fi

#Filezilla
if [ -e /usr/bin/conky ]; then
	tar --append -f /tmp/settings.tar "$filezilla" &> /dev/null
fi

#Dosbox
if [ -e /usr/bin/dosbox ]; then
	tar --append -f /tmp/settings.tar "$dosbox" &> /dev/null
fi

#TrueCrypt
if [ -e /usr/bin/truecrypt ]; then
	tar --append -f /tmp/settings.tar "$truecrypt" &> /dev/null
fi

#Vidalia
if [ -e /usr/bin/vidalia ]; then
	tar --append -f /tmp/settings.tar "$vidalia" &> /dev/null
fi

#Miro
if [ -e /usr/bin/miro ]; then
	tar --append -f /tmp/settings.tar "$miro" &> /dev/null
fi
#If all dotfiles is set to true:
else
	tar --append -f /tmp/settings.tar $(ls -d ~/\.*) &> /dev/null
fi


#Compress it
if [ -e /tmp/settings.tar ]; then
	bzip2 /tmp/settings.tar
fi