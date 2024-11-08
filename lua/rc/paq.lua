require "paq" {
	"savq/paq-nvim",

	-- Libraries
	'nvim-lua/plenary.nvim',
	'nvim-tree/nvim-web-devicons',
	'editorconfig/editorconfig-vim',

	-- Colors
	{ "catppuccin/nvim", as = "catppuccin" },

	-- Essentials
	'nvim-telescope/telescope.nvim',
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	'mbbill/undotree',
	'nvim-tree/nvim-tree.lua',
	'stevearc/aerial.nvim',
	'tpope/vim-fugitive',
	'folke/which-key.nvim',

	-- LSP
	'neovim/nvim-lspconfig',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'L3MON4D3/LuaSnip',
	'saadparwaiz1/cmp_luasnip',
	'folke/lazydev.nvim',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',

	-- Major modes
	'junegunn/goyo.vim',
	'stevearc/oil.nvim',

	-- Text editing essentials
	'alvan/vim-closetag',
	'tpope/vim-surround',
	'tpope/vim-endwise',
	'tpope/vim-commentary',
	'jiangmiao/auto-pairs',

	-- Languages
	'sheerun/vim-polyglot',
	'MaxMEllon/vim-jsx-pretty',
	'peitalin/vim-jsx-typescript',
	'elixir-editors/vim-elixir',
	'edwinb/idris2-vim',

	-- Git
	'nvim-lualine/lualine.nvim',
	'ruifm/gitlinker.nvim',
	'lewis6991/gitsigns.nvim',
}
