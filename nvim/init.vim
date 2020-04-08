let mapleader ='\'

" PLUG
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" PLUGINS
call plug#begin('~/.config/nvim/plugged')
Plug 'fenetikm/falcon'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'abnt713/vim-hashpunk'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'

Plug 'rbgrouleff/bclose.vim'
Plug 'ptzz/lf.vim'
Plug 'moll/vim-bbye'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-fugitive'

Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
call plug#end()

" BASICS
set nocompatible
filetype plugin on
syntax on
syntax enable

noremap <silent> <F3> :set list! <CR>
set ts=2 sts=2 sw=2 expandtab
set number relativenumber

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

" Backup stuff
set swapfile
set directory^=~/.local/share/vim/swap//
" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" persist the undo tree for each file
set undofile
set undodir^=~/.local/share/vim/undo//

set hidden
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

" THEME
set termguicolors
" set background=dark
colorscheme my_hashpunk

" COC
" make <tab> used for trigger completion, completion confirm, snippet expand and jump
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ "<TAB>"
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'
" close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" use k to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    " nn <silent> K :call CocActionAsync('doHover')<cr>
    call CocActionAsync('doHover')
  endif
endfunction

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Show all diagnostics
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nnoremap <silent> <space>p :<C-u>CocListResume<CR>

" ALE
" let g:ale_enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_set_balloons = 1
" format
nmap <F1> <Plug>(ale_fix)
command Format ALEFix
let g:ale_fixers = {
      \ 'bash': ['shfmt'],
      \ 'c': ['clang-format'],
      \ 'cpp': ['clang-format'],
      \ 'css': ['prettier'],
      \ 'html': ['prettier'],
      \ 'java': ['clang-format'],
      \ 'javascript': ['prettier'],
      \ 'json': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'python': ['black'],
      \ 'sh': ['shfmt'],
      \ 'text': ['SimpFormat'],
      \}
" lint
let g:ale_linters_explicit = 1
"'redpen', 'write-good'
let g:ale_linters = {
      \ 'bash': ['shellcheck'],
      \ 'mail': ['languagetool'],
      \ 'markdown': ['languagetool'],
      \ 'sh': ['shellcheck'],
      \ 'text': ['languagetool'],
      \}
" signs
let g:ale_sign_error = '!'
let g:ale_sign_warning = '.'

" WRITING
" limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
map <leader>n :Limelight!!<CR>
" goyo
map <leader>m :Goyo \| set bg=dark \| set linebreak<CR>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" misc
set thesaurus+=~/Documents/WorkRes/thesaurus.txt
" spell-check
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>O :setlocal spell! spelllang=pt_pt<CR>

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

" EASY-ALIGN
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" TABLEMODE
let g:table_mode_header_fillchar = '='

" AUTO-PAIRS
let g:AutoPairsMapBS = 1
let g:AutoPairsMapCh = 0

" NERD COMMENTER
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" LF
let g:lf_replace_netrw = 1 " open lf when vim open a directory

" CTRLSPACE
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
nnoremap <silent> <C-p> :CtrlSpace O<CR>
let g:CtrlSpaceCacheDir = expand("$HOME/.local/share/vim/")
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

" MISC
" substitute all non-ascii chars by a space
function! RM_non_ascii()
  %s/[^[:alnum:][:punct:][:space:]]/ /g
endfunction

" save state/pos of cursor -> execute cmd -> restore cursor
" source: http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" formating
" strip white spaces
command StripTrailWhiteChars call Preserve("%s/\\s\\+$//e")
nmap <silent> _$ :StripTrailWhiteChars<CR>
autocmd BufWritePre *.txt StripTrailWhiteChars
" retab
nmap <silent> _= :call Preserve("normal gg=G")<CR>

" simple format (variatic because of ALE)
function! SimpFormat(...)
  call Preserve("retab")
  call Preserve("%s/\\s\\+$//e")
  call Preserve("normal gg=G")
endfunction
