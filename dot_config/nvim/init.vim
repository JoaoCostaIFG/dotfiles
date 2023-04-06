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
" basics/default-ish things
Plug 'tpope/vim-sensible'
Plug 'moll/vim-bbye'
Plug 'stevearc/dressing.nvim' " cute prompt windows
Plug 'rcarriga/nvim-notify' " cute notifications
Plug 'tpope/vim-repeat' " repeats whole maps instead of last cmd in map (dependency of leap)
Plug 'ggandor/leap.nvim' " general-purpose motion plugin

" theming
Plug 'sainnhe/everforest'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua' " colors become colored

" writing
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown' }
Plug 'ferrine/md-img-paste.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'
Plug 'folke/zen-mode.nvim' " the writting focus thing
Plug 'folke/twilight.nvim' " the thing that dims colors in for zen-mode

" tools
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm' " adds support for the floaterm of lf
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" programming
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " treesitter
Plug 'sheerun/vim-polyglot' " all langs syntax highlight
Plug 'kristijanhusak/vim-carbon-now-sh' " export code snippets
Plug 'honza/vim-snippets' " snippets
Plug 'windwp/nvim-autopairs' " pairs
Plug 'scrooloose/nerdcommenter' " comments
Plug 'tpope/vim-surround' " work with delimiters
Plug 'lukas-reineke/indent-blankline.nvim' " indent guides
Plug 'tpope/vim-fugitive' " git plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'} " the conqueror
Plug 'github/copilot.vim'
call plug#end()

 """"""""""""""""""""""""""""""""""""""""""""" 
"      ___    ___    ____   ___  _____  ____  "
"    / __ ) /   |  / ___/ /  _// ____// ___/  "
"   / __  |/ /| |  \__ \  / / / /     \__ \   "
"  / /_/ // ___ | ___/ /_/ / / /___  ___/ /   "
" /_____//_/  |_|/____//___/ \____/ /____/    "
"                                             "
 """""""""""""""""""""""""""""""""""""""""""""
" auto reload config on VIMRC save
autocmd BufWritePost init.vim,.vimrc,_vimrc source $MYVIMRC
nnoremap <Leader>q :Bdelete<CR>
lua vim.notify = require("notify")

set nocompatible
filetype plugin on
syntax on
syntax enable

set listchars+=lead:⋅
noremap <silent> <F15> :set list!<CR>
set ts=2 sts=2 sw=2 expandtab
set number relativenumber

set mouse=a
set scrolloff=5
set cmdheight=2
set updatetime=300
set shortmess=a
set signcolumn=yes " always show sign column (no shift when diagnostics run)
set encoding=utf-8
set splitbelow splitright
set showtabline=0
set nohlsearch ignorecase smartcase
set clipboard+=unnamedplus

" ctrl+s to save
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" backup stuff
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

" set Leap keymaps
lua require('leap').set_default_keymaps()

 """""""""""""""""""""""""""""""""""""""""""""""""""
"    _____  _   _  _____  _   __  ___ _   __  _____ "
"  /_  __// / / // ____//  |/  //  _// | / // ____/ "
"   / /  / /_/ // __/  / /|_/ / / / /  |/ // / __   "
"  / /  / __  // /___ / /  / /_/ / / /|  // /_/ /   "
" /_/  /_/ /_//_____//_/  /_//___//_/ |_/ \____/    "
"                                                   "
 """"""""""""""""""""""""""""""""""""""""""""""""""" 
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
lua require("colorizer").setup()
" AIRLINE
let g:airline_theme = 'everforest'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_detect_modified = 0
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z', 'error', 'warning' ] ]
let airline#extensions#coc#error_symbol = '!'
let airline#extensions#coc#warning_symbol = '.'

 """"""""""""""""""""""""""""""""""""""""""""""""""" 
"  _        _  ___    ___  _____  ___  _   _  _____ "
" | |     / // __ \ /  _//_  __//  _// | / // ____/ "
" | | /| / // /_/ / / /   / /   / / /  |/ // /___   "
" | |/ |/ // _, _/_/ /   / /  _/ / / /|  // /_  /   "
" |__/|__//_/ |_|/___/  /_/  /___//_/ |_/ \____/    "
"                                                   "
 """"""""""""""""""""""""""""""""""""""""""""""""""" 
" MARKDOWN
" image paste
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" markdown preview
let g:mkdp_markdown_css="/home/joao/.config/nvim/markdown.css"
let g:mkdp_port = '8542'
" TABLEMODE
" make it more equivalent to the markdown one
let g:table_mode_header_fillchar = '-'
" EASY-ALIGN
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" ZEN-MODE + TWILIGHT
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
" spell-check
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>O :setlocal spell! spelllang=pt<CR>

 """"""""""""""""""""""""""""""""""""
