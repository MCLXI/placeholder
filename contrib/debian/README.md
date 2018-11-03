
Debian
====================
This directory contains files used to package HCASHd/HCASH-qt
for Debian-based Linux systems. If you compile HCASHd/HCASH-qt yourself, there are some useful files here.

## HCASH: URI support ##


HCASH-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install HCASH-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your HCASHqt binary to `/usr/bin`
and the `../../share/pixmaps/HCASH128.png` to `/usr/share/pixmaps`

HCASH-qt.protocol (KDE)

