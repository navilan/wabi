#!/usr/bin/env bash
ND=$(yabai -m query --displays | jq 'length')

CDIR=$(dirname -- "$( readlink -f -- "$0"; )"; );
d1=$(sh $CDIR/display-index.sh 0)
d2=$(sh $CDIR/display-index.sh 1)
d3=$(sh $CDIR/display-index.sh 2)
d4=$(sh $CDIR/display-index.sh 3)

if [ "$ND" -eq 1 ]; then D1=$d1; D2=$d1; D3=$d1; D4=$d1; D5=$d1; echo "Balancing spaces: displays=$ND [$D1, $D2, $D3, $D4, $D5]"; fi
if [ "$ND" -eq 2 ]; then D1=$d1; D2=$d2; D3=$d1; D4=$d1; D5=$d2; echo "Balancing spaces: displays=$ND [$D1, $D2, $D3, $D4, $D5]"; fi
if [ "$ND" -eq 3 ]; then D1=$d2; D2=$d3; D3=$d1; D4=$d1; D5=$d1; echo "Balancing spaces: displays=$ND [$D1, $D2, $D3, $D4, $D5]"; fi
# iPad on the right
if [ "$ND" -eq 4 ]; then D1=$d1; D2=$d2; D3=$d3; D4=$d4; D5=$d4; echo "Balancing spaces: displays=$ND [$D1, $D2, $D3, $D4, $D5]"; fi


echo "$d1, $d2, $d3, $d4, $d5", $ND
echo "$D1, $D2, $D3, $D4, $D5", $ND

# yabai -m space --focus s10 && yabai -m space --display $D3 # Unused
# echo "Moving space s9"
# yabai -m space --focus s9  && yabai -m space --display $D5 # Unused

# echo "Moving space s8"
# yabai -m space --focus s8  && yabai -m space --display $D4 # Untagged

# echo "Moving space s7"
# sh $CDIR/wp.sh
# yabai -m space --focus s7  && yabai -m space --display $D3 # Spotify

# echo "Moving space s6"
# sh $CDIR/wp.sh
# yabai -m space --focus s6  && yabai -m space --display $D1 # kitty

# echo "Moving space s5"
# sh $CDIR/wp.sh
# yabai -m space --focus s5  && yabai -m space --display $D1 # Safari
# sh $CDIR/wp.sh

# echo "Moving space s4"
# yabai -m space --focus s4  && yabai -m space --display $D1 # Chrome

# echo "Moving space s3"
# sh $CDIR/wp.sh
# yabai -m space --focus s3  && yabai -m space --display $D2
# sh $CDIR/wp.sh

# echo "Moving space s2"
# yabai -m space --focus s2  && yabai -m space --display $D2 # VSCode
# sh $CDIR/wp.sh


# echo "Moving space s1"
# yabai -m space --focus s1  && yabai -m space --display $D2 # Emacs
# sh $CDIR/wp.sh


declare -A label_to_display
label_to_display["s1"]="$D2"
label_to_display["s2"]="$D2"
label_to_display["s3"]="$D3"
label_to_display["s4"]="$D3"
label_to_display["s5"]="$D3"
label_to_display["s6"]="$D2"
label_to_display["s7"]="$D3"
label_to_display["s8"]="$D1"
label_to_display["s9"]="$D2"
label_to_display["s10"]="$D3"

# Loop through the labels
for label in "${!label_to_display[@]}"; do
  display=${label_to_display[$label]}


  yabai -m space --focus $label &> /dev/null
  yabai -m space --focus $label &> /dev/null
  yabai -m space --focus $label


  echo "Trying to focus on space $label and moving it to display $display"

  yabai -m query --spaces | jq -e --arg lbl "$label" --arg d "$display" '.[] | select(."has-focus" == true) | .label == $lbl and .display != $d'

  # If jq returns true (both conditions met), execute the yabai commands
  if [ $? -eq 0 ]; then
    echo "Focusing on space $label and moving it to display $display"
    yabai -m space --focus $label && yabai -m space --display $display
  fi


  # Uncomment the line below to print what the script is doing
done
