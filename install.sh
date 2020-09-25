#!/bin/sh

export DIALOGOPTS="--colors --backtitle \"xMAME SimpleMenu bridge installer"
echo "screen_color = (RED,RED,ON)" > /tmp/dialog_err.rc

TEXTO="\Zb\Z3NOTE\Zn

This program will install the xMAME ROM settings interface for SimpleMenu in your console.

Select \Zb\Z3Yes\Zn and press \Zb\Z3Start\Zn to install."

dialog --defaultno --yes-label 'Yes' --no-label 'Cancel' --yesno "$TEXTO" 15 48
if [ $? -eq 1 ] ; then
	exit 1
fi

clear
echo "Installing..."
mkdir -p /media/data/local/share/xmame/sm_bridge
tar -xzf sm_bridge.tgz -C /media/data/local/share/xmame/sm_bridge
chown -R root:root /media/data/local/share/xmame/sm_bridge

dialog --msgbox 'Installation completed.' 8 32

# Disactivate the console on framebuffer
echo 0 > /sys/devices/virtual/vtconsole/vtcon1/bind
