return {
    { "L3MON4D3/LuaSnip", keys = {} },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        version = "*",
        config = function()
            require("blink.cmp").setup({
                snippets = { preset = "luasnip" },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                    providers = {
                        cmdline = {
                            min_keyword_length = 2,
                        },
                    },
                },
                keymap = {
                    ["<Tab>"] = { "select_next", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "fallback" },
                    ["<C-o>"] = { "select_and_accept", "fallback" },
                },
                cmdline = {
                    enabled = true,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                    },
                },
                completion = {
                    menu = {
                        border = nil,
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label",      "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = nil,
                            scrollbar = false,
                            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                        },
                        auto_show = true,
                        auto_show_delay_ms = 500,
                    },
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
        'saghen/blink.pairs',
        version = '*', -- (recommended) only required with prebuilt binaries

        -- download prebuilt binaries from github releases
        dependencies = 'saghen/blink.download',
        -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        --- @module 'blink.pairs'
        --- @type blink.pairs.Config
        opts = {
            mappings = {
                -- you can call require("blink.pairs.mappings").enable() and require("blink.pairs.mappings").disable() to enable/disable mappings at runtime
                enabled = true,
                -- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
                -- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
                disabled_filetypes = {},
                -- see the defaults: https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L12
                pairs = {},
            },
            highlights = {
                enabled = true,
                groups = {
                    'BlinkPairsOrange',
                    'BlinkPairsPurple',
                    'BlinkPairsBlue',
                },
                -- unmatched_group = 'BlinkPairsUnmatched',
                matchparen = {
                    enabled = true,
                    group = 'MatchParen',
                },
            },
            debug = false,
        }
    }
}
