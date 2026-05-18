#!/bin/bash

lxiahome='/home/lxia'

function setup_config() {
    filepath="$lxiahome/$1"
    [ -f "./$filepath" ] && ! [ -f "$filepath" ] && cp "./$filepath" "$filepath"
}

setup_config .gitconfig
setup_config .pip/pip.conf
setup_config .ssh/config
