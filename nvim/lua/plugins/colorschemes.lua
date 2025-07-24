return {
	"folke/tokyonight.nvim",
	enabled = true,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "night",
		})
		vim.cmd([[colorscheme tokyonight]])
	end,
}
