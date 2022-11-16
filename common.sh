#!/usr/bin/env bash

######################################
#   File: Common.                    #
#   __    __          _              #
#  / / /\ \ \__ _ ___| | ___   _     # 
#  \ \/  \/ / _` / __| |/ | | | |    #
#   \  /\  | (_| \__ |   <| |_| |    #
#    \/  \/ \__,_|___|_|\_\\__, |    #
#                          |___/     #
#   https://github.com/waskaczek     #
######################################
RESTORE='\033[0m'

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
USER_NAME=$(logname)

DOTFILES_PATH=$DIR

function log_success    { echo -e "\n$GREEN$@ $RESTORE"; }
function log_info       { echo -e "\n$CYAN$@ $RESTORE"; }
function log_warning    { echo -e "\n$YELLOW$@ $RESTORE"; }
function log_error      { echo -e "\n$RED$@ $RESTORE"; }
function log_step {
    echo -e "$GREEN\n############################################$RESTORE"
    echo -e "$GREEN#  $@$RESTORE"
    echo -e "$GREEN############################################\n$RESTORE"
}

#######################################
# Function to check links
# Arguments:
#   path to link
# Return:
#   0 - link is good
#   1 - link is broken
#   2 - file exist but it's not a link
#   3 - file/link dosen't exist
#######################################
function check_if_link_exist {
    if [ -L $1 ]; then
        if [ -e $1 ]; then
            echo 0  # Good link
        else
            echo 1  # Broken link
        fi
    elif [ -e $1 ]; then
        echo 2  # Not a link
    else
        echo 3  # Missing file
    fi
}

#######################################
# Function to prepare symbolic link
# If file/link exist in dotfiles, script create backup link with add .dotfiles_backup suffix.
# Arguments:
#   $1 - from (path to file to by linked)
#   $2 - to (path of the link to be created)
#######################################
function create_link {
    from="$1"
    to="$2"

    res=$(check_if_link_exist "$to")

    if [ ! "$res" == 0 ]; then
        if [ -e "$to" ]; then
            log_warning "Created backup file for $to -> $to.dotfiles_backup\n"
            mv "$to" "$to.dotfiles_backup"
        fi

        log_success "Linking $from to $to.\n"
        ln -s "$from" "$to"

    else
        log_info "Link from $from to $to already exist.\n"
    fi   
}
