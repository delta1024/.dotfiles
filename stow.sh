#!/bin/env bash

arg=$@
steam_links=("$HOME/.steampath" "$HOME/.steampid")

if [ -f ${steam_links[0]} ]; then
    rm ${steam_links[0]}
fi

if [ -f ${steam_links[1]} ]; then
    rm ${steam_links[1]}
fi

if [[ -z "$arg" ]]; then
    stow */
else
    stow "$@"
fi


