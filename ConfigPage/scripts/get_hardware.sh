#!/bin/bash
cat /pro/cpuinfo | grep Hardware | awk '{print $3}'
