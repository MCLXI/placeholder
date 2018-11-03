#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

HCASHD=${HCASHD:-$SRCDIR/HCASHd}
HCASHCLI=${HCASHCLI:-$SRCDIR/HCASH-cli}
HCASHTX=${HCASHTX:-$SRCDIR/HCASH-tx}
HCASHQT=${HCASHQT:-$SRCDIR/qt/HCASH-qt}

[ ! -x $HCASHD ] && echo "$HCASHD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($HCASHCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for HCASHd if --version-string is not set,
# but has different outcomes for HCASH-qt and HCASH-cli.
echo "[COPYRIGHT]" > footer.h2m
$HCASHD --version | sed -n '1!p' >> footer.h2m

for cmd in $HCASHD $HCASHCLI $HCASHTX $HCASHQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
