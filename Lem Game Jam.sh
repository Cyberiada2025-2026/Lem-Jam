#!/bin/sh
printf '\033c\033]0;%s\a' Lem Game Jam
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Lem Game Jam.x86_64" "$@"
