set nocompatible
lua require('plugins')
lua require('init')

let mapleader = ' '
let maplocalleader = ','

" reload config
command RC source ~/.config/nvim/init.vim

syntax on
filetype plugin indent on
colorscheme pywal

set mouse=a
set nohlsearch
set number
set relativenumber
set completeopt=menu,menuone,noselect

set backupdir=~/.vim/backup   " swap files
set directory=~/.vim/backup

set wrap linebreak nolist     " word wrap
set clipboard=unnamedplus     " clipboard
set wildmode=longest,list,full
set wildignore+=node_modules,*.swp,*.zip,dist,build,deps
set path=.,src,lua            " file suffixes
set suffixesadd=.js,.jsx,.ts,.tsx,.vue,.svelte,.lua
set signcolumn=yes

" fold to jsdoc comments
set foldmethod=marker
set foldmarker=/**,*/

" disable automatic comment on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" navigation
noremap <S-Left> 10h
noremap <S-Down> 10j
noremap <S-Up> 10k
noremap <S-Right> 10l

" splits (Ctrl+Arrows to switch between splits)
nnoremap <C-Left> <C-W><Left>
nnoremap <C-Right> <C-W><Right>
nnoremap <C-Up> <C-W><Up>
nnoremap <C-Down> <C-W><Down>
set splitbelow
set splitright

" tabs and spaces
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2

" files, buffers, windows
set autoread
set encoding=utf-8
set fileencoding=utf-8
set hidden
set noswapfile

" persistent undo
set undodir="$HOME/.local/share/nvim/undo"
set undofile
set undolevels=100
set undoreload=1000
set updatetime=500

""" PLUGINS
" goyo
nnoremap <F6> :Goyo<cr>
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

function! s:goyo_enter()
	set spell spelllang=en_gb
	noremap <buffer> <silent> <Up> gk
	noremap <buffer> <silent> <Down> gj
endfunction

function! s:goyo_leave()
	set nospell
	nunmap <buffer> <Up>
	nunmap <buffer> <Down>
	colorscheme pywal
endfunction

" tree
map <Leader>r :NvimTreeToggle<CR>
map <Leader>y :NvimTreeFindFile<CR>

" closetag
let g:closetag_filenames = "*.html,*.js,*.vue,*.re,*.ts,*.tsx"

" jsx
let g:jsx_ext_required = 0

" telescope
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fK <cmd>Telescope help_tags<cr>

" ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger = "<C-e>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" coc
let g:coc_global_extensions = [
			\'coc-tsserver',
			\'coc-json',
			\'coc-css',
			\'coc-ultisnips',
			\'coc-html',
			\'coc-svelte',
			\'coc-elixir',
			\'coc-eslint',
			\'coc-diagnostic']

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>cr <Plug>(coc-rename)
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)
vmap <leader>gp <Plug>(coc-format-selected)
nmap <leader>gp <Plug>(coc-format-selected)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>qF :call CocAction('format')<CR>

inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
