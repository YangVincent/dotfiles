" **************************************                                                                                                                                                                            
" * VARIABLES
" **************************************
set nocompatible               " get rid of strict vi compatibility!
set nu                          " line numbering on
set autoindent                  " autoindent on
set noerrorbells                " bye bye bells :)
set visualbell                  " Since intelliJ doesn't understand noerrorbells
                                    "it will understand to switch to visualbells.
set modeline                    " show what I'm doing
set showmode                    " show the mode on the dedicated line (see
set nowrap                      " no wrapping!
set ignorecase                  " search without regards to case
set backspace=indent,eol,start  " backspace over everything
set fileformats=unix,dos,mac    " open files from mac/dos
set exrc                        " open local config files
set nojoinspaces                " don't add white space when I don't tell 
set ruler                       " which line am I on?
set showmatch                   " ensure Dyck language
set incsearch                   " incremental searching
set nohlsearch                  " meh
set bs=2                        " fix backspacing in insert mode
set cursorline                  " highlighs current line
set formatoptions+=r            " auto add askerus for comments
set sm                          " show matching {()} or as typed.
set whichwrap +=>,l
set whichwrap +=<,h             "let l and h wrap around.
set rnu                         "Set relative numbers
" Smart indent
set smartindent
set tabstop=4
set shiftwidth=4                "originally 4
set expandtab
set softtabstop=4 expandtab


" Set splitirght
set splitright

" Shows colors of syntax
syntax on                          

" Enable arrow keys                    
imap ^[OA <ESC>ki                                    
imap ^[OB <ESC>ji                   
imap ^{OC <ESC>li
imap ^[OD <ESC>hi
" Enable jk becomes escape for leaving insert mode
imap jk <Esc>
" Use l; to save and quit
noremap l; :wq<CR>
noremap ns :wq<CR>

"Allow all window commands in insert mode without accidentally
"deleting words
imap <C-w> <C-o><C-w>

"Easier split navigations - remap left and right, up and down
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Try insert mode
inoremap <C-J> <Esc><C-W><C-J>i
inoremap <C-K> <Esc><C-W><C-K>i
inoremap <C-L> <Esc><C-W><C-L>i
inoremap <C-H> <Esc><C-W><C-H>i

"Themes
colorscheme zellner  

" Line number highlight
highlight LineNr  ctermbg=black

" Highlight color of VISUAL mode
highlight Visual  ctermbg=darkblue
highlight Visual  ctermfg=white
  
" Highlight color of Matching paranthesis 
highlight MatchParen cterm=underline ctermbg=none ctermfg=white

ab FF /////////////////////////////////FIELDS/////////////////////////////////////
ab MM /////////////////////////////////METHODS////////////////////////////////////
ab CC //////////////////////////////CONSTRUCTORS//////////////////////////////////
ab SG ///////////////////////////SETTERS & GETTERS////////////////////////////////

" sets tab to fill wildchars for buffers
set wildchar=<tab> wildmenu wildmode=full

" Prompt if unsaved changes in buffer
set confirm

" Format statusline
 set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" hi User1 ctermbg=white ctermfg=blue guibg=white guifg=blue
" hi User1 ctermbg=red ctermfg=blue 
"guibg=red guifg=blue

set statusline+=%1*
set laststatus=2
if version >= 700
  highlight statusline cterm=bold ctermfg=black ctermbg=red
  au InsertLeave * highlight Statusline cterm=bold ctermfg=black ctermbg=red
  au InsertEnter * highlight Statusline cterm=bold ctermfg=black ctermbg=green
endif

highlight LineNr ctermfg=white

" set colorcolumn=120

" Set Dedent.
" Handy function to search previous lines for indent levels and
" use those instead of multiples of shiftwidth.
function! DedentToPrevious()
python << EOF
import vim
tabsize = int(vim.eval("&ts"))
l = vim.current.line
rest = l.lstrip()
indent = l[:-len(rest)]
if indent != "":
    cur_size = len(indent.replace("\t", " "*tabsize))
    idx = vim.current.window.cursor[0]-2
    while idx >= 0:
        ll = vim.current.buffer[idx]
        indent = ll[:-len(ll.lstrip())]
        if len(indent.replace("\t", " "*tabsize)) < cur_size:
            vim.current.line = indent+rest
            break
        idx-=1
EOF
endfunction


noremap <S-LEFT> hxhxhxhx
noremap <S-RIGHT> i<SPACE><SPACE><SPACE><SPACE><ESC><RIGHT>

"set shortcut delay time
set timeout timeoutlen=250 ttimeoutlen=100


" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" switch tabs on for makefiles (won't work with spaces):
au BufRead,BufNewfile Makefile set ts=4 sw=4 noexpandtab


" Vundle plugin package manager
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"The following are examples of different formats supported.
" Keep Plugin commands between bundle#begin/end.
" Plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"Plugin 'Valloric/YouCompleteMe'

"Plugin 'scrooloose/syntastic'
" let g:syntastic_cpp_check_header = 1
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
highlight SyntasticErrorLine guibg=#2f0000
hi SpellBad ctermfg=255 ctermbg=160 guifg=#yyyyyy guibg=#zzzzzz
hi SpellCap ctermfg=255 ctermbg=016 guifg=#yyyyyy guibg=#zzzzzz


Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'scroloose/nerdtree'

" let g:ycm_global_ycm_extra_conf = 'path to .ycm_extra_conf.py'
let g:ycm_register_as_syntastic_checker = 0
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'


" call vundle#rc()
" more bundles here
call vundle#end()
filetype plugin indent on
filetype on

" End Vundle setup

" Mapleader
let mapleader = ','


" Use visual mode to indent/unindent:
vmap <TAB> >gv
vmap <S-TAB> <gv

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction


nnoremap <S-TAB> <<
inoremap <S-TAB> <C-d>
