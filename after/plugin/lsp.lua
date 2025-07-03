local servers = {
	'lua_ls',
	'ts_ls',
	'jsonls',
	'cssls',
	'html',
	'eslint',
	'astro',
	'hls', -- Haskell
	'clojure_lsp',
	'terraformls'
}

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = servers
})

vim.keymap.set('n', '<leader>[', function () vim.diagnostic.jump { count = -1, float = true } end, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>]', function () vim.diagnostic.jump { count = 1, float = true } end, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', 'K', function () vim.lsp.buf.hover { border = "rounded" } end, { desc = 'Show documentation' })

vim.lsp.buf_attach_client_options = {
	debounce_text_changes = 150
}

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function (event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)

		if client ~= nil then
			client.server_capabilities.document_formatting = true
		end

		local attach_opts = { silent = true, buffer = event.buf }

		vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration,
			vim.tbl_extend('force', attach_opts, { desc = "Go to declaration" }))

		vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition,
			vim.tbl_extend('force', attach_opts, { desc = "Go to definition" }))

		vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation,
			vim.tbl_extend('force', attach_opts, { desc = "Go to implementation" }))

		vim.keymap.set('n', '<leader>gr', vim.lsp.buf.rename,
			vim.tbl_extend('force', attach_opts, { desc = "Rename" }))

		vim.keymap.set({ 'n', 'x' }, '<leader>gf', function() vim.lsp.buf.format({ async = true }) end,
			vim.tbl_extend('force', attach_opts, { desc = "Format" }))

		vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.lsp.buf.signature_help,
			vim.tbl_extend('force', attach_opts, { desc = "Signature help" }))
	end
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config("*", {
	capabilities = capabilities
})

vim.lsp.config("elixirls", {
	cmd = { "/home/justinian/git/elixir-ls/release/language_server.sh" },
})

vim.lsp.enable(servers)

require('lazydev').setup({})
require('tailwind-tools').setup({})

local cmp = require('cmp')
local luasnip = require('luasnip')

luasnip.config.setup({})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-space>'] = cmp.mapping.complete({}),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false
		}),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer' },
	}),
})

-- Eslint format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
  command = 'silent! EslintFixAll',
  group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
})
