
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
