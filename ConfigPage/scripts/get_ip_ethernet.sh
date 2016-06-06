#! /bin/bash
ip route get 1 | awk '{print $NF;exit}' | tr -d '\n'

