#!/bin/bash
path=$1
# at first move all files
sudo mv "$1" /usr/share/ca-certificates/mozilla/
sudo c_rehash /usr/share/ca-certificates/mozilla/
