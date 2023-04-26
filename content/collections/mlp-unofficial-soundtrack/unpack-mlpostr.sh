#!/bin/sh

# Unpacks the music from the My Little Pony OST Repository by CaptainComedy

# Requirements:
# * POSIX-compatible shell and system utilities (sh, mv, cp, etc.)
# * "unzip" program from Info-ZIP <http://infozip.sourceforge.net/UnZip.html>
# * "unrar" program from RARLAB <https://www.rarlab.com/rar_add.htm>

# Usage:
# Set the SOURCE_DIR and DEST_DIR variables as needed and run with sh.
# Set the UNZIP and UNRAR variables if the programs are not in your PATH.

# License:
# Dedicated to the public domain under
# Creative Commons CC0 1.0 Universal
# <https://creativecommons.org/publicdomain/zero/1.0/>

set -e

SOURCE_DIR='My Little Pony OST Repository'
DEST_DIR='My Little Pony OST Repository (Unpacked)'
UNZIP='unzip'
UNRAR='unrar'

mkdir -p "$DEST_DIR"

# Mobile Game
$UNZIP -d "$DEST_DIR" "$SOURCE_DIR/MLP Friendship is Magic (Mobile Game OST).zip"

# Personal Requests
cp -a "$SOURCE_DIR/Personal Requests" "$DEST_DIR"

# Season 1
mkdir "$DEST_DIR/Season 1"

$UNRAR x "$SOURCE_DIR/Season 1/Apple Lossless - MLP Friendship is Magic (Season 1) - Disc 1.rar" "$DEST_DIR/Season 1"
$UNRAR x "$SOURCE_DIR/Season 1/Apple Lossless - MLP Friendship is Magic (Season 1) - Discs 2-4.part3.rar" "$DEST_DIR/Season 1"
mv "$DEST_DIR/Season 1/MLP Friendship is Magic (Season 1)" "$DEST_DIR/Season 1/ALAC"

$UNRAR x "$SOURCE_DIR/Season 1/FLAC - MLP Friendship is Magic (Season 1) - Disc 1.rar" "$DEST_DIR/Season 1"
$UNRAR x "$SOURCE_DIR/Season 1/FLAC (fixed) - MLP Friendship is Magic (Season 1) - Discs 2-4.part3.rar" "$DEST_DIR/Season 1"
mv "$DEST_DIR/Season 1/MLP Friendship is Magic (Season 1)" "$DEST_DIR/Season 1/FLAC"

$UNRAR x "$SOURCE_DIR/Season 1/MP3 - MLP FiM (Season 1) - Disc 1 - Musical Numbers.rar" "$DEST_DIR/Season 1"
$UNRAR x "$SOURCE_DIR/Season 1/MP3 - MLP FiM (Season 1) - Disc 2&3 - Incidental Music.rar" "$DEST_DIR/Season 1"
$UNRAR x "$SOURCE_DIR/Season 1/MP3 - MLP FiM (Season 1) - Disc 4 - Bonus Music.rar" "$DEST_DIR/Season 1"
mv "$DEST_DIR/Season 1/MLP Friendship is Magic (Season 1)" "$DEST_DIR/Season 1/MP3"

