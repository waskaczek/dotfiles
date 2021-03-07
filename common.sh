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
INSTALLED_NERD_FONT=0
RELOAD_TMUX=0
RESULT=0
USER_NAME=$(logname)

DOTFILES_PATH=$DIR

log_green()
{
    echo -e "$GREEN $@ $RESTORE"
}

log_blue()
{
    echo -e "$CYAN $@ $RESTORE"
}

log_yellow()
{
    echo -e "$YELLOW $@ $RESTORE"
}

log_red()
{
    echo -e "$RED $@ $RESTORE"
}

check_if_link_exist()
{
    if [ -L $1 ]; then
        if [ -e $1 ]; then
            return 0 # Good link
        else
            return 1 # Broken link
        fi
    elif [ -e $1 ]; then
        return 2 # Not a link
    else
        return 3 # Missing file
    fi
}

create_link() 
{
    RESULT=0

    from="$1"
    to="$2"

    check_if_link_exist "$to"
    res=$?

    if [ $res -gt 0 ]; then

        if [ -e "$to" ]; then
            log_yellow "Created backup file for $to -> $to.dotfiles_backup\n"
            mv "$to" "$to.dotfiles_backup"
        else
            log_green "Previous settings not available, create new link.\n"
        fi

        log_green "Linking $from to $to.\n"
        ln -s "$from" "$to"
        RESULT=1

    else
        log_yellow "Link from $from to $to already exist.\n"
    fi   
}
