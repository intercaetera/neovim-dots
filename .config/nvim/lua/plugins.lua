vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Plugin manager
	use 'wbthomason/packer.nvim'

	-- Color scheme
	use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }

	-- Zen mode
	use 'junegunn/goyo.vim'

	-- LSP and Snippets
	use { 'neoclide/coc.nvim', branch = release }
	use 'SirVer/ultisnips'

	-- Miscellaneous
	use 'alvan/vim-closetag'
	use 'tpope/vim-surround'
	use 'tpope/vim-endwise'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-commentary'
	use 'jiangmiao/auto-pairs'
	use 'editorconfig/editorconfig-vim'

	-- Languages
	use 'sheerun/vim-polyglot'
	use 'MaxMEllon/vim-jsx-pretty'
	use 'peitalin/vim-jsx-typescript'
	use 'elixir-editors/vim-elixir'

	-- Neovim plugins
	use 'danilamihailov/beacon.nvim'
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
	use 'nvim-lualine/lualine.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
end)
