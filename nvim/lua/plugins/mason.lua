return {
    {
        "williamboman/mason.nvim",
        lazy = false, -- Load immediately to ensure PATH is set
        cmd = "Mason",
        keys = { },
        build = ":MasonUpdate",
        opts = {
            ensure_installed = {
                -- LSP servers (matching your vim.lsp.enable() config)
                "lua-language-server",         -- Lua LSP
                "typescript-language-server",  -- TypeScript LSP
                "intelephense",                -- PHP LSP
                "html-lsp",                    -- HTML LSP
                "css-lsp",                     -- CSS LSP
                "clangd",                      -- C/C++ LSP
                "cmake-language-server",       -- CMake LSP

                -- Formatters (for conform.nvim and general use)
                "stylua",
                "prettier",
                "black",
                "isort",
                "clang-format",
                "cmakelang",
                "autopep8",
                "basedpyright",

                -- Linters and diagnostics

                -- Optional but useful additions
                "markdownlint", -- Markdown linting
                "yamllint",     -- YAML linting
                "jsonlint",     -- JSON linting
            },
                ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
        config = function(_, opts)
            -- PATH is handled by core.mason-path for consistency
            require("mason").setup(opts)

            -- Auto-install ensure_installed tools with better error handling
            local mr = require("mason-registry")
            local function ensure_installed()
                for _, tool in ipairs(opts.ensure_installed) do
                    if mr.has_package(tool) then
                        local p = mr.get_package(tool)
                        if not p:is_installed() then
                            vim.notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)
                            p:install():once("closed", function()
                                if p:is_installed() then
                                    vim.notify("Mason: Successfully installed " .. tool, vim.log.levels.INFO)
                                else
                                    vim.notify("Mason: Failed to install " .. tool, vim.log.levels.ERROR)
                                end
                            end)
                        end
                    else
                        vim.notify("Mason: Package '" .. tool .. "' not found", vim.log.levels.WARN)
                    end
                end
            end

            if mr.refresh then
                mr.refresh(ensure_installed)
            else
                ensure_installed()
            end
        end,
    },
}
