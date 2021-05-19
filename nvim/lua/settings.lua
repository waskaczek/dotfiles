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
wopt.number        = true  -- But show the actual number for the line we're on
opt.ignorecase     = true  -- Ignore case when searching...
opt.smartcase      = true  -- ... unless there is a capital letter in the query
opt.hidden         = false
wopt.cursorline    = true  -- Highlight the current line
opt.equalalways    = false -- I don't like my windows changing all the time
opt.splitright     = true  -- Prefer windows splitting to the right
opt.splitbelow     = true  -- Prefer windows splitting to the bottom
opt.updatetime     = 1000  -- Make updates happen faster
opt.hlsearch       = true  -- I wouldn't use this without my DoNoHL function
opt.scrolloff      = 10    -- Make it so there are always ten lines below my cursor


vim.cmd('set ts=4') -- Insert 2 spaces for a tab
vim.cmd('set sw=4') -- Change the number of space characters inserted for indentation
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.cmd('set autoindent')
vim.cmd('set smartindent')
vim.o.showtabline = 2

wopt.breakindent    = true

opt.belloff        = 'all' -- Just turn the dang bell off

opt.mouse          = 'n'
