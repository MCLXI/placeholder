#!/bin/bash

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

GLPMD=${GLPMD:-$SRCDIR/GLPMd}
GLPMCLI=${GLPMCLI:-$SRCDIR/GLPM-cli}
GLPMTX=${GLPMTX:-$SRCDIR/GLPM-tx}
GLPMQT=${GLPMQT:-$SRCDIR/qt/GLPM-qt}

[ ! -x $GLPMD ] && echo "$GLPMD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
BTCVER=($($GLPMCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for GLPMd if --version-string is not set,
# but has different outcomes for GLPM-qt and GLPM-cli.
echo "[COPYRIGHT]" > footer.h2m
$GLPMD --version | sed -n '1!p' >> footer.h2m

for cmd in $GLPMD $GLPMCLI $GLPMTX $GLPMQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${BTCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
