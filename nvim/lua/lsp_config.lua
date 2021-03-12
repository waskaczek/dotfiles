#! /usr/bin/env lua

local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<CR>", {noremap = true, silent = true})
end

local custom_attach = function(client)
    if client.config.flags then
        client.config.flags.allow_incremental_sync = true
    end
    -- Diagnostic
    mapper('n', '<space>dn', 'vim.lsp.diagnostic.goto_next()')
    mapper('n', '<space>dp', 'vim.lsp.diagnostic.goto_prev()')

    -- Buffer
    mapper('n', '<leader>d', 'vim.lsp.buf.definition()')
    -- mapper('n', '', 'vim.lsp.buf.implementation()')
    -- mapper('n', '', 'vim.lsp.buf.signature_help()')
    -- mapper('n', '', 'vim.lsp.buf.type_definition()')
    mapper('n', '<leader>f', 'vim.lsp.buf.references()')
    -- mapper('n', '', 'vim.lsp.buf.document_symbol()')
    -- mapper('n', '', 'vim.lsp.buf.workspace_symbol()')
    -- mapper('n', '', 'vim.lsp.buf.declaration()')
    mapper('n', '<leader>r', 'vim.lsp.buf.rename()')

end

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
    on_attach=custom_attach

}

require'lspconfig'.bashls.setup{
    on_attach=custom_attach
}

require'lspconfig'.dockerls.setup{
    on_attach=custom_attach
}

require'lspconfig'.clangd.setup{
	on_attach=custom_attach
}

require'lspconfig'.cmake.setup{
    on_attach=custom_attach
}
require'lspconfig'.groovyls.setup{
    cmd = { "java", "-jar", "/home/wasky/Tools/lsp/groovy-language-server/build/libs/groovy-language-server-all.jar" },
    on_attach=custom_attach
}

--require'lspconfig'.html.setup{on_attach=custom_attach}
--require'lspconfig'.sumneko_lua.setup{on_attach=custom_attach}
--require'lspconfig'.yamlls.setup{on_attach=custom_attach}
