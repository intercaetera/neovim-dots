-- Setup nvim tree file viewer
require('nvim-tree').setup({
		view = {
			adaptive_size = true,
			mappings = {
				list = {
					{ key = "s", action = "vsplit" },
					{ key = "i", action ="split" }
				}
			}
		},
		actions = {
			open_file = {
				window_picker = {
					enable = false
				}
			}
		}
	})

require('lualine').setup()

-- Setup treesitter
require('nvim-treesitter.configs').setup {
	ensure_installed = { "javascript", "typescript", "lua" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	}
}

-- Setup telescope
require('telescope').setup{
	defaults = { file_ignore_patterns = { "node_modules", "dist", "build" } }
}
