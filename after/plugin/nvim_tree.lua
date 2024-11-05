vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local api = require "nvim-tree.api"

vim.keymap.set("n", "<leader>r", api.tree.toggle, { desc = "Toggle nvim-tree" })
vim.keymap.set("n", "<leader>y", api.tree.find_file, { desc = "Find file in nvim-tree" })

local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set('n', 's', api.node.open.vertical, opts('Vertical Split'))
	vim.keymap.set('n', 'v', api.node.open.horizontal, opts('Horizontal Split'))
end

require("nvim-tree").setup {
	on_attach = my_on_attach
}
