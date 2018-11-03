#!/bin/bash
# create multiresolution windows icon
#mainnet
ICON_SRC=../../src/qt/res/icons/HCASH.png
ICON_DST=../../src/qt/res/icons/HCASH.ico
convert ${ICON_SRC} -resize 16x16 HCASH-16.png
convert ${ICON_SRC} -resize 32x32 HCASH-32.png
convert ${ICON_SRC} -resize 48x48 HCASH-48.png
convert ${ICON_SRC} -resize 256x256 HCASH-256.png
convert HCASH-16.png HCASH-32.png HCASH-48.png HCASH-256.png ${ICON_DST}
#testnet
ICON_SRC=../../src/qt/res/icons/HCASH_testnet.png
ICON_DST=../../src/qt/res/icons/HCASH_testnet.ico
convert ${ICON_SRC} -resize 16x16 HCASH-16.png
convert ${ICON_SRC} -resize 32x32 HCASH-32.png
convert ${ICON_SRC} -resize 48x48 HCASH-48.png
convert ${ICON_SRC} -resize 256x256 HCASH-256.png
convert HCASH-16.png HCASH-32.png HCASH-48.png HCASH-256.png ${ICON_DST}
rm HCASH-16.png HCASH-32.png HCASH-48.png HCASH-256.png
