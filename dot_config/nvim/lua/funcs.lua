-- substitute all non-ascii chars by a space
function RM_non_ascii()
	vim.cmd("%s/[^[:alnum:][:punct:][:space:]]/ /g")
end

-- SAVE STATE/POS OF CURSOR -> execute cmd -> restore cursor
-- source: http://vimcasts.org/episodes/tidying-whitespace
vim.cmd([[
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
]])

-- simple format (variatic because of ALE)
vim.cmd([[
function! SimpFormat(...)
  call Preserve("retab")
  call Preserve("%s/\\s\\+$//e")
  call Preserve("normal gg=G")
endfunction
]])

-- vim -b : edit binary using xxd-format! (see :h hex-editing)
vim.cmd([[
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
]])