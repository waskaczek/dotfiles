local opts = {noremap = true, silent = true}
local set_key = vim.api.nvim_set_keymap

local key_modes = {
    normal_mode = 'n',
    insert_mode = 'i',
    visual_mode = 'v',
           visual_block_mode = 'x',
    command_mode = 'c',
}

local configuration = {
    normal_mode = {
        -- Removed arrows
        ['<Up>']    = '<Nop>',
        ['<Left>']  = '<Nop>',
        ['<Down>']  = '<Nop>',
        ['<Right>'] = '<Nop>',
        -- Better window navigation
        ['<C-h>'] = '<C-w>h',
        ['<C-j>'] = '<C-w>j',
        ['<C-k>'] = '<C-w>k',
        ['<C-l>'] = '<C-w>l',
        -- Buffer nevigate
        ['<S-l>'] = ':bnext<CR>',
        ['<S-h>'] = ':bprevious<CR>',
        ['<S-c>'] = ':bd<CR>',

        -- Plugins --
        -- Telescope
        ['<leader>ff'] =  '<cmd>lua require("telescope.builtin").find_files()<CR>',
        ['<leader>fg'] =  '<cmd>lua require("telescope.builtin").live_grep()<CR>',
        ['<leader>fb'] =  '<cmd>lua require("telescope.builtin").buffers()<CR>',
        ['<leader>fh'] =  '<cmd>lua require("telescope.builtin").help_tags()<CR>',
        -- NvimTree
        ['<C-n>'] = ':NvimTreeToggle<CR>',
        ['<leader>r'] = ':NvimTreeRefresh<CR>',
    },
    insert_mode = {
        -- Removed arrows
        ['<Up>']    = '<Nop>',
        ['<Left>']  = '<Nop>',
        ['<Down>']  = '<Nop>',
        ['<Right>'] = '<Nop>',
    },
    visual_mode = {
        -- Removed arrows
        ['<Up>']    = '<Nop>',
        ['<Left>']  = '<Nop>',
        ['<Down>']  = '<Nop>',
        ['<Right>'] = '<Nop>',
        -- Better indenting
        ['<'] = '<gv',
        ['>'] = '>gv',
        -- Move text up and down
        ['K'] = ':move \'<-2<CR>gv-gv',
        ['J'] = ':move \'>+1<CR>gv-gv',
        -- Paste to selected text
        ["p"] = '"_dP',
    },
    visual_block_mode = {
        -- Move text up and down
        ['K'] = ':move \'<-2<CR>gv-gv',
        ['J'] = ':move \'>+1<CR>gv-gv',
    },
    command_mode = {
        ["<C-j>"] = 'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
        ["<C-k>"] = 'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
    },
}

for i, value in pairs(key_modes) do
    local config = configuration[i]
    local mode = value
    for key, val in pairs(config) do
        if(mode == 'c') then
            set_key(mode, key, val, { expr = true, noremap = true })
        else
            set_key(mode, key, val, opts)
        end
    end
end
