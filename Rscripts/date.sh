#!/bin/zsh

#	PURPOSE:		date stamp, used by other .sh scripts (such as ./all_three)
#	USAGE:			./date.sh
#
#    FRI_20May2022
line="-----------------"
echo $line
echo $(date +"%a_%d%b%Y")
echo $line
