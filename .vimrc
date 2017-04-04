" **************************************                                                                                                                                                                            
" * Plug plugin package manager 
" **************************************                                                                                                                                                                            

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
" Don't jump to close bracket on different line
let g:AutoPairsMultilineClose = 0

" Plugin indentLine - show matching indents
Plug 'Yggdroot/indentLine'
"let g:indentLine_color_term = 8
"let g:indentLine_char = '»'
let g:indentLine_char = '|'
"let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_leadingSpaceChar = ' '
"let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_faster = 1
let g:tex_conceal = ""
" end indentLine


" Plugin vim-css-color
Plug 'ap/vim-css-color'


" Plugin ConqueTerm
"Plugin 'oplatek/Conque-Shell'
set shell=/bin/sh
" Conque GDB is installed; built from source because it doesn't work with Vundle
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly"
let g:ConqueGdb_Leader = ','


Plug 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" Syntastic is auto-disabled by YCM
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"highlight SyntasticErrorLine ctermbg=160 " change the color of error line
"hi SpellBad ctermfg=255 ctermbg=160 guifg=#yyyyyy guibg=#zzzzzz
"hi SpellCap ctermfg=255 ctermbg=016 guifg=#yyyyyy guibg=#zzzzzz
" change color of (gutter) Sign Column from gray to no color
highlight SignColumn ctermbg=none 

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --tern-completer'  }
" Close complete buffer after choosing option
autocmd CompleteDone * pclose
let g:ycm_python_binary_path = '/Library/Frameworks/Python.framework/Versions/3.4/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_register_as_syntastic_checker = 0
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
highlight YcmErrorSection cterm=none ctermbg=red ctermfg=black
highlight YcmWarningSection cterm=none ctermbg=yellow ctermfg=black

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'

" Vimproc - async vim; needed for vdebugger
"Plugin 'Shougo/vimproc.vim'
" Vim debugger
"Plugin 'idanarye/vim-vebugger' 

" Dark mode Unite - fuzzy search through files/contents
"Plugin 'Shougo/denite.nvim'
"nnoremap <C-P>    :Denite -buffer-name=files -start-insert file_rec/async:!<cr>
"nnoremap <space>/ :Denite -no-empty -no-resize grep<cr>
"nnoremap <space>s :Denite -quick-match buffer<cr>

Plug 'tpope/vim-fugitive'

" more bundles here
call plug#end()

" **************************************

" **************************************
" * COMMANDS THAT MUST COME AFTER VUNDLE
" **************************************

" **************************************                                                                                                                                                                            
" * VARIABLES
" **************************************

" map xdate to fill in date
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


" **************************************
" * ESSENTIAL REMAPS 
" **************************************
" Enable jk becomes es
imap jk <Esc>
" Use l; to save and quit
noremap l; :wq<CR>
" set shortcut delay time - first is mapping delay, second is key code delay
set timeout timeoutlen=250 ttimeoutlen=100
" Mapleader
" make space do nothing
" make space the leader
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
" **************************************


" **************************************
" * Leader shortcuts
" **************************************
" Fast saving
noremap <leader>w :w<cr>

" Let '<leader>b' toggle between this and the last accessed buffer
noremap <leader><SPACE> :b#<cr>

" Let '<leader>q' save and quit all
noremap <leader>q :wqa<cr>

" Toggle paste mode on and off
noremap <leader>p :setlocal paste!<cr>

" Turn off highlighting until next search
noremap <leader>/ :noh<cr>

" Rotate buffers
noremap <leader>j :bn<cr>
noremap <leader>k :bp<cr>

" Vertical and horizontal splitting
noremap <leader>v :vs<cr>
noremap <leader>h :sp<cr>

" Toggle fold
noremap <leader>f za

" vimdiff shortcuts
" http://www.rosipov.com/blog/use-vimdiff-as-git-mergetool/
noremap <leader>l :diffg LO<cr>
noremap <leader>r :diffg RE<cr>
noremap <leader>b :diffg BA<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"
nnoremap <leader>g :YcmCompleter GoTo<cr>

" **************************************

" **************************************
" * Nice General Settings
" **************************************
set term=screen-256color
set nocompatible                " get rid of strict vi compatibility!
set nu                          " line numbering on
set autoindent                  " autoindent on
set noerrorbells                " bye bye bells :)
set visualbell                  " Since IntelliJ doesn't understand noerrorbells it will understand to switch to visualbells.
set modeline                    " show what I'm doing
set showmode                    " show the mode on the dedicated line 
set nowrap                      " no text wrapping
set ignorecase                  " search without regards to case
set backspace=indent,eol,start  " backspace over everything
set fileformats=unix,dos,mac    " open files from mac/dos
set exrc                        " open local config files
set nojoinspaces                " don't add white space when I don't tell 
set ruler                       " which line am I on?

