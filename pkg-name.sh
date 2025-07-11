#! /bin/bash

	cd /aaa

	apt download kubuntu-desktop
	dpkg -e kubuntu-desktop*
	cd DEBIAN
	echo '#!/bin/bash' > dependencies.sh
	echo -n 'apt install -y ' >> dependencies.sh
 	grep Depends control | sed 's/,//g' | sed 's/Depends://' | sed 's/kubuntu-settings-desktop//' | sed 's/plymouth-theme-kubuntu-logo//' | sed 's/plymouth-theme-kubuntu-text//' | sed 's/ubuntu-release-upgrader-qt//' >> dependencies.sh
	echo '#!/bin/bash' > recommends.sh
	echo -n 'apt install -y ' >> recommends.sh
	grep Recommends control | sed 's/,//g' | sed 's/Recommends://' | sed 's/kubuntu-wallpapers//' | sed 's/kubuntu-web-shortcuts//' | sed 's/libreoffice-calc//' | sed 's/libreoffice-impress//' | sed 's/libreoffice-kf5//' | sed 's/libreoffice-plasma//' | sed 's/libreoffice-style-breeze//' | sed 's/libreoffice-writer//' | sed 's/firefox//' >> recommends.sh
	echo '#!/bin/bash' > extra.sh
	echo -n 'apt install -y ' >> extra.sh
 	echo -n 'linux-firmware cloud-initramfs-growroot ' >> extra.sh
	echo -n 'oem-config-gtk yaru-theme-unity yaru-theme-icon yaru-theme-gtk aptdaemon ' >> extra.sh
	echo -n 'grub-efi-arm64 initramfs-tools ' >> extra.sh
	cd /
	/bin/bash /aaa/DEBIAN/dependencies.sh
 	/bin/bash /aaa/DEBIAN/recommends.sh
 	/bin/bash /aaa/DEBIAN/extra.sh
 
