#!/bin/sh

case "$1" in
	*.png | *.jpg | *.jpeg)
		img2txt "$1"
		;;
	*.pdf)
		pdftotext "$1" -
		;;
	*.tar*)
		tar tf "$1"
		;;
	*.zip)
		unzip -l "$1"
		;;
	*.rar)
		unrar l "$1"
		;;
	*.7z)
		7z l "$1"
		;;
	*)
		highlight --out-format=ansi -Vn "$1" || cat "$1"
		;;
esac
