require('mason').setup({})
require('mason-lspconfig').setup({})

local servers = {
	'lua_ls',
	'ts_ls',
	'jsonls',
	'cssls',
	'html',
	'elixirls',
	'eslint',
	'astro',
	'hls', -- Haskell
}

vim.keymap.set('n', '<leader>[', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>]', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show documentation' })

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded"
})

local lspconfig = require('lspconfig')
local on_attach = function (_, bufnr)
	local attach_opts = { silent = true, buffer = bufnr }

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

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

require('lazydev').setup({})

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
		['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}),
})