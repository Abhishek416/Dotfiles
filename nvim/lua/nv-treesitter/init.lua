require'nvim-treesitter.configs'.setup {
	ensure_installed = 'all',
	highlight = {
		enable = true,
	},
	playground = {
		enable = true,
		disable = {},
		updateline = 25,
		persist_queries = false
	},
	rainbow = {
		enable = false,
	}
}

