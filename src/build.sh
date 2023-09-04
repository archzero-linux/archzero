#!/bin/bash

if [[ $1 == "" ]]
then
  echo "$0 [args]"
  echo "args:"
  echo "  -n (nonmajor): builds with name archzero- + date"
  echo "  -b (buildname): only done if -nonmajor not selected"
fi

if [[ $1 == "-n" ]]
then
  mkdir tmp
  ISONAME=$(date +archzero-%Y-%m-%d)
  echo "Building $ISONAME..."
  mkarchiso -v -w ./tmp -o ./build/$ISONAME .
  rm -ri ./tmp
fi

if [[ $1 == "-b" ]]
then
  mkdir tmp
  ISONAME="archzero-live-$2"
  echo "Building $ISONAME..."
  mkarchiso -v -w ./tmp -o ./build/$ISONAME .
  rm -ri ./tmp
fi
