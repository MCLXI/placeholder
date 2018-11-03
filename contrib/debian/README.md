
Debian
====================
This directory contains files used to package GLPMd/GLPM-qt
for Debian-based Linux systems. If you compile GLPMd/GLPM-qt yourself, there are some useful files here.

## GLPM: URI support ##


GLPM-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install GLPM-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your GLPMqt binary to `/usr/bin`
and the `../../share/pixmaps/GLPM128.png` to `/usr/share/pixmaps`

GLPM-qt.protocol (KDE)

