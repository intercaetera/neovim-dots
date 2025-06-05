require("obsidian").setup({
	workspaces = {
		{
			name = "vault",
			path = "~/obsidian",
		},
	},
	notes_subdir = "notes",
	daily_notes = {
		folder = "notes/daily",
	},
	disable_frontmatter = true,
})
