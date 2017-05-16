#!/bin/bash
cat /proc/cpuinfo | grep Hardware | awk '{print $3}'
