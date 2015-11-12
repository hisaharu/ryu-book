#!/bin/bash

usage() {
  echo "Usage: bash $0 TARGET_DIR"
  echo "Run Ryu-Book Makefile"
  echo ""
  echo "  TARGET_DIR  Target directory containing Makefile for each language"
  echo ""
  exit
}

if [ $# -ne 1 ]
then
    usage
else
    TARGET_DIR=$1
fi

set -e -x

cd ${TARGET_DIR}

# clean previous builds
make clean > /dev/null

# make pdf
make latexpdf > /dev/null

# make epub and mobi
make epub > /dev/null
../kindlegen build/epub/Ryubook.epub > /dev/null

# make html
make html > /dev/null
