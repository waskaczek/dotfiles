
USER_NAME=$(logname)


# Install LSP
apt install clangd

# Python
pip3 install 'python-language-server[all]'

# CMake
pip3 install cmake-language-server

# HTML
npm install -g vscode-html-languageserver-bin

# JSON
npm install -g vscode-json-languageserver

# Install from nvim:
# :LspInstall sumneko_lua
# :LspInstall yamlls
# 