"    _____  ___    ___    _     ____ "
"  /_  __//  _ \ /  _ \ / /   / ___/ "
"   / /  / / / // / / // /    \__ \  "
"  / /  / /_/ // /_/ // /___  __/ /  "
" /_/   \____/ \____//_____//____/   "
"                                    "
 """"""""""""""""""""""""""""""""""""
" LF
let g:lf_replace_netrw = 1 " open lf when vim open a directory
let g:lf_map_keys = 0
nnoremap - :LfWorkingDirectory<cr>
" CTRLSPACE
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
nnoremap <silent> <C-p> :CtrlSpace O<CR>
map <silent> <C-h> :CtrlSpaceGoUp<CR>
map <silent> <C-l> :CtrlSpaceGoDown<CR>
let g:CtrlSpaceCacheDir = expand("$HOME/.local/share/vim/")
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceUseUnicode = 0
let g:CtrlSpaceUseTabline = 0
let g:CtrlSpaceUseArrowsInTerm = 1
" RIP-GREP
nnoremap _ :Rg<cr>

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"      ___    ___    ___    _____  ___    __      _   __  _  ___  ___ _    _  _____ "
"    / __ \ / __ \ / __ \ / ____// __ \ /   |   /  |/  //  |/  //  _// | / // ____/ "
"   / /_/ // /_/ // / / // / __ / /_/ // /| |  / /|_/ // /|_/ / / / /  |/ // / __   "
"  / ____// _, _// /_/ // /_/ // _, _// ___ | / /  / // /  / /_/ / / /|  // /_/ /   "
" /_/    /_/ |_| \____/ \____//_/ |_|/_/  |_|/_/  /_//_/  /_//___//_/ |_/ \____/    "
"                                                                                   "
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" AUTO-PAIRS
lua << EOF
require('nvim-autopairs').setup{
  map_c_w = true
}
EOF
" NERD COMMENTER
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
" disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" INDENT LINES
lua << EOF
require("indent_blankline").setup {
  -- can use "│" and "▏"
  char = "▏",
  space_char_blankline = " ",
  buftype_exclude = {"terminal"}
}
EOF
noremap <silent> <F3> :IndentBlanklineToggle<CR>
" COC
" make <tab> used for trigger completion, completion confirm, snippet expand and jump
" use <C-n>, <C-p>, <up> and <down> to navigate completion list
inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(0) : "\<down>"
inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(0) : "\<up>"
" use <PageDown> and <PageUp> to scroll
inoremap <silent><expr> <PageDown> coc#pum#visible() ? coc#pum#scroll(1) : "\<PageDown>"
inoremap <silent><expr> <PageUp> coc#pum#visible() ? coc#pum#scroll(0) : "\<PageUp>"
" use <right> and <tab> to cancel and confirm completion
inoremap <silent><expr> <tab> coc#pum#visible() ? coc#pum#confirm() : "\<tab>"
inoremap <silent><expr> <right> coc#pum#visible() ? coc#pum#cancel() : "\<right>"
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'
" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" use k to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
" symbol renaming
nmap <leader>rn <Plug>(coc-rename)
" (Alt+Enter) apply AutoFix to problem on the current line
nmap <leader>f  <Plug>(coc-fix-current)
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" COC FORMATING
" Format for auto file formatting
command! -nargs=0 Format :call CocActionAsync('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
nnoremap <silent> <F1> :Format<CR>
inoremap <silent> <F1> <C-o>:Format<CR>
" COCLIST MAPPINGS
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" TREESITTER
" https://github.com/nvim-treesitter/nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- a list of parser names, or "all"
  --ensure_installed = { "c", "lua", "rust" },

  -- install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- automatically install missing parsers when entering buffer
  auto_install = true,

  -- list of parsers to ignore installing (for "all")
  ignore_install = { },

  highlight = {
    enable = true,

    -- list of language that will be disabled
    -- NOTE: these are the names of the parsers and not the filetype
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
" Workaround: https://valentjn.github.io/ltex/vscode-ltex/installation-usage-coc-ltex.html
let g:tex_flavor='latex'
" Copilot
imap <silent><script><expr> <S-Tab> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

 """"""""""""""""""""""""""""""""
"     __  ___ ____ _____  ______ "
"    /  |/  //  _// ___/ / ____/ "
"   / /|_/ / / /  \__ \ / /      "
"  / /  / /_/ /  ___/ // /___    "
" /_/  /_//___/ /____/ \____/    "
"                                "
 """"""""""""""""""""""""""""""""
" substitute all non-ascii chars by a space
function! RM_non_ascii()
  %s/[^[:alnum:][:punct:][:space:]]/ /g
endfunction
" SAVE STATE/POS OF CURSOR -> execute cmd -> restore cursor
" source: http://vimcasts.org/episodes/tidying-whitespace
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
" FORMATING
" strip white spaces
command StripTrailWhiteChars call Preserve("%s/\\s\\+$//e")
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
