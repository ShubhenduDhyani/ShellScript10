#!/bin/bash
echo "Please find below the current disk utilizations"
df -hT
echo "Please find below the memory stats"
free -h | awk '{print $1,$2,$3}'
