#! /usr/bin/env lua

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Run packer in popup window
require('packer').init({
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
})

return require('packer').startup({function(use)
    -- Load lua plugins config path
    local config_path = function(name)
        return string.format('require"plugins.%s"', name)
    end
    -- Packer can manage itself as an optional plugin
    use { 'wbthomason/packer.nvim' }

    -- Completition --
    -- cmp
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-cmdline' }
    use { 'hrsh7th/cmp-calc' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    -- Snippets
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }
    -- LSP
    use { 'neovim/nvim-lspconfig' }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "RRethy/vim-illuminate" }

    -- Extra for languages etc --
    -- GIT
    use {
        'lewis6991/gitsigns.nvim',
        config = config_path('gitsigns')
    }
    -- PlantUML
    use { 'aklt/plantuml-syntax' }
    use { 'weirongxu/plantuml-previewer.vim' }
    -- Markdown

    -- Common
    use { 'tyru/open-browser.vim' }

    -- Code helpers --
    -- TODO
    use { 'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = config_path('todo-comments')
    }
    -- Code documentation
    use { 'danymat/neogen',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = config_path('neogen')
    }
    -- Alternative for tagbar
    use { 'simrat39/symbols-outline.nvim',
        config = config_path('symbols-outline')
    }
    -- Helpers
    use {
        'windwp/nvim-autopairs',
        config = config_path('autopairs')
    }
    use { 'SmiteshP/nvim-navic',
        requires = 'neovim/nvim-lspconfig',
        config = config_path('nvim-navic')
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    -- Telescope
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-telescope/telescope.nvim',
        config = config_path('telescope')
    }
    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = config_path('treesitter')
    }
    use { 'lewis6991/nvim-treesitter-context',
        config = config_path('treesitter-context')
    }

    -- UI
    -- Icons etc
    use { 'nvim-tree/nvim-web-devicons' }

    --  Theme
    use { 'folke/tokyonight.nvim' }

    --  Status Line and Bufferline
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        options = {
            theme = 'tokyonight'
        },
        config = config_path('lualine')

    }
    use { 'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons',
        config = config_path('bufferline')
    }
    -- Nvim Tree
    use { 'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons'
        },
        config = config_path('nvimtree')
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end,
config = {
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end
  }
    }
})
