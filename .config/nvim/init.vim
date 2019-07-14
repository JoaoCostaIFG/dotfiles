let mapleader ='\'

" PLUG
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" PLUGINS
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
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
call plug#end()

" THEME
	set termguicolors
	set background = "dark"
	colorscheme my_hashpunk
	set bg=dark

" AIRLINE
	let g:airline_theme='minimalist'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#bufferline#enabled = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail'
	let g:airline_detect_modified = 0
	let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
	let g:airline#extensions#ctrlspace#enabled = 1
	let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
	"let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z', 'error', 'warning' ] ]

" LIMELIGHT
	let g:limelight_conceal_ctermfg = 'gray'
	let g:limelight_conceal_ctermfg = 240
	let g:limelight_conceal_guifg = 'DarkGray'
	let g:limelight_conceal_guifg = '#777777'
	map <leader>n :Limelight!!<CR>

" GOYO
	map <leader>m :Goyo \| set bg=dark \| set linebreak<CR>
	autocmd! User GoyoEnter Limelight

" BASICS
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set splitbelow splitright
	set hidden
	set showtabline=0
	set go=a
	set mouse=a
	set nohlsearch
	set clipboard+=unnamedplus
	" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" AUTOCOMPLETION/LINT
	call deoplete#custom#option('sources', {
		\ '_': ['ale'],
	\})
	let g:ale_sign_error = '>>'
	let g:ale_sign_warning = '**'
	let g:airline#extensions#ale#enabled = 1
	"let g:ale_set_balloons = 1
	"set wildmode=longest,list,full

" SPELL-CHECK
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" NERDTREE
	map <leader>f :NERDTreeToggle<CR>
	"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress:
	"map <C-h> <C-w>h
	"map <C-j> <C-w>j
	"map <C-k> <C-w>k
	"map <C-l> <C-w>l

" Buffers
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

