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

DOTFILES_HOME_PATH=/home/$USER_NAME/.dotfiles_wasky

if [[ $(id -u) -eq 0 ]]; then
	log_red "Use script as normal user"
	exit 1; 
fi

create_link_to_dotfiles()
{
    log_blue "Creating link to dotfiles repository.\n"

    create_link "$DOTFILES_PATH" "$DOTFILES_HOME_PATH"
}

add_inlcude_file_to_gitconfig()
{
    log_blue "Include gitconfig from dotfiles repository to ~/.gitconfig file\n"

    if grep -Fxq "    path = $DIR/git/gitconfig" $HOME/.gitconfig
    then
        log_yellow "gitconfig already added to $HOME./gitconfig file.\n"
    else
        log_green "Added include gitconfig to $HOME./gitconfig file.\n"
        echo "[include]" >> $HOME/.gitconfig
        echo "    path = $DIR/git/gitconfig" >> $HOME/.gitconfig
    fi
}

zsh_config()
{
    log_blue "Configuring zsh."
    #---------------------------------------------------------------
    # Install powerlevel9k
    #---------------------------------------------------------------
    if [ ! -d /home/$USER_NAME/.oh-my-zsh/custom/themes/powerlevel9k ]; then
        log_blue "Installing powerlevel9k.\n"
        git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k --quiet 
    fi

    create_link "$DOTFILES_PATH/zsh/zshrc.symlink" "$HOME/.zshrc"
    source /home/$USER_NAME/.zshrc
}

tmux_config()
{
    log_blue "Installing tmux plugins."

    create_link "$DOTFILES_PATH/tmux/tmux.conf.symlink" "$HOME/.tmux.conf"
    if [ "$RESULT" -eq "1" ]; then
        /home/$USER_NAME/.tmux/plugins/tpm/bin/install_plugins
        /home/$USER_NAME/.tmux/plugins/tpm/bin/update_plugins all
    fi
}

nvim_config()
{
    # Clone packer repo to hande neovim plugins
    if [ ! -d /home/$USER_NAME/.local/share/nvim/site/pack/packer/opt/packer.nvim ]; then
	log_green "Cloning packer plugin"
        git clone https://github.com/wbthomason/packer.nvim /home/$USER_NAME/.local/share/nvim/site/pack/packer/opt/packer.nvim
    else
	log_yellow "Packer already exist"
    fi

    mkdir -p /home/$USER_NAME/.config/nvim

    create_link "$DOTFILES_PATH/nvim/init.vim" "/home/$USER_NAME/.config/nvim/init.vim"
    create_link "$DOTFILES_PATH/nvim/lua" "/home/$USER_NAME/.config/nvim/lua"
    create_link "$DOTFILES_PATH/nvim/templates" "/home/$USER_NAME/.config/nvim/templates"

    log_blue "Installing language servers for nvim"
    # CMake
    pip3 install cmake-language-server
    # HTML
    npm install -g vscode-html-languageserver-bin
    # JSON
    npm install -g vscode-json-languageserver
    # Python
    npm install -g pyright
}

create_link_to_dotfiles
add_inlcude_file_to_gitconfig
zsh_config
tmux_config
nvim_config

log_green "To reload zsh use \n\t source ~/.zshrc"

