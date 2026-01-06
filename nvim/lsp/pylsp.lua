vim.lsp.config("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = {},
					maxLineLength = 140,
				},
			},
		},
	},
})

return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
}
