#!/usr/bin/zsh 
# This is a zsh script; not .R
# ./all_three.R

./date.sh

./update_old_packages.R
./update_packages.R
./update_tinytex.R
