#!/bin/bash

TEXNAME=$1
DPI=$2
LATEXEXE=$(which latex)
DVIPNG=$(which dvipng)

if [ -z "$TEXNAME" ]
then
	echo "Usage: tex2png [name:string] [dpi:integer]";
	exit 1;
fi

if [ -z "$DPI" ]
then
	echo "Usage tex2png [name:string] [dpi:integer]";
	exit 1;
fi

if [ -z "$LATEXEXE" ]
then
	echo "Latex command not found!";
	exit 1;
fi

if [ -z "$DVIPNG" ]
then
	echo "dvipng command not found!";
	exit 1;
fi

$LATEXEXE $TEXNAME.tex

$DVIPNG -q -T tight -bg Transparent -D 300 -o  $TEXNAME.png $TEXNAME.dvi