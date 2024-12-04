vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<S-Left>", "10h")
vim.keymap.set("n", "<S-Down>", "10j")
vim.keymap.set("n", "<S-Up>", "10k")
vim.keymap.set("n", "<S-Right>", "10l")

vim.keymap.set("n", "<C-Left>", "<C-W><Left>")
vim.keymap.set("n", "<C-Right>", "<C-W><Right>")
vim.keymap.set("n", "<C-Up>", "<C-W><Up>")
vim.keymap.set("n", "<C-Down>", "<C-W><Down>")

vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Yanks to clipboard register with the filename.
function YankWithFilename()
	local comment = vim.bo.commentstring
	local filename = string.gsub(vim.api.nvim_buf_get_name(0), vim.loop.cwd(), '')

	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos("'>")
	local line_start = vstart[2]
	local line_end = vend[2]

	local lines = vim.api.nvim_buf_get_lines(0, line_start - 1, line_end, false)

	local string = string.format(comment, filename) .. "\n" .. table.concat(lines, "\n")

	vim.fn.setreg("+", string)
end

vim.keymap.set("v", "<leader>y", ":lua YankWithFilename()<CR>", { desc = "Yanks to clipboard with the filename prepended in a matching comment." })
