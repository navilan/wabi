#!/usr/bin/env bash

# Balance spaces
ND=$(yabai -m query --displays | jq 'length')
# yabai create spaces
NUM_SPACES=10
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
yabai -m space 0  --label s0


yabai -m space s1  --layout stack
yabai -m space s2  --layout stack
yabai -m space s3  --layout stack
yabai -m space s4  --layout stack
yabai -m space s5  --layout stack
yabai -m space s6  --layout stack
yabai -m space s7  --layout stack
yabai -m space s8  --layout stack
yabai -m space s9  --layout stack
yabai -m space s0  --layout stack
# Unused right now
# yabai -m space 10  --label s10

CDIR=$(dirname -- "$( readlink -f -- "$0"; )"; );
sh "$CDIR/balancer.sh"
sh "$CDIR/balancer.sh"
