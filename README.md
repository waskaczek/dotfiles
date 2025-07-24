```
   __    __          _          
  / / /\ \ \__ _ ___| | ___   _  
  \ \/  \/ / _` / __| |/ | | | |
   \  /\  | (_| \__ |   <| |_| |
    \/  \/ \__,_|___|_|\_\\__, |
                          |___/ 
                        DOTFILES
```
# Dotfiles
Dotfiles are prepared for Debian based distributions.

Tested with Debian 12.

## Requirements
### Neovim >= 0.11

## Installation
Installation of dotfiles is possible for 2 types of enviroments:
1. desktop - for normal PC with installed graphic enviroment
2. light - for only console withot graphic enviroment

Dotfiles have also possibility to install packages with development tools.

Install script usage you can check by:

`./install.sh -h`

IDE is build based on neovim, supported languages are:
- bash
- C
- C++
- Cmake
- CSS
- Dockerfile
- HTML
- JSON
- Lua
- Python
- SQL

After that script shoud start make a symbolic links, script should check if you already have some config files for zsh, tmux. If you have config files script will make a backup with add to name .dotfiles_backup suffix. After that will make a symbolic link to standard locations of config files.


