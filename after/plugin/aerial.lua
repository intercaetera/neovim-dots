require("aerial").setup({
	on_attach = function(bufnr)
		vim.keymap.set("n", "<Leader>{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
		vim.keymap.set("n", "<Leader>}", "<cmd>AerialNext<CR>", { buffer = bufnr })
	end
})

vim.keymap.set("n", "<Leader>a", "<cmd>AerialToggle!<CR>")
