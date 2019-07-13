let mapleader ='\'

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'abnt713/vim-hashpunk'
Plug 'tpope/vim-eunuch'
Plug 'vim-ctrlspace/vim-ctrlspace'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

call plug#end()

set bg=dark
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus

" Set theme
set termguicolors
set background = "dark"
colorscheme my_hashpunk

" Airline
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
map <leader>n :Limelight!!<CR>

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
" Enable autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Goyo plugin makes text more readable when writing prose:
	map <leader>m :Goyo \| set bg=dark \| set linebreak<CR>
	autocmd! User GoyoEnter Limelight

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>f :NERDTreeToggle<CR>
	" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress:
	"map <C-h> <C-w>h
	"map <C-j> <C-w>j
	"map <C-k> <C-w>k
	"map <C-l> <C-w>l

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Automatically deletes all trailing whitespace on save.
	" autocmd BufWritePre * %s/\s\+$//e

" Buffers
	set hidden
	set showtabline=0

	let g:CtrlSpaceDefaultMappingKey = "<C-space> "
	nnoremap <silent><C-p> :CtrlSpace O<CR>
	let g:CtrlSpaceCacheDir = $HOME"/.config/nvim/.cs_cache"
	let g:CtrlSpaceUseUnicode = 0
	let g:CtrlSpaceUseTabline = 1
	let g:CtrlSpaceUseArrowsInTerm = 1
	let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
	let g:CtrlSpaceLoadLastWorkspaceOnStart = 1

	hi CtrlSpaceSearch guifg=#9B2551 guibg=#282C34 gui=bold,italic ctermfg=2 ctermbg=NONE term=NONE cterm=NONE
	hi CtrlSpaceNormal guifg=#E0254C guibg=#282C34 gui=NONE ctermfg=2 ctermbg=NONE term=NONE cterm=NONE
	hi CtrlSpaceSelected guifg=#76A15D guibg=#282C34 gui=bold,italic ctermfg=2 ctermbg=NONE term=NONE cterm=NONE
	hi CtrlSpaceStatus guifg=#EEEEEE guibg=#3E4452 gui=bold ctermfg=2 ctermbg=NONE term=NONE cterm=NONE

	map <leader>T :enew<cr>
	map <leader>h :CtrlSpaceGoUp<CR>
	map <leader>l :CtrlSpaceGoDown<CR>
	map <C-h> :CtrlSpaceGoUp<CR>
	map <C-l> :CtrlSpaceGoDown<CR>
	map <leader>bq :bp <BAR> bd #<CR>
	"map <leader>bs :ls<CR>
	map <leader>s :CtrlSpaceSaveWorkspace<CR>

