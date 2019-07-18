let mapleader ='\'

" PLUG
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" PLUGINS
call plug#begin('~/.config/nvim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'abnt713/vim-hashpunk'
Plug 'tpope/vim-eunuch'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'dhruvasagar/vim-table-mode'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
call plug#end()


" BASICS
	set nocompatible
	filetype plugin on
	syntax on
	syntax enable
	set number relativenumber
	set nobackup
	set nowritebackup
	set hidden
	set mouse=a
	set cmdheight=2
	set updatetime=300
	set shortmess=ac
	set signcolumn=yes
	set encoding=utf-8
	set splitbelow splitright
	set showtabline=0
	set nohlsearch
	set clipboard+=unnamedplus
	noremap <F5> :w<CR>
	" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
	" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e


" THEME
	set termguicolors
	set background = "dark"
	colorscheme my_hashpunk
	set bg=dark


" COC
	" TAB select the first completion item and confirm the completion when no item has been selected/select currently pointed to item
	" This 2 work but they don't tab through snippets and need some options to work perfectly. The one given in the docs is perfect
	"inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "<TAB>"
	"inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "<TAB>"

	" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCod
	inoremap <silent><expr> <TAB>
      		\ pumvisible() ? coc#_select_confirm() :
      		\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      		\ <SID>check_back_space() ? "\<TAB>" :
      		\ coc#refresh()
	function! s:check_back_space() abort
  		let col = col('.') - 1
  		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction
	let g:coc_snippet_next = '<tab>'

	" Use <C-k> for jump to previous placeholder
	let g:coc_snippet_prev = '<c-k>'
	" Use <C-j> for both expand and jump (make expand higher priority.)
	imap <C-j> <Plug>(coc-snippets-expand-jump)

	" Close the preview window when completion is done
	autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>
	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
        		execute 'h '.expand('<cword>')
    		else
        		call CocAction('doHover')
		endif
	endfunction


" AIRLINE
	let g:airline_theme='minimalist'
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#bufferline#enabled = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail'
	let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
	let g:airline_detect_modified = 0
	let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
	"let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z', 'error', 'warning' ] ]

	let g:airline#extensions#ctrlspace#enabled = 1
	let g:airline#extensions#coc#enabled = 1
	let airline#extensions#coc#error_symbol = '!: '
	let airline#extensions#coc#warning_symbol = '.:'


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


" NERDTREE
	map <leader>f :NERDTreeToggle<CR>
	"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" Shortcutting split navigation, saving a keypress:
	"map <C-h> <C-w>h
	"map <C-j> <C-w>j
	"map <C-k> <C-w>k
	"map <C-l> <C-w>l


" CTRLSPACE
	let g:CtrlSpaceDefaultMappingKey = "<C-space> "
	nnoremap <silent><C-p> :CtrlSpace O<CR>
	let g:CtrlSpaceCacheDir = expand("$HOME/.config/nvim/")
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

