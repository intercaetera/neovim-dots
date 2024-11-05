require('nvim-treesitter.configs').setup({
	ensure_installed = { "javascript", "typescript", "elixir", "c", "lua", "vim", "vimdoc", "query", "heex", "eex", "html", "surface", "latex", "astro" },

	ignore_install = {},

	modules = {},

	sync_install = false,

	auto_install = true,

	indent = {
		enable = true,
	},

	highlight = {
		enable = true,
	},
})
