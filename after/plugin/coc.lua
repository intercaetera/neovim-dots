-- local keyset = vim.keymap.set

-- vim.g.coc_global_extensions = {
-- 	"coc-lua",
-- 	"coc-tsserver",
-- 	"coc-json",
-- 	"coc-css",
-- 	"coc-ultisnips",
-- 	"coc-html",
-- 	"coc-elixir",
-- 	"coc-eslint",
-- 	"coc-diagnostic",
-- 	"@yaegassy/coc-astro"
-- }

-- function _G.check_back_space()
-- 	local col = vim.fn.col('.') - 1
-- 	return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end

-- local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
-- keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
-- keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- keyset("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- keyset("i", "<C-e>", "<Plug>(coc-snippets-expand-jump)")
-- keyset("i", "<C-space>", "coc#refresh()", { silent = true, expr = true })

-- keyset("n", "<leader>[", "<Plug>(coc-diagnostic-prev)", { silent = true })
-- keyset("n", "<leader>]", "<Plug>(coc-diagnostic-next)", { silent = true })

-- function _G.show_docs()
-- 	local cw = vim.fn.expand('<cword>')
-- 	if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
-- 		vim.api.nvim_command('h ' .. cw)
-- 	elseif vim.api.nvim_eval('coc#rpc#ready()') then
-- 		vim.fn.CocActionAsync('doHover')
-- 	else
-- 		vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
-- 	end
-- end

-- keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- vim.api.nvim_create_augroup("CocGroup", {})

-- keyset("n", "<leader>gd", "<Plug>(coc-definition)", { silent = true })
-- keyset("n", "<leader>cr", "<Plug>(coc-rename)", { silent = true })
-- keyset("x", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
-- keyset("n", "<leader>f", "<Plug>(coc-format-selected)", { silent = true })

-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = "CocGroup",
-- 	pattern = "typescript,json",
-- 	command = "setl formatexpr=CocAction('formatSelected')",
-- 	desc = "Setup formatexpr specified filetype(s)."
-- })

-- vim.api.nvim_create_autocmd("User", {
-- 	group = "CocGroup",
-- 	pattern = "CocJumpPlaceholder",
-- 	command = "call CocActionAsync('showSignatureHelp')",
-- 	desc = "Update signature help on jump placeholder"
-- })

-- vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
-- vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })
-- vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
