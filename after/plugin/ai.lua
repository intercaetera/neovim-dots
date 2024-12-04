require("avante_lib").load()
require("avante").setup({
	windows = {
		input = {
			height = 4,
		}
	}
})

require("render-markdown").setup({
	file_types = { "markdown", "Avante" },
})

