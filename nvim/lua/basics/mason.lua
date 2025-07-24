local servers = {
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    'dockerls',
    "html",
    "jsonls",
    'lemminx',
    "marksman",
    "pyright",
    "lua_ls",
    'sqlls',
    "tsserver",
    "yamlls",
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
