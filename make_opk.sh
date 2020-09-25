#!/bin/sh
V=`cat v`
OPK_NAME=xmame_sm_bridge_installer_${V}.opk

echo ${OPK_NAME}

# create default.gcw0.desktop
cat > default.gcw0.desktop <<EOF
[Desktop Entry]
Name=xMAME-SM Installer ${V}
Comment=Installer for xMAME-SimpleMenu interface
Exec=install.sh
Terminal=true
Type=Application
StartupNotify=true
Icon=icon
Categories=applications;
EOF

rm sm_bridge.tgz
tar -czf sm_bridge.tgz -C . *.py romset.* v resources

# create opk
FLIST="default.gcw0.desktop"
FLIST="${FLIST} sm_bridge.tgz"
FLIST="${FLIST} icon.png"
FLIST="${FLIST} install.sh"

rm -f ${OPK_NAME}
mksquashfs ${FLIST} releases/${OPK_NAME} -all-root -no-xattrs -noappend -no-exports

cat default.gcw0.desktop
rm -f default.gcw0.desktop

echo ""
echo ${OPK_NAME} created in releases.

scp releases/${OPK_NAME} rg350:/media/data/apps