mkdir "$DEST_DIR/Season 1/MP3ZIP"
$UNZIP -d "$DEST_DIR/Season 1/MP3ZIP" "$SOURCE_DIR/Season 1/MP3 - Disc 01.zip"
$UNZIP -d "$DEST_DIR/Season 1/MP3ZIP" "$SOURCE_DIR/Season 1/MP3 - Disc 02 and 03.zip"
$UNZIP -d "$DEST_DIR/Season 1/MP3ZIP" "$SOURCE_DIR/Season 1/MP3 - Disc 04.zip"
mv \
	"$DEST_DIR/Season 1/MP3ZIP/Disc 01/MLP Friendship is Magic (Season 1)"/* \
	"$DEST_DIR/Season 1/MP3ZIP/Disc 02 and 03/MLP Friendship is Magic (Season 1)"/* \
	"$DEST_DIR/Season 1/MP3ZIP/Disc 04/MLP Friendship is Magic (Season 1)"/* \
	"$DEST_DIR/Season 1/MP3ZIP"
rm -r "$DEST_DIR/Season 1/MP3ZIP/Disc 01" "$DEST_DIR/Season 1/MP3ZIP/Disc 02 and 03" "$DEST_DIR/Season 1/MP3ZIP/Disc 04"

# Compare each disc because the "Read Me.txt" files differ
if
	diff -r "$DEST_DIR/Season 1/MP3/Disc 01 - Musical Numbers" \
		"$DEST_DIR/Season 1/MP3ZIP/Disc 01 - Musical Numbers" \
	&& diff -r "$DEST_DIR/Season 1/MP3/Disc 02 - Incidental Music 1" \
		"$DEST_DIR/Season 1/MP3ZIP/Disc 02 - Incidental Music 1" \
	&& diff -r "$DEST_DIR/Season 1/MP3/Disc 03 - Incidental Music 2" \
		"$DEST_DIR/Season 1/MP3ZIP/Disc 03 - Incidental Music 2" \
	&& diff -r "$DEST_DIR/Season 1/MP3/Disc 04 - Bonus Music" \
		"$DEST_DIR/Season 1/MP3ZIP/Disc 04 - Bonus Music"
then
	mv "$DEST_DIR/Season 1/MP3/Read Me.txt" "$DEST_DIR/Season 1/MP3/Read Me [RAR].txt"
	mv "$DEST_DIR/Season 1/MP3ZIP/Read Me.txt" "$DEST_DIR/Season 1/MP3/Read Me [ZIP].txt"
	rm -r "$DEST_DIR/Season 1/MP3ZIP"
else
	echo "Season 1 MP3 from RAR and ZIP differ"
	exit 1
fi

# Season 2
mkdir "$DEST_DIR/Season 2"

$UNRAR x "$SOURCE_DIR/Season 2/Season 2 - ALAC - Disc 01.rar" "$DEST_DIR/Season 2"
$UNRAR x "$SOURCE_DIR/Season 2/Season 2 - ALAC - Disc 02+03+04.part4.rar" "$DEST_DIR/Season 2"
mv "$DEST_DIR/Season 2/MLP Friendship is Magic (Season 2)" "$DEST_DIR/Season 2/ALAC"

$UNRAR x "$SOURCE_DIR/Season 2/Season 2 - FLAC - Disc 01.rar" "$DEST_DIR/Season 2"
$UNRAR x "$SOURCE_DIR/Season 2/Season 2 - FLAC - Disc 02+03.part3.rar" "$DEST_DIR/Season 2"
$UNRAR x "$SOURCE_DIR/Season 2/Season 2 - FLAC - Disc 04.rar" "$DEST_DIR/Season 2"
mv "$DEST_DIR/Season 2/MLP Friendship is Magic (Season 2)" "$DEST_DIR/Season 2/FLAC"

$UNRAR x "$SOURCE_DIR/Season 2/Season 2 - MP3 (RAR) - Disc 01 - Musical Numbers.rar" "$DEST_DIR/Season 2"
$UNRAR x "$SOURCE_DIR/Season 2/Season 2 - MP3 (RAR) - Disc 02 - Incidental Music 1.rar" "$DEST_DIR/Season 2"
$UNRAR x "$SOURCE_DIR/Season 2/Season 2 - MP3 (RAR) - Disc 03 - Incidental Music 2.rar" "$DEST_DIR/Season 2"
$UNRAR x "$SOURCE_DIR/Season 2/Season 2 - MP3 (RAR) - Disc 04 - Bonus Music.rar" "$DEST_DIR/Season 2"
mv "$DEST_DIR/Season 2/MLP Friendship is Magic (Season 2)" "$DEST_DIR/Season 2/MP3"

$UNZIP -d "$DEST_DIR/Season 2" "$SOURCE_DIR/Season 2/Season 2 - MP3 (ZIP) - Disc 01.zip"
$UNZIP -d "$DEST_DIR/Season 2" "$SOURCE_DIR/Season 2/Season 2 - MP3 (ZIP) - Disc 02.zip"
$UNZIP -d "$DEST_DIR/Season 2" "$SOURCE_DIR/Season 2/Season 2 - MP3 (ZIP) - Disc 03.zip"
$UNZIP -d "$DEST_DIR/Season 2" "$SOURCE_DIR/Season 2/Season 2 - MP3 (ZIP) - Disc 04.zip"
mv "$DEST_DIR/Season 2/MLP Friendship is Magic (Season 2)" "$DEST_DIR/Season 2/MP3ZIP"

if diff -r "$DEST_DIR/Season 2/MP3" "$DEST_DIR/Season 2/MP3ZIP"; then
	rm -r "$DEST_DIR/Season 2/MP3ZIP"
else
	echo "Season 2 MP3 from RAR and ZIP differ"
	exit 1
fi
