local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = true,
    sources = {
        formatting.autopep8,
        formatting.clang_format,
        formatting.cmakelang,
        formatting.markdownlint,
        formatting.sql_formatter,
        formatting.stylua,

        diagnostics.cmakelang,
        diagnostics.cpplint,
        diagnostics.flake8,
        diagnostics.markdownlint,
    },
})
