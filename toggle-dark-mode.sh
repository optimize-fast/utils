#!/bin/bash

THEME=`gsettings get org.gnome.desktop.interface gtk-theme`
if [ $THEME == "'Adwaita'" ]
then
	echo Setting dark mode
	gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
else
	echo Setting light mode
	gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
fi
