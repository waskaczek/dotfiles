#! /usr/bin/env lua
--
-- settings.lua

local opt = vim.o
local wopt = vim.wo
local bopt = vim.bo
local api = vim.api

opt.showmode       = false -- Show currently editing mode
opt.showcmd        = true
opt.cmdheight      = 1     -- Height of the command bar
opt.incsearch      = true  -- Makes search act like search in modern browsers
opt.showmatch      = true  -- show matching brackets when text indicator is over them
wopt.number         = true  -- But show the actual number for the line we're on
opt.ignorecase     = true  -- Ignore case when searching...
opt.smartcase      = true  -- ... unless there is a capital letter in the query
opt.hidden         = false 
wopt.cursorline     = true  -- Highlight the current line
opt.equalalways    = false -- I don't like my windows changing all the time
opt.splitright     = true  -- Prefer windows splitting to the right
opt.splitbelow     = true  -- Prefer windows splitting to the bottom
opt.updatetime     = 1000  -- Make updates happen faster
opt.hlsearch       = true  -- I wouldn't use this without my DoNoHL function
opt.scrolloff      = 10    -- Make it so there are always ten lines below my cursor

-- Tabs
bopt.autoindent     = true
--bopt.cindent        = false 
--wopt.wrap           = true

bopt.tabstop        = 8
bopt.softtabstop    = 0
bopt.shiftwidth     = 4
bopt.expandtab      = true
opt.smarttab       = true

wopt.breakindent    = true

opt.belloff        = 'all' -- Just turn the dang bell off

opt.mouse          = 'n'

-- Keymaps

-- Removed arrows in normal, visual and insert mode
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('v', '<Up>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Down>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Left>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<Right>', '<Nop>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('i', '<Up>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<Down>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<Left>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<Right>', '<Nop>', {noremap = true, silent = true})

