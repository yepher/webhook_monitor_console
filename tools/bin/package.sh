#!/bin/bash

# This script make a lot of assumptions and has no error handling


BIN_DIR=`dirname "$0"`
cd $BIN_DIR/../..

BASE_DIR=`pwd`

echo "Base Dir: " $BASE_DIR

rm -rf $BASE_DIR/release
mkdir $BASE_DIR/release

cp README.md $BASE_DIR/release/Usage.md

###################
# Build and Package for OSX
###################
echo "Building for OSX"

mkdir $BASE_DIR/release/osx
export GOOS="darwin"

cd $BASE_DIR	
rm -f webhook_monitor_console
go build
mv webhook_monitor_console $BASE_DIR/release/osx


###################
# Build and Package CLI for Linux
###################


echo "Building for Linux"

mkdir $BASE_DIR/release/linux
export GOOS="linux"

cd $BASE_DIR	
rm -f webhook_monitor_console
go build
mv webhook_monitor_console $BASE_DIR/release/linux

##################
# Build and Package for Windows
###################


echo "Building for Windows"

mkdir $BASE_DIR/release/windows
export GOOS="windows"

cd $BASE_DIR	
rm -f webhook_monitor_console.exe
go build
mv webhook_monitor_console.exe $BASE_DIR/release/windows

###################
# Done!!!
###################
echo "Done..."
echo ""
echo "See $BASE_DIR/release for binary files"
open $BASE_DIR/release


