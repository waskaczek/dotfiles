#! /usr/bin/env lua
--
vim.cmd [[packadd packer.nvim]]

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require('packer').startup(
function(use)
  -- Packer
  use {'~/projects/personal/packer.nvim', opt = true}

  -- Tools
  -- https://github.com/TaDaa/vimade
  use {'TaDaa/vimade'}
  -- https://github.com/kyazdani42/nvim-tree.lua
  use {'kyazdani42/nvim-web-devicons'}
  use {'kyazdani42/nvim-tree.lua'}
  -- https://github.com/preservim/tagbar
  use {'preservim/tagbar'}
  -- https://github.com/ludovicchabant/vim-gutentags
  --   use {'ludovicchabant/vim-gutentags'}
  -- https://github.com/christoomey/vim-tmux-navigator
  use {'christoomey/vim-tmux-navigator'}
  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use {"windwp/nvim-ts-autotag"}
  -- LSP
  -- https://github.com/neovim/nvim-lspconfig
  use {'neovim/nvim-lspconfig'}
  use {"glepnir/lspsaga.nvim"}
  -- https://github.com/nvim-lua/completion-nvim
  use {'nvim-lua/completion-nvim'}
  -- Python
  -- https://github.com/tell-k/vim-autopep8
  use {'tell-k/vim-autopep8'}
  -- https://github.com/heavenshell/vim-pydocstring
  use {'heavenshell/vim-pydocstring', run = 'make install'}
  -- https://github.com/nvie/vim-flake8
  use {'nvie/vim-flake8'}
  use {"windwp/nvim-autopairs"}
  -- GIT
  -- https://github.com/airblade/vim-gitgutter
  use {'airblade/vim-gitgutter'}
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
  -- Status Line and Bufferline
  use {"glepnir/galaxyline.nvim"}
  use {"romgrk/barbar.nvim"}

  use {"christianchiarulli/nvcode-color-schemes.vim"}
          -- Telescope
        use {"nvim-lua/popup.nvim"}
        use {"nvim-lua/plenary.nvim"}
        use {"nvim-telescope/telescope.nvim"}
        use {"nvim-telescope/telescope-fzy-native.nvim"}
--
  -- https://github.com/vim-airline/vim-airline
  -- use{'vim-airline/vim-airline'}
  -- https://github.com/vim-airline/vim-airline-themes
  	--use{'vim-airline/vim-airline-themes'}
end
)
