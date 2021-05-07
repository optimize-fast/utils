set ignorecase
set mouse=a
set nowrap
set noexpandtab
set tabstop=4
set shiftwidth=4

set number
set cursorline
highlight LineNr ctermfg=darkgrey ctermbg=black
highlight CursorLineNr cterm=bold ctermbg=NONE ctermfg=grey
highlight CursorLine cterm=NONE ctermbg=black

autocmd BufWritePre * %s/\s\+$//e


map <F2> <Esc>:noh<Return>
imap <F2> <Esc>:noh<Return>a

" C Programming commands and keymaps
command -nargs=1 CInclGuard normal A#ifndef <args><NL>#define <args><NL><NL><NL><NL>#endif<Esc>2k
