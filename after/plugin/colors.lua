local options = {
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
}

if vim.g.neovide then
	options = vim.tbl_extend('force', options, { transparent_background = false })
end

require("catppuccin").setup(options)

vim.cmd [[colorscheme catppuccin]]
