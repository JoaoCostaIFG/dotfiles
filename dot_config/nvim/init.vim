if &shell =~# 'fish$'
    set shell=bash
endif

let mapleader ='\'

" PLUG
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

" PLUGINS
call plug#begin('~/.config/nvim/plugged')
" default-ish things
Plug 'tpope/vim-sensible'
Plug 'moll/vim-bbye'
Plug 'stevearc/dressing.nvim' " cute prompt windows
Plug 'rcarriga/nvim-notify' " cure notifications
Plug 'easymotion/vim-easymotion' " move fast

" theming
Plug 'sainnhe/everforest'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" writing
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown' }
Plug 'ferrine/md-img-paste.vim'
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'
Plug 'folke/zen-mode.nvim' " the writting focus thing
Plug 'folke/twilight.nvim' " the thing that dims colors in for zen-mode

" tools
Plug 'voldikss/vim-floaterm' " adds support for the floaterm of lf
Plug 'ptzz/lf.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" programming
Plug 'norcalli/nvim-colorizer.lua' " colors become colored
Plug 'honza/vim-snippets' " snippets
Plug 'windwp/nvim-autopairs' " pairs
Plug 'scrooloose/nerdcommenter' " comments
Plug 'tpope/vim-surround' " work with delimiters
Plug 'lukas-reineke/indent-blankline.nvim' " indent guides
Plug 'dag/vim-fish' " fish shell
Plug 'ziglang/zig.vim' " zig lang
Plug 'tpope/vim-fugitive' " git plugin
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " python syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'} " the conqueror
call plug#end()

" auto reload config on VIMRC save
autocmd BufWritePost init.vim,.vimrc,_vimrc source $MYVIMRC

lua vim.notify = require("notify")

" BASICS
set nocompatible
filetype plugin on
syntax on
syntax enable

set listchars+=lead:⋅
noremap <silent> <F15> :set list!<CR>
"can use "│" and "▏"
lua << EOF
  require("indent_blankline").setup {
    char = "▏",
    space_char_blankline = " ",
    buftype_exclude = {"terminal"}
  }
EOF
noremap <silent> <F3> :IndentBlanklineToggle<CR>
set ts=2 sts=2 sw=2 expandtab
set number relativenumber

set mouse=a
set scrolloff=5
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
" use rename-and-write-new
set backupcopy=yes
if exists('$SUDO_USER')
  " don't create root owned files
  set nobackup
  set nowritebackup
  set noswapfile
  set noundofile
else
  " protect against crash-during-write
  set writebackup
  " but do not persist backup after successful write
  set nobackup

  set swapfile
  set directory^=~/.local/share/nvim/swap//

  " persist the undo tree for each file
  set undofile
  set undodir^=~/.local/share/nvim/undo//
endif

set hidden
" Repeat last macro
noremap , @@
" Better long line movement
nnoremap j gj
nnoremap k gk
" Save File and Exits
command E e
command WQ wq
command Wq wq
command W w
command Q q
" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" THEME
if has('termguicolors')
  set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
let g:everforest_enable_italic = 1
let g:everforest_transparent_background = 1
let g:everforest_diagnostic_line_highlight = 1
colorscheme everforest
"color highlighting for CSS
lua require'colorizer'.setup()

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

" formating
" Format for auto file formatting
command! -nargs=0 Format :call CocAction('format')
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <silent> <F1> :Format<CR>
inoremap <silent> <F1> <C-o>:Format<CR>

" WRITING
" zen-mode
lua << EOF
  require("twilight").setup {
    dimming = {
      alpha = 1.0,
      color = { "DarkGray", "#777777" },
    },
  }
EOF
nnoremap <leader>m :Twilight<CR>
lua << EOF
  require("zen-mode").setup {
    on_open = function(_)
      vim.cmd 'cabbrev <buffer> q let b:quitting = 1 <bar> q'
      vim.cmd 'cabbrev <buffer> wq let b:quitting = 1 <bar> wq'
    end,
    on_close = function()
      if vim.b.quitting == 1 then
        vim.b.quitting = 0
        vim.cmd 'q'
      end
    end,
  }
EOF
nnoremap <leader>n :ZenMode<CR>

" misc
set thesaurus+=~/Documents/WorkRes/thesaurus.txt
" spell-check
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>O :setlocal spell! spelllang=pt<CR>

" MARKDOWN
" image paste
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" theme
let g:mkdp_markdown_css="/home/joao/Documents/WorkRes/markdown.css"
let g:mkdp_port = '8542'

" AIRLINE
let g:airline_theme = 'everforest'
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
" make it more equivalent to the markdown one
let g:table_mode_header_fillchar = '-'

" AUTO-PAIRS
let g:AutoPairsMapCh = 0

" NERD COMMENTER
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1

" LF
let g:lf_replace_netrw = 1 " open lf when vim open a directory
let g:lf_map_keys = 0
nnoremap - :LfWorkingDirectory<cr>

lua require('nvim-autopairs').setup()

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

map <silent> <C-h> :CtrlSpaceGoUp<CR>
map <silent> <C-l> :CtrlSpaceGoDown<CR>

nnoremap <Leader>q :Bdelete<CR>

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

" vim -b : edit binary using xxd-format!
" see :h hex-editing
augroup Binary
  au!
  au BufReadPre  *.bin,*.exe let &bin=1
  au BufReadPost *.bin,*.exe if &bin | %!xxd
  au BufReadPost *.bin,*.exe set ft=xxd | endif
  au BufWritePre *.bin,*.exe if &bin | %!xxd -r
  au BufWritePre *.bin,*.exe endif
  au BufWritePost *.bin,*.exe if &bin | %!xxd
  au BufWritePost *.bin,*.exe set nomod | endif
augroup END
