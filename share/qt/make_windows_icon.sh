#!/bin/bash
# create multiresolution windows icon
#mainnet
ICON_SRC=../../src/qt/res/icons/GLPM.png
ICON_DST=../../src/qt/res/icons/GLPM.ico
convert ${ICON_SRC} -resize 16x16 GLPM-16.png
convert ${ICON_SRC} -resize 32x32 GLPM-32.png
convert ${ICON_SRC} -resize 48x48 GLPM-48.png
convert ${ICON_SRC} -resize 256x256 GLPM-256.png
convert GLPM-16.png GLPM-32.png GLPM-48.png GLPM-256.png ${ICON_DST}
#testnet
ICON_SRC=../../src/qt/res/icons/GLPM_testnet.png
ICON_DST=../../src/qt/res/icons/GLPM_testnet.ico
convert ${ICON_SRC} -resize 16x16 GLPM-16.png
convert ${ICON_SRC} -resize 32x32 GLPM-32.png
convert ${ICON_SRC} -resize 48x48 GLPM-48.png
convert ${ICON_SRC} -resize 256x256 GLPM-256.png
convert GLPM-16.png GLPM-32.png GLPM-48.png GLPM-256.png ${ICON_DST}
rm GLPM-16.png GLPM-32.png GLPM-48.png GLPM-256.png
