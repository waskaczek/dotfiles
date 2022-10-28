local generic_opts_any = {noremap = true, silent = true}
local set_key = vim.api.nvim_set_keymap

-- better window movement
set_key('n', '<C-h>', '<C-w>h', {silent = true})
set_key('n', '<C-j>', '<C-w>j', {silent = true})
set_key('n', '<C-k>', '<C-w>k', {silent = true})
set_key('n', '<C-l>', '<C-w>l', {silent = true})

-- better indenting
set_key('v', '<', '<gv', generic_opts_any)
set_key('v', '>', '>gv', generic_opts_any)

-- Move selected line / block of text in visual mode
set_key('x', 'K', ':move \'<-2<CR>gv-gv', generic_opts_any)
set_key('x', 'J', ':move \'>+1<CR>gv-gv', generic_opts_any)

-- Removed arrows in normal, visual and insert mode
set_key('n', '<Up>', '<Nop>', generic_opts_any)
set_key('n', '<Down>', '<Nop>', generic_opts_any)
set_key('n', '<Left>', '<Nop>', generic_opts_any)
set_key('n', '<Right>', '<Nop>', generic_opts_any)

set_key('v', '<Up>', '<Nop>', generic_opts_any)
set_key('v', '<Down>', '<Nop>', generic_opts_any)
set_key('v', '<Left>', '<Nop>', generic_opts_any)
set_key('v', '<Right>', '<Nop>', generic_opts_any)

set_key('i', '<Up>', '<Nop>', generic_opts_any)
set_key('i', '<Down>', '<Nop>', generic_opts_any)
set_key('i', '<Left>', '<Nop>', generic_opts_any)
set_key('i', '<Right>', '<Nop>', generic_opts_any)

-- NvimTree
set_key('n', '<C-n>',     ':NvimTreeToggle<CR>', generic_opts_any)
set_key('n', '<leader>r', ':NvimTreeRefresh<CR>', generic_opts_any)

-- Telescope
set_key('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', generic_opts_any)
set_key('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>',  generic_opts_any)
set_key('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>',    generic_opts_any)
set_key('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>',  generic_opts_any)

-- Barbar
set_key('n', '<TAB>',       ':BufferNext<CR>',      generic_opts_any)
set_key('n', '<S-TAB>',     ':BufferPrevious<CR>',  generic_opts_any)
set_key('n', '<leader>[',   ':BufferClose<CR>',     generic_opts_any)

-- Lazygit
set_key('n', '<leader>gg',  ':LazyGit<CR>', generic_opts_any)
