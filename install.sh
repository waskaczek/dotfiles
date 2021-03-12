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

if [[ $(id -u) -ne 0 ]]; then
	log_red "Use as root, with sudo" 
	exit 1; 
fi

log_blue "\nInstalling packages"

#---------------------------------------------------------------
# Install packages from apt
#---------------------------------------------------------------
if [ "$1" == "desktop" ]; then
    sudo apt install -qq \
	automake \
	autotools-dev \
	pkg-config \
	clang \
	clang-tools \
        cmake \
        curl \
        htop \
        okular \
        gnome-terminal \
        fonts-powerline \
        fonts-font-awesome \
        zsh \
        ncurses-dev \
        libevent-dev \
        npm \
        tmux \
        tmux-plugin-manager \
        python3-pip \
        unrar \
	xsel \
        silversearcher-ag \
        ripgrep
else
    sudo apt install -qq \
	automake \
	autotools-dev \
	pkg-config \
	clang \
	clang-tools \
        cmake \
        curl \
        htop \
        fonts-powerline \
        fonts-font-awesome \
        zsh \
        ncurses-dev \
        libevent-dev \
        npm \
        tmux \
        tmux-plugin-manager \
        python3-pip \
        unrar \
	xsel \
        silversearcher-ag \
        ripgrep
fi


#---------------------------------------------------------------
# Install ctags
#---------------------------------------------------------------
if ! type "ctags" > /dev/null; then
    if [ ! -d /home/$USER_NAME/tools/ctags ]; then
	log_blue "Installing ctags"
	log_gren "Creating folder for ctags [~/tools/ctags]"
        mkdir -r ~/tools/nvim
	sudo -u $USER_NAME git clone https://github.com/universal-ctags/ctags.git /home/$USER_NAME/tools/ctags
	cd /home/$USER_NAME/tools/ctags
	sudo -u $USER_NAME ./autogen.sh
	sudo -u $USER_NAME ./configure
	make
	make install
    fi
fi

#---------------------------------------------------------------
# Configure npm to use local storage for packages
#---------------------------------------------------------------
if [ ! -d "/home/$USER_NAME/.npm-packages" ]; then
    log_blue "\nConfigure npm to use local storage for packages"
    sudo -u $USER_NAME mkdir -p /home/$USER_NAME/.npm-packages
    sudo -u $USER_NAME npm config set prefix "/home/$USER_NAME/.npm-packages"
fi

#---------------------------------------------------------------
# Install nvim
#---------------------------------------------------------------
log_blue "\nInstalling nvim"
# Create directory for nvim
if [ ! -d /home/$USER_NAME/tools/nvim ]; then
    log_green "Creating folder for nvim [~/tools/nvim]"
    sudo -u $USER_NAME mkdir -p ~/tools/nvim
fi

# Download nightly nvim install
if [ ! -f /home/$USER_NAME/tools/nvim/nvim.appImage ]; then
    sudo -u $USER_NAME wget -O /home/$USER_NAME/tools/nvim/nvim.appImage https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
    chmod +x /home/$USER_NAME/tools/nvim/nvim.appImage
else
    log_yellow "nvim.appImage already exist"
fi

create_link "/home/$USER_NAME/tools/nvim/nvim.appImage" "/usr/local/bin/nvim"
sudo -u $USER_NAME pip3 install neovim

#---------------------------------------------------------------
# Install ZSH
#---------------------------------------------------------------
if [ ! -d "/home/$USER_NAME/.oh-my-zsh" ]; then
    log_blue "\nInstalling oh-my-zsh."
    # Get zsh
    sudo -u $USER_NAME sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    log_green "Set zsh as default shell.\n"
    sudo chsh -s $(which zsh)
else
    log_yellow "ZSH already installed.\n"
fi
