#!/usr/bin/env bash

# Balance spaces
ND=$(yabai -m query --displays | jq 'length')
# yabai create spaces
NUM_SPACES=9
SS=$(yabai -m query --spaces | jq 'length')
NS=$(("$NUM_SPACES"-"$SS"))
echo "Spaces $SS difference $NS"
while [ $NS -lt 0 ]
do
  yabai -m space "$SS" --destroy
  NS=$(("$NS"+1))
  echo "Destoryed space $SS. Remaining: $NS"
  SS=$(("$SS"-1))
done
while  [ $NS -gt 0 ]
do
  echo "Creating space"
  yabai -m space --create
  NS=$(("$NS"-1))
done

yabai -m space 1  --label s1
yabai -m space 2  --label s2
yabai -m space 3  --label s3
yabai -m space 4  --label s4
yabai -m space 5  --label s5
yabai -m space 6  --label s6
yabai -m space 7  --label s7
yabai -m space 8  --label s8
yabai -m space 9  --label s9


yabai -m space 1  --layout bsp
yabai -m space 2  --layout bsp
yabai -m space 3  --layout bsp
yabai -m space 4  --layout bsp
yabai -m space 5  --layout bsp
yabai -m space 6  --layout bsp
yabai -m space 7  --layout bsp
yabai -m space 8  --layout bsp
yabai -m space 9  --layout bsp
# Unused right now
# yabai -m space 10  --label s10

CDIR=$(dirname -- "$( readlink -f -- "$0"; )"; );
sh "$CDIR/balancer.sh"
sh "$CDIR/balancer.sh"
