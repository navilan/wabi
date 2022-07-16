#!/usr/bin/env bash

AH="id:88A3AD84-A18A-476E-A870-D13EF1B68678 res:3840x2160 hz:60 color_depth:7 scaling:off origin:(0,0) degree:"
AV="id:88A3AD84-A18A-476E-A870-D13EF1B68678 res:2160x3840 hz:60 color_depth:7 scaling:off origin:(0,0) degree:"
BH="id:6D9AFBFC-EA2C-40F0-95E5-764F18DD2024 res:1920x1080 hz:60 color_depth:8 scaling:off origin:(3840,460) degree:"
BV="id:6D9AFBFC-EA2C-40F0-95E5-764F18DD2024 res:1080x1920 hz:60 color_depth:8 scaling:off origin:(3840,460) degree:"
CH="id:5BACA656-922C-430B-9EBC-65772ABF7ED4 res:1920x1080 hz:60 color_depth:8 scaling:off origin:(4920,585) degree:"
CV="id:5BACA656-922C-430B-9EBC-65772ABF7ED4 res:1080x1920 hz:60 color_depth:8 scaling:off origin:(4920,585) degree:"
DH="id:85642FBE-82E5-46B7-ABB1-A41FBB8ACCC9 res:2160x3840 hz:60 color_depth:7 scaling:off origin:(6000,0) degree:"
DV="id:85642FBE-82E5-46B7-ABB1-A41FBB8ACCC9 res:3440x2160 hz:60 color_depth:7 scaling:off origin:(6000,0) degree:"


IDX=${1:-0}
ROT=${2:-0}


M=$AH

if test $((IDX)) -eq 0 && (test $((ROT)) -eq 0 || test $((ROT)) -eq 360) ; then M=$AH; fi
if test $((IDX)) -eq 0 && (test $((ROT)) -eq 90 || test $((ROT)) -eq 270) ; then M=$AV; fi
if test $((IDX)) -eq 1 && (test $((ROT)) -eq 0 || test $((ROT)) -eq 360) ; then M=$BH; fi
if test $((IDX)) -eq 1 && (test $((ROT)) -eq 90 || test $((ROT)) -eq 270) ; then M=$BV; fi
if test $((IDX)) -eq 2 && (test $((ROT)) -eq 0 || test $((ROT)) -eq 360) ; then M=$CH; fi
if test $((IDX)) -eq 2 && (test $((ROT)) -eq 90 || test $((ROT)) -eq 270) ; then M=$CV; fi
if test $((IDX)) -eq 3 && (test $((ROT)) -eq 0 || test $((ROT)) -eq 360) ; then M=$DH; fi
if test $((IDX)) -eq 3 && (test $((ROT)) -eq 90 || test $((ROT)) -eq 270) ; then M=$DV; fi

ARG="$M$ROT"

echo \"$ARG\"
displayplacer "$ARG"
