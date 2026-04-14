#!/bin/bash
find ~ -maxdepth 1 -type f -printf "%s %p\n" 2>/dev/null | sort -nr | head -1
