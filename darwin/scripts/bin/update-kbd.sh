#!/usr/bin/env bash
wget https://oryx.zsa.io/eqRby/latest/binary -o /tmp/navbase.bin
wally-cli /tmp/navbase.bin
rm /tmp/navbase.bin
