
require'lspconfig'.pyright.setup {
    cmd = {"pyright-langserver", "--stdio"},
	 settings = {
      python = {
        analysis = {
		  typeCheckingMode = true,
		  autoSearchPaths = true,
          useLibraryCodeForTypes = true
        }
      }
    }
}
