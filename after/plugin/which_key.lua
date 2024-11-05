require("which-key").setup({
	delay = 1000,
	spelling = true,
})

vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = false })
end)
