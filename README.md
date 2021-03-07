# Dotfiles
Dotfiles are prepared for Debian based distributions.

## Installation

After that script shoud start make a symbolic links, script should check if you already have some config files for zsh, tmux. If you have config files script will make a backup with add to name .dotfiles_backup suffix. After that will make a symbolic link to standard locations of config files.

After that you should reload your .zshrc file. 

```
# Clone repository
git clone git@github.com:waskaczek/dotfiles.git

# Run install script
sudo ./install.sh

# Reload zshrc to activate npm new location
source ~/.zshrc

# Run config script
./config.sh

# Reload zshrc to activate new zsh configuration
source ~/.zshrc

# Run nvim first time to install plugins
./nvim_first_run.sh
```
