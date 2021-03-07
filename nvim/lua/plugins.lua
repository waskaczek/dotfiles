#! /usr/bin/env lua
--
-- plugins.lua
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer
    use {'~/projects/personal/packer.nvim', opt = true}

    -- Tools
    -- https://github.com/TaDaa/vimade
    use {'TaDaa/vimade'}
    
    -- https://github.com/junegunn/fzf.vim
    use {'junegunn/fzf', run = './install --all' }
    use {'junegunn/fzf.vim'}

    -- https://github.com/preservim/nerdtree
    use {'preservim/nerdtree', on = 'NERDTreeToggle'}

    -- https://github.com/jiangmiao/auto-pairs
    use {'jiangmiao/auto-pairs'}

    -- https://github.com/preservim/tagbar
    use {'preservim/tagbar'}

    -- https://github.com/ludovicchabant/vim-gutentags
 --   use {'ludovicchabant/vim-gutentags'}

    -- https://github.com/christoomey/vim-tmux-navigator
    use {'christoomey/vim-tmux-navigator'}


    -- LSP
    -- https://github.com/neovim/nvim-lspconfig
    use {'neovim/nvim-lspconfig'}

    -- https://github.com/nvim-lua/completion-nvim
    use {'nvim-lua/completion-nvim'}

    -- Python
    -- https://github.com/tell-k/vim-autopep8
    use {'tell-k/vim-autopep8'}

    -- https://github.com/heavenshell/vim-pydocstring
    use {'heavenshell/vim-pydocstring', run = 'make install'}

    -- https://github.com/nvie/vim-flake8
    use {'nvie/vim-flake8'}


    -- GIT
    -- https://github.com/airblade/vim-gitgutter
    use {'airblade/vim-gitgutter'}

    -- https://github.com/Xuyuanp/nerdtree-git-plugin
    use {'Xuyuanp/nerdtree-git-plugin'}


    -- PlantUML
    -- https://github.com/aklt/plantuml-syntax
    use {'aklt/plantuml-syntax'}

    -- https://github.com/weirongxu/plantuml-previewer.vim
    use {'weirongxu/plantuml-previewer.vim'}

    -- https://github.com/tyru/open-browser.vim
    use {'tyru/open-browser.vim'}

    
    -- Markdown
    -- https://github.com/plasticboy/vim-markdown
    use {'plasticboy/vim-markdown'}

    
    -- Themes
    -- https://github.com/joshdick/onedark.vim
    use {'joshdick/onedark.vim'}

    -- https://github.com/vim-airline/vim-airline
    use{'vim-airline/vim-airline'}

    -- https://github.com/vim-airline/vim-airline-themes
    use{'vim-airline/vim-airline-themes'}

end)
