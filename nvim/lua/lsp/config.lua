#! /usr/bin/env lua

require'lspconfig'.bashls.setup{
}

require'lspconfig'.dockerls.setup{
}

require'lspconfig'.cmake.setup{
}

require'lspconfig'.groovyls.setup{
    cmd = { "java", "-jar", "/home/wasky/Tools/lsp/groovy-language-server/build/libs/groovy-language-server-all.jar" },
}