set showmatch                   " ensure Dyck language; show matching {()} or as typed.

set incsearch                   " incremental searching
set hlsearch                    " highlight searches (can be turned off with <leader>/)
set bs=2                        " fix backspacing in insert mode
set cursorline                  " highlights current line
set formatoptions+=r            " auto add askerus for comments
set rnu                         " Set relative numbers
set clipboard^=unnamed          " Use system copy/paste keyboard for yank and delete
set colorcolumn=120             " Mark the 120th column
set confirm                     " Prompt if unsaved changes in buffer
set splitbelow                  " More natural file splitting
set splitright


" vertical/horizontal scroll settings
set scrolloff=3                 " keep this many lines between cursor and top/bottom when scrolling
set sidescrolloff=7             " if <7 columns from end or beginning, scroll
set sidescroll=1                " scroll by 1 char at a time (0 for half a string)
 
" sets tab to fill wildchars for buffers
set wildchar=<tab> wildmenu wildmode=full

" Easier split navigations - remap left and right, up and down
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" **************************************

" Show syntax colors
syntax on                          

" **************************************
" * Folding
set foldnestmax=2              " only fold up to method headers
set foldlevel=2
set foldmethod=syntax
set nofoldenable                " don't fold on file open


" persistent save folds 
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

"set foldmarker={,}
" **************************************

" **************************************
" * Intelligent Indenting
" **************************************
set softtabstop=4               " backspace will backspace a tab if possible
set tabstop=4                   " Smart indenting
set shiftwidth=4                " 1 tab == 4 spaces
set expandtab                   " Use spaces instead of tabs
set nosmartindent

" switch tabs on for makefiles (they won't work with spaces):
au BufRead,BufNewfile Makefile set ts=4 sw=4 noexpandtab
" **************************************

" **************************************
" * COLOR HIGHLIGHTING 
" **************************************
"Themes
colorscheme zellner  

" Highlight color of Matching parentheses 
highlight MatchParen cterm=underline ctermbg=none ctermfg=white

" Line number highlight
"highlight LineNr ctermfg=white
highlight CursorLineNr ctermfg=white

" Highlight color of VISUAL mode
highlight Visual  ctermbg=darkblue
highlight Visual  ctermfg=white


" DiffAdd - line was added
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" DiffDelete - line was removed
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" DiffChange - part of line was changed (highlights whole line)
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" DiffText - exact part of the line that changed
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

highlight SignColumn ctermbg=none 

" YCM Highlighting
highlight YcmErrorSection cterm=none ctermbg=red ctermfg=black
highlight YcmWarningSection cterm=none ctermbg=yellow ctermfg=black

" **************************************
" * Format statusline
" **************************************
" Format statusline coloring to change on insert/normal
if version >= 700
  highlight statusline cterm=bold ctermfg=black ctermbg=red
  au InsertLeave * highlight Statusline cterm=bold ctermfg=black ctermbg=red
  au InsertEnter * highlight Statusline cterm=bold ctermfg=black ctermbg=white
endif
function! HighlightSearch()
  if &hls
    return '_H'
  else
    return ''
  endif
endfunction
set statusline=
set statusline+=%7*\[%n]                                  "buffernr
set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%{v:register}                             " Current paste buffer
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
highlight StatusLineNC ctermbg=0 cterm=none gui=none
highlight Search ctermbg=27
set laststatus=2      " always show statusline
" **************************************

" Remove background/foreground flipping by italic style
highlight htmlItalic term=NONE cterm=NONE gui=NONE
highlight htmlBold term=NONE cterm=NONE gui=NONE
" **************************************
" Disable htmlBold and htmlItalic in 
" /usr/local/Cellar/vim/8.0.0503/share/vim/vim80/syntax/html.vim
hi link htmlBold Storage
hi link htmlItalic Identifier  

" **************************************
" * => Turn persistent undo on 
" *   means that you can undo even when you close a buffer/VIM
" **************************************
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry
" **************************************

" **************************************                                                                                                                                                                            
" * Uncomment the following to have Vim jump to the last position when reopening a file
" **************************************                                                                                                                                                                            
if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" **************************************                                                                                                                                                                            


set showcmd                     " show commands

" On markdown files, where indentLine doesn't apply anyway, set conceallevel
" to 0 to show asterisks and special characters
autocmd BufNewFile,BufRead *.md let g:indentLine_setConceal = 0

set whichwrap +=>,l
set whichwrap +=<,h             " let l and h wrap around.

" load ftplugins and indent files
filetype plugin indent on
" **************************************
set shortmess+=c " https://github.com/Valloric/YouCompleteMe/issues/1562

