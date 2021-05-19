
local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

local custom_attach = function(client)
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end

end

-- Diagnostic
--mapper('n', '<space>dn', 'vim.lsp.diagnostic.goto_next()')
--mapper('n', '<space>dp', 'vim.lsp.diagnostic.goto_prev()')

-- Buffer
--mapper('n', '<leader>d', 'vim.lsp.buf.definition()')
--mapper('n', '<leader>D', 'vim.lsp.buf.declaration()')
-- mapper('n', '', 'vim.lsp.buf.implementation()')
-- mapper('n', '', 'vim.lsp.buf.signature_help()')
-- mapper('n', '', 'vim.lsp.buf.type_definition()')
-- mapper('n', '', 'vim.lsp.buf.document_symbol()')
-- mapper('n', '', 'vim.lsp.buf.workspace_symbol()')
-- mapper('n', '', 'vim.lsp.buf.declaration()')
--mapper('n', '<leader>r', 'require("lspsaga.rename").rename()')

vim.cmd("nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>")
vim.cmd("nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>")

-- lspsaga
vim.cmd("nnoremap <silent> gr lua require'lspsaga.provider'.lsp_finder()<CR>")
vim.cmd("nnoremap <silent> <leader>R lua require('lspsaga.rename').rename()<CR>")
vim.cmd("nnoremap <silent> ca :Lspsaga code_action<CR>")
vim.cmd("nnoremap <silent> K :Lspsaga hover_doc<CR>")

require'lspconfig'.pyls.setup{
    settings = {
        pyls = {
            plugins = {
                pycodestyle = {
                    maxLineLength = 120;
                }
            }
        }
    },
}
