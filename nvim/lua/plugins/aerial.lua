return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			layout = {
				default_direction = "right",
			},
			filter_kind = {
				"Array",
				"Boolean",
				"Number",
				"String",
				"Variable",
				"Class",
				"Constructor",
				"Enum",
				"Function",
				"Interface",
				"Module",
				"Method",
				"Struct",
			},
			manage_folds = true,
			link_folds_to_tree = true,

			lsp = {
				-- If true, fetch document symbols when LSP diagnostics update.
				diagnostics_trigger_update = true,
			},
		})
	end,
}
