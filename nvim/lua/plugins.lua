#! /usr/bin/env lua
--
--
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- Load lua plugins config path
    local config_path = function(name)
        return string.format("require'plugins.%s'", name)
    end

    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim' }
    --
    -- Tools
    -- https://github.com/TaDaa/vimade
    use {'TaDaa/vimade'}

    -- https://github.com/kyazdani42/nvim-tree.lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        },
        config = config_path("nvimtree")
    }
    -- https://github.com/preservim/tagbar
    use {'preservim/tagbar'}
    -- https://github.com/ludovicchabant/vim-gutentags
    --   use {'ludovicchabant/vim-gutentags'}
    -- https://github.com/christoomey/vim-tmux-navigator
    --use {'christoomey/vim-tmux-navigator'}
    --
    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use { 'lewis6991/nvim-treesitter-context' }

    use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
    config = config_path("nvim-navic")
}
    -- Autocomplete
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-calc' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'ray-x/cmp-treesitter' }
    use { 'lukas-reineke/cmp-rg' }
    use { 'quangnguyen30192/cmp-nvim-tags' }
    use { 'rafamadriz/friendly-snippets' }
    use { 'windwp/nvim-autopairs' }
    use { 'windwp/nvim-ts-autotag' }
    use { 'andymass/vim-matchup' }

    -- LSP
    use {'neovim/nvim-lspconfig'}
    use {'onsails/lspkind-nvim'}
    use {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu'
    }

    -- UI
    use {
        'feline-nvim/feline.nvim',
        config = config_path("feline")
    }

    -- Python
    -- https://github.com/tell-k/vim-autopep8
    use {'tell-k/vim-autopep8'}
    -- https://github.com/heavenshell/vim-pydocstring
    --use {'heavenshell/vim-pydocstring', run = 'make install'}
    -- https://github.com/kkoomen/vim-doge
    -- use {'kkoomen/vim-doge', run = ':call doge#install()'}
    -- https://github.com/nvie/vim-flake8
    use {'nvie/vim-flake8'}

    -- GIT
    use {
        'lewis6991/gitsigns.nvim',
        config = config_path("gitsigns")
    }
    use { 'kdheepak/lazygit.nvim' }

    -- PlantUML
    -- https://github.com/aklt/plantuml-syntax
    use {'aklt/plantuml-syntax'}
    -- https://github.com/weirongxu/plantuml-previewer.vim
    use {'weirongxu/plantuml-previewer.vim'}
    -- https://github.com/tyru/open-browser.vim
    use {'tyru/open-browser.vim'}

    -- Markdown
    -- https://github.com/plasticboy/vim-markdown
    --use {'plasticboy/vim-markdown'}

    -- Themes

    use {'christianchiarulli/nvcode-color-schemes.vim'}
    -- Telescope
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {'nvim-telescope/telescope-fzy-native.nvim'}

    use {'mfussenegger/nvim-lint'}
    use {'iamcco/markdown-preview.nvim'}

    -- Code helpers
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = config_path("todo-comments")
    }

    use {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter",
    config = config_path("neogen")
}
    -- UI
    --  Theme
    use {'navarasu/onedark.nvim'}
    --  Status Line and Bufferline
    -- use {'glepnir/galaxyline.nvim'}
    use {'romgrk/barbar.nvim'}
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

