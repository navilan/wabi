.[] |
select(.minimized != 1) |
"yabai -m window \(.id) --display \(.display) --space \(.space) --move abs:\(.frame.x):\(.frame.y) --resize abs:\(.frame.w):\(.frame.h)"
