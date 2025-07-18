if vim.g.vscode then
	-- VSCode extension
else
	-- ordinary Neovim
	require("config.lazy")
	require("config.keymaps")
	require("lsp")

	vim.cmd("colorscheme base16-paraiso")
end
