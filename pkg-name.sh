#! /bin/bash

	cd /aaa

	apt download kubuntu-desktop
	dpkg -e kubuntu-desktop*
	cd DEBIAN
	echo '#!/bin/bash' > aa
	echo -n 'apt install -y ' >> aa
 	grep Depends control | sed 's/,//g' | sed 's/Depends://' | sed 's/kubuntu-settings-desktop//' | sed 's/plymouth-theme-kubuntu-logo//' | sed 's/plymouth-theme-kubuntu-text//' | sed 's/ubuntu-release-upgrader-qt//' >> aa
	grep Recommends control | sed 's/,//g' | sed 's/Recommends://' | sed 's/kubuntu-wallpapers//' | sed 's/kubuntu-web-shortcuts//' | sed 's/libreoffice-calc//' | sed 's/libreoffice-impress//' | sed 's/libreoffice-kf5//' | sed 's/libreoffice-plasma//' | sed 's/libreoffice-style-breeze//' | sed 's/libreoffice-writer//' | sed 's/firefox//' >> aa
	# echo -n 'apt-get -y install ' >> aa
	echo -n ' gdm3 linux-firmware snapd cloud-initramfs-growroot ' >> aa
	echo -n ' oem-config-gtk ubiquity-frontend-gtk ubiquity-slideshow-ubuntu yaru-theme-unity yaru-theme-icon yaru-theme-gtk aptdaemon ' >> aa
	echo -n 'grub-efi-arm64 initramfs-tools' >> aa
	cd /
	/bin/bash /aaa/DEBIAN/aa
 

apt install -y \
	kde-plasma-desktop \
	linux-firmware \
	cloud-initramfs-growroot \
	initramfs-tools \
 	oem-config-prepare \
	grub-efi-arm64
