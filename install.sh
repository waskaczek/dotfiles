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

set -e
source common.sh 2>/dev/null || source "$DIR/common.sh"

function usage { 
    cat <<EOF

Script to install dotfiles on clean machine. Possible install for desktop or only for terminal use (light).
Also possible is to install development packages for c/c++, python, lua etc. In case if you don't select development flag 
script install only nvim without lsp configuration and system without development libraries and compilers.

Usage:

Install development configuration on normal desktop with gui
  ${0##*/} -e <enviroment> -d
  Example: ${0##*/} -e desktop -d

Install only configuration for console (Raspberry Pi)
  ${0##*/} -e <enviroment>
  Example: ${0##*/} -e light    

Options:
    -h              : print this help and exit
    -e <enviroment> : enviroment possible value: desktop, light
    -d              : development
    -t <tools path> : path to tools: default is $HOME/tools/dotfiles
EOF
}

DOTFILES_HOME_PATH=$HOME/.dotfiles_wasky
DEFAULT_TOOLS_PATH=$HOME/tools/dotfiles
ARCH=$(uname -m)

unset -v DEV ENV USAGE TOOLS_PATH
while getopts ":e:dht" opt; do
    case $opt in
        e)  ENV="$OPTARG";;
        d)  DEV=1;;
        t)  TOOLS_PATH="$OPTARG";;
        h)  USAGE=1;;
        *)  USAGE=1;;
    esac
done
shift $((OPTIND -1))

if [ $USAGE ]; then
  usage
  exit 0
fi

if [ -z $ENV ]; then
    log_error "Missing -e parameter. Run ${0##*/} -h for help"
    exit 1
fi

if [ -z $TOOLS_PATH ]; then
    TOOLS_PATH="$DEFAULT_TOOLS_PATH"
    log_info "Tools path is set to default:\n  $TOOLS_PATH\n"
fi

if [ ! -d $TOOLS_PATH ]; then
    log_info "Creating tools directory: \n $TOOLS_PATH\n"
    mkdir -p $TOOLS_PATH
fi

function install_packages_from_apt {
    #---------------------------------------------------------------
    # Light version
    #---------------------------------------------------------------
    APPS_TO_INSTALL=(
        curl
        fonts-powerline
        fonts-font-awesome
        fzf
        git
        htop
        network-manager
        npm
        python3-networkmanager
        python3-pip
        python3-venv
        ripgrep
        sudo
        tmux
        tmux-plugin-manager
        tree
        zsh
        )

    if [ $ENV == "desktop" ]; then
        APPS_TO_INSTALL+=(
            gnome-terminal
            okular
        )
    fi

    if [ $DEV ]; then
        APPS_TO_INSTALL+=(
            automake
            autotools-dev
            clang-13
            clangd-13
            cmake
            g++
            gcc
            gcc-arm-none-eabi
            pkg-config
            plantuml
            yarn
        )
    fi

    log_step "Install packages from APT"
    log_info "Update and upgrade packages"
    sudo apt update -qq
    sudo apt upgrade -qq --assume-yes

    IFS=$'\n' SORTED_APP=($(sort <<<"${APPS_TO_INSTALL[*]}")); unset IFS

    log_info "Installing followed packages:"
    for i in "${SORTED_APP[@]}"; do
        log_info " - $i"
    done

    sudo apt install -qq --assume-yes ${APPS_TO_INSTALL[@]}
    sudo apt clean -qq 
    sudo apt autoremove -qq --assume-yes
}

function install_development_part {

    if [ $DEV ]; then

        log_step "Install development packages"

        #   CTAGS
        if ! command -v ctags > /dev/null; then
            if [ ! -d "$TOOLS_PATH/ctags" ]; then
                log_info "Creating folder for ctags [$TOOLS_PATH/ctags]"
                mkdir -p $TOOLS_PATH/ctags
            fi

            log_info "\nInstalling ctags"
            git clone https://github.com/universal-ctags/ctags.git $TOOLS_PATH/ctags
            cd $TOOLS_PATH/ctags
            ./autogen.sh
            ./configure
            make
            sudo make install
        else
            log_info "Ctags already installed"
        fi

        log_info "Installing tree-sitter-cli"
        npm install --silent --quiet --g tree-sitter-cli
    fi
}

function configure_npm {
    if [ ! -d "$HOME/.npm-packages" ]; then
        log_step "Configure npm to use local storage for packages"
        mkdir -p $HOME/.npm-packages
        npm config set prefix "$HOME/.npm-packages"
    fi
}

