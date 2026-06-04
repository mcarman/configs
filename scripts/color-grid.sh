#!/bin/bash

function colorgrid()
{
    end=250
    for((red=0; red <= end; red+=75)); do
        for((green=0; green <= end; green+=75)); do
            for style in 0 "1;3"; do
                for((blue=0; blue <= end; blue+=5)); do
                    printf "\e[$style;38;2;$red;$green;${blue}mH"
                done
                printf "\e[0m\n"
            done
        done
    done
}
