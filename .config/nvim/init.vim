let mapleader ='\'

" PLUG
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" PLUGINS
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'abnt713/vim-hashpunk'
Plug 'fenetikm/falcon'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdcommenter'
Plug 'ptzz/lf.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-fugitive'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
Plug 'Chiel92/vim-autoformat'

" Plug 'jackguo380/vim-lsp-cxx-highlight'
call plug#end()

" BASICS
set nocompatible
filetype plugin on
syntax on
syntax enable

" Tabs
noremap <silent> <F3> :set list! <CR>
noremap <silent> <F1> :Autoformat <CR>
command Format Autoformat

set ts=2 sts=2 sw=2 expandtab
set number relativenumber

" Turn off backup
set noswapfile
set nobackup
set nowritebackup

set hidden
set mouse=a
set cmdheight=2
set updatetime=300
set shortmess=a
set signcolumn=yes
set encoding=utf-8
set splitbelow splitright
set showtabline=0
set nohlsearch ignorecase smartcase
set clipboard+=unnamedplus

" Repeat last macro
noremap , @@
" Save File and Exits
noremap <silent> <F5> :w<CR>
noremap <silent> <F6> :wq<CR>
command WQ wq
command Wq wq
command W w
command Q q

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

nnoremap <silent> <F4> :call <SID>StripTrailingWhitespaces()<CR>
" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre *.py,*.c,*.cpp,*.h,*.txt :call <SID>StripTrailingWhitespaces()
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" THEME
set termguicolors
set background=dark
colorscheme my_hashpunk

" COC
" make <tab> used for trigger completion, completion confirm,
" snippet expand and jump like VSCode
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ "<TAB>"
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'

" close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" use k to show documentation in preview window
" nn <silent> K :call CocActionAsync('doHover')<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" AIRLINE
let g:airline_theme = 'falcon'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
let g:airline_detect_modified = 0
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
" let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z', 'error', 'warning' ] ]
let airline#extensions#coc#error_symbol = '!'
let airline#extensions#coc#warning_symbol = '.'

" LIMELIGHT
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
map <leader>n :Limelight!!<CR>

" GOYO
map <leader>m :Goyo \| set bg=dark \| set linebreak<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" TABLEMODE
let g:table_mode_header_fillchar = '='

" AUTO-PAIRS
let g:AutoPairsMapBS = 1
let g:AutoPairsMapCh = 0

" SPELL-CHECK
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>O :setlocal spell! spelllang=pt_pt<CR>

" NERD COMMENTER
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" LF
let g:lf_replace_netrw = 1 " open lf when vim open a directory

" EASY-ALIGN
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" CTRLSPACE
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
nnoremap <silent> <C-p> :CtrlSpace O<CR>
let g:CtrlSpaceCacheDir = expand("$HOME/.config/nvim/")
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceUseUnicode = 0
let g:CtrlSpaceUseTabline = 0
let g:CtrlSpaceUseArrowsInTerm = 1

tnoremap <Esc> <C-\><C-n>
map <leader>T :enew<cr>
map <silent> <C-h> :CtrlSpaceGoUp<CR>
map <silent> <C-l> :CtrlSpaceGoDown<CR>
map <leader>bq :bp <BAR> bd #<CR>
map <leader>bs :ls<CR>
