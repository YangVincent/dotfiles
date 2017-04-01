" setlocal because otherwise settings will leak onto non-python files
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab
setlocal nosmartindent
setlocal foldmethod=indent

" Python specific settings.
setlocal autoindent
setlocal formatoptions=croql
nmap <F5> :w <CR> :!clear; python % <CR>
nmap <F6> :w <CR> :!python % 

" use foldmethod = indent because syntax in python doesn't work well with syntax
set foldmethod=indent
"let python_highlight_all=1
" Use the below highlight group when displaying bad whitespace is desired.
"highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

