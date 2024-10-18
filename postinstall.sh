#!/bin/bash
echo "Changing grub settings to rotate screen"
sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT="fbcon=rotate:1"/g' /etc/default/grub
sed -i 's/^GRUB_CMDLINE_LINUX=.*/GRUB_CMDLINE_LINUX="video=eDP-1:panel_orientation=right_side_up"/g' /etc/default/grub
update-grub2
echo "Complete"

echo "Add setting to rotate screen in lightdm"
mkdir -p /etc/lightdm/lightdm.conf.d/
cp 20-startup-script.conf /etc/lightdm/lightdm.conf.d/20-startup-script.conf
cp rotate-screen /usr/local/bin/rotate-screen
chmod a+x /usr/local/bin/rotate-screen
echo "Complete"

echo "Add settings to rotate tuochscreen"
cp 21-defaultrotatetouchscreen.conf /etc/X11/xorg.conf.d/21-defaultrotatetouchscreen.conf
echo "Complete"

exit 0
