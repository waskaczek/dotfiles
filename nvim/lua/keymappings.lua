
-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

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
