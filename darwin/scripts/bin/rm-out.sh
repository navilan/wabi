#!/bin/sh
for path in $(git ls-files --others --exclude-standard . | grep -e "\.js$" -e "\.d\.ts" -e "\.d\.ts\.map$" -e "\.js\.map$" -e "\.jsx\.map$" -e "\.jsx$")
do
  rm "$path"
done