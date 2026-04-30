#!/bin/bash
# print 256 color pallette

shape='XXXXXXXX'
arry=(0 0 2{,,}{,,}{,,,} 0{,,})
eval arry="${arry[@]/?/\${shape:&\}}"
printf -v shape '%s\n' "${arry[@]//X/  \\e[48;5;%d;38;5;%%%%dm C %%3d \\e[0m}"
declare -ai arry=({0..255})
printf -v shape "$shape" "${arry[@]}"
printf -v shape "$shape" "${arry[@]}"
eval "arry=(${arry[@]/*/\"(&>231\&\&&<244)||((&<17)\&\&(&%8<2))||(&>16\&\&
    &<232)\&\&((&-16)%6*11+(&-16)/6%6*14+(&-16)/36*10)<58?7:16\"})"
printf "$shape" ${arry[@]}
