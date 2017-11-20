#!/bin/bash
set -e
set -u
set -o pipefail

while getopts 'lmhxa:' OPTION; do
  case "$OPTION" in
    l) SPEED=1000 ; echo $SPEED "Set Fan Speed to low";;
    m) SPEED=5000 ; echo $SPEED "Set Fan Speed to Medium";;
    h) SPEED=10000; echo $SPEED "Set Fan Speed to High";;
    x) SPEED=16000; echo $SPEED "Set Fan Speed to Max";;
    a) SPEED="$OPTARG"; echo "Fan Speed has been set to: " $OPTARG ;;
    ?)
echo "script usage: $(basename $0) [-l] [-h] [-a somevalue]" >&2
echo "-L = Low Speed "
echo "-M = Medium Speed"
echo "-H = High Speed"
echo "-X = Max Speed"
echo "-A = Custom Value e.g. -a 12500" 
echo "To run ./$(basename $0) -m" 
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

echo $SPEED > /sys/devices/platform/applesmc.768/fan1_min
