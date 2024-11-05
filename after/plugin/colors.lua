require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	show_end_of_buffer = true,
	color_overrides = {
		mocha = {
			signcolumn = "transparent_background"
		},
	},
	integrations = {
		nvimtree = true,
	}
})

vim.cmd [[colorscheme catppuccin]]
vim.opt.termguicolors = true
