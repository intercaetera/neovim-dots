require('gitsigns').setup()
require('gitlinker').setup()

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
