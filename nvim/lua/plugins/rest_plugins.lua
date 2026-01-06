return {
	-- Autotags
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = {
					["html"] = {
						enable_close = false,
					},
				},
			})
		end,
	},

	-- Comments
	{
		"numToStr/Comment.nvim",
		opts = {},
		config = function()
			require("Comment").setup()
		end,
	},

	-- Lazydev
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {},
	},

	-- Neogen
	{
		"danymat/neogen",
		config = true,
	},

	-- Todo-comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

    -- Markview
	{
		"OXY2DEV/markview.nvim",
		lazy = false,

		config = function()
			require("markview").setup({
                preview = {
                    icon_provider = "devicons"
                }
            })
		end,

		-- Completion for `blink.cmp`
		-- dependencies = { "saghen/blink.cmp" },
	},
}
