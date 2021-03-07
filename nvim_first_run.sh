#!/usr/bin/env bash

######################################
#   File: Install file.              #
#   __    __          _              #
#  / / /\ \ \__ _ ___| | ___   _     # 
#  \ \/  \/ / _` / __| |/ | | | |    #
#   \  /\  | (_| \__ |   <| |_| |    #
#    \/  \/ \__,_|___|_|\_\\__, |    #
#                          |___/     #
#   https://github.com/waskaczek     #
######################################

source common.sh 2>/dev/null || source "$DIR/common.sh"

nvim +PackerCompile +PackerInstall +PackerSync
