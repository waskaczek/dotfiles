######################################
#   File: ZSH aliases.               #
#   __    __          _              #
#  / / /\ \ \__ _ ___| | ___   _     #
#  \ \/  \/ / _` / __| |/ | | | |    #
#   \  /\  | (_| \__ |   <| |_| |    #
#    \/  \/ \__,_|___|_|\_\\__, |    #
#                          |___/     #
#   https://github.com/waskaczek     #
######################################

#########################################
# Base                                  #
#########################################
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias cd..="cd .."
alias cd...="cd ../.."
alias cd....="cd ../../.."
alias cd.....="cd ../../../.."

alias mv="mv --interactive --verbose" 
alias cp="cp --interactive --verbose" 
alias ln="ln --interactive --verbose" 

alias work="cd ~/work"

#########################################
# Dmesg                                 #
#########################################
alias dmesg="dmesg -T"

#########################################
# Package Managers                      #
#########################################
alias update="sudo apt update"
alias upgrade="sudo apt update && sudo apt upgrade && sudo apt clean"
alias autoremove="sudo apt autoremove"
alias install="sudo apt install"
alias remove="sudo apt remove"

#########################################
# Languages                             #
#########################################
alias py2="python2"
alias py3="python3"

#########################################
# Quick command                         #
#########################################
alias vim="nvim"
alias v="nvim"
alias view="nvim -R"
alias vdiff="nvim -d"
#alias cat="bat"