function install_zsh {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        log_step "Installing oh-my-zsh and dependencies"

        sh -c "$(wget -q https://github.com/ohmyzsh/ohmyzsh/blob/2daffdf101f21575f7904d92b29c16bcb448aa10/tools/install.sh -O -)" "" --unattended
    else
        log_info "oh-my-zsh already installed."
    fi

    if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
        log_info "Installing powerlevel10k"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k --quiet
    else
        log_info "powerlevel10k already installed"
    fi

    log_info "Set zsh as default shell."
    chsh -s $(which zsh)

    create_link "$DOTFILES_PATH/zsh/zshrc.symlink" "$HOME/.zshrc"
}

function configure_git {
    log_step "Configure git"

    log_info "Include gitconfig from dotfiles repository to ~/.gitconfig file"

    if [ -f $HOME/.gitconfig ]; then
        if grep -Fxq "    path = $DIR/git/gitconfig" $HOME/.gitconfig; then
            log_info "gitconfig already added to $HOME./gitconfig file."
        else
            log_info "Added include gitconfig to $HOME./gitconfig file."
            echo "[include]" >> $HOME/.gitconfig
            echo "    path = $DIR/git/gitconfig" >> $HOME/.gitconfig
        fi
    else
        log_info "Added include gitconfig to $HOME./gitconfig file."
        echo "[include]" >> $HOME/.gitconfig
        echo "    path = $DIR/git/gitconfig" >> $HOME/.gitconfig
    fi

}

function create_link_to_dotfiles {
    log_step "Creating link to dotfiles repository."
    create_link "$DOTFILES_PATH" "$DOTFILES_HOME_PATH"
}

function configure_tmux {
    log_step "Installing tmux plugins."

    create_link "$DOTFILES_PATH/tmux/tmux.conf.symlink" "$HOME/.tmux.conf"

    /usr/share/tmux-plugin-manager/bin/install_plugins
    /usr/share/tmux-plugin-manager/bin/update_plugins all
}

function configure_nvim {

    log_step "Configure neovim"
    mkdir -p $HOME/.config/nvim

    if ! command -v nvim > /dev/null; then
        wget -q -P $TOOLS_PATH https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
        sudo chmod +x $TOOLS_PATH/nvim.appimage
        sudo ln -s "$TOOLS_PATH/nvim.appimage" "/usr/local/bin/nvim"
    fi

    create_link "$DOTFILES_PATH/nvim/init.lua" "$HOME/.config/nvim/init.lua"
    create_link "$DOTFILES_PATH/nvim/lua" "$HOME/.config/nvim/lua"
    create_link "$DOTFILES_PATH/nvim/lsp" "$HOME/.config/nvim/lsp"
    create_link "$DOTFILES_PATH/nvim/templates" "$HOME/.config/nvim/templates"

}

function install_nerd_font {
    log_step "Installing nerd font - SourceCodePro Regular"

    if [ ! -d $HOME/.fonts ]; then
        mkdir -p $HOME/.fonts
        sudo chmod 755 $HOME/.fonts
    fi

    if [ ! -f "$HOME/.fonts/Sauce Code Pro Nerd Font Complete.ttf" ]; then
        wget -q -P $HOME/.fonts https://github.com/ryanoasis/nerd-fonts/blob/a861c72656f180f9061af5d46dd705620194d311/patched-fonts/SourceCodePro/SauceCodeProNerdFont-Regular.ttf
        fc-cache
    else
        log_info "Font already installed"
    fi
}

function configure_gnome_terminal {
    log_step "Configure gnome terminal"
    GT_PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}')

    log_info "Set solarized dark colors"
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GT_PROFILE/ use-system-font false
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GT_PROFILE/ font 'SauceCodePro Nerd Font 10'
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GT_PROFILE/ foreground-color '#839496'
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GT_PROFILE/ background-color '#002B36'
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GT_PROFILE/ bold-color-same-as-fg true
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GT_PROFILE/ bold-is-bright false
    gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GT_PROFILE/ highlight-colors-set false
}

install_packages_from_apt

configure_npm
install_development_part

install_nerd_font
create_link_to_dotfiles 
configure_git
configure_tmux
configure_nvim
install_zsh

if [ $ENV == "desktop" ]; then
    configure_gnome_terminal
fi

env zsh
