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
sed -i 's/xmame52\/xmame.SDL.52/sm_bridge\/romset.52/g' /media/data/local/home/.simplemenu/section_groups/*.ini
sed -i 's/xmame69\/xmame.SDL.69/sm_bridge\/romset.69/g' /media/data/local/home/.simplemenu/section_groups/*.ini
sed -i 's/xmame84\/xmame.SDL.84/sm_bridge\/romset.84/g' /media/data/local/home/.simplemenu/section_groups/*.ini
sed -i 's/xmame52\/romset.52.sh/sm_bridge\/romset.52/g' /media/data/local/home/.simplemenu/section_groups/*.ini
sed -i 's/xmame69\/romset.69.sh/sm_bridge\/romset.69/g' /media/data/local/home/.simplemenu/section_groups/*.ini
sed -i 's/xmame84\/romset.84.sh/sm_bridge\/romset.84/g' /media/data/local/home/.simplemenu/section_groups/*.ini

dialog --msgbox 'Installation completed.' 8 32

# Disactivate the console on framebuffer
echo 0 > /sys/devices/virtual/vtconsole/vtcon1/bind
