#!/bin/bash
ip=$1

if ping -c 1 $ip &> /dev/null
then
  echo 1
else
  echo 0
fi
