"----------------------------------------------------
" Author:       Max "keks" Fischer
"
" File:         .vimrc
"----------------------------------------------------

" vim > vi settings
set nocompatible

" intending
set autoindent
set smartindent

" encoding
set fileencoding=utf-8
set tenc=utf-8

filetype on
filetype indent on
filetype plugin on

set nu              " show line numbers
set relativenumber  " relative to current line

" no backup
set noswapfile

" text layout
set cursorline      " highlight cursor line
set colorcolumn=+1,+2
set showmatch       " jump briefly to matching brace
set showmode        " show current mode
set tabstop=4       " tabs have 4 spaces
set backspace=2     " backspace 2 spaces
set shiftwidth=4    " intending 4 spaces
set noexpandtab     " for discussion
set textwidth=80    " readable line length
set list            " show these 'invisible' chars
set listchars=tab:»\ ,trail:·,eol:¶,nbsp:⎵,precedes:←,extends:→ sbr=↪

" window layout
set winfixwidth
set winfixheight
set winwidth=80
set winminwidth=80


" searching
set incsearch hlsearch
set ignorecase

" {{{ Folding test
if has("folding")
    set foldenable
    set foldmethod=marker
    set foldmarker={{{,}}}
    set foldcolumn=2
    "set foldlevel=100
endif
"}}}

" matching
set matchtime=2
set matchpairs+==:;
set matchpairs+=<:>
set matchtime=10

" status bar info and appearance
"set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%04v]\ [%p%%:\ %l/%L]\ 
set laststatus=2
set cmdheight=1
let g:loaded_matchparen=1

" gui options
set guioptions-=m
set guioptions-=T
if has("gui_win32")
    set guifont=Inconsolata:h12:cANSI
else
    set guifont=montecarlo
endif

" space bar un-highligts search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" Printer
set printdevice=HP_LaserJet_1022

" au foo
" python stuff
au BufRead,BufNewFile *.py setlocal tabstop=4
au BufRead,BufNewFile *.py setlocal shiftwidth=4
au BufRead,BufNewFile *.py setlocal smarttab
au BufRead,BufNewFile *.py setlocal expandtab
au BufRead,BufNewFile *.py setlocal softtabstop=4
au BufRead,BufNewFile *.py setlocal autoindent
au BufRead,BufNewFile *.py setlocal tw=80
au BufRead,BufNewFile *.py let g:pydiction_location  = '~/.vim/ftplugin/pydiction/complete-dict'
au BufRead,BufNewFile *.py highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

" C stuff
au BufRead,BufNewFile *.c setlocal shiftwidth=4
au BufRead,BufNewFile *.c setlocal showmatch
au BufRead,BufNewFile *.c setlocal tw=79

" tex stuff(vim-latexsuite)
au BufRead,BufNewFile *.tex let g:tex_flavor = "latex"
set grepprg=grep\ -nH\ $*
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
au BufRead,BufNewFile *.tex setlocal shiftwidth=2
au BufRead,BufNewFile *.tex setlocal tabstop=2
au BufRead,BufNewFile *.tex setlocal iskeyword+=:

" web stuff
au BufRead,BufNewFile *.html,*.css setlocal tabstop=2
au BufRead,BufNewFile *.html,*.css setlocal shiftwidth=2
au BufRead,BufNewFile *.html,*.css setlocal softtabstop=2 " (sts) makes spaces feel like tabs (like deleting)

"keymappings
"paste
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>
"delete cursor mappings
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <Up> <NOP>


let mapleader                    = ','
"nerdtree
map <F3> <Esc>:NERDTreeToggle<CR> 

"taglist
map <F4> <Esc>:TlistToggle<CR>

set nomore

" necessary for statusline.vim
func! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return "0"
    endif
    if bytes < 1024
        return bytes
    else
        return (bytes / 1024) . "K"
    endif
endfunc

runtime macros/matchit.vim
syntax on

if $TERM == 'linux'
    let &t_Co = 8
    color peachpuff
    set nolist
    set colorcolumn+=81
    hi ColorColumn term=none cterm=none ctermbg=3
    hi CursorLine term=none cterm=none ctermbg=none
else
"    hi Cursorline term=none cterm=none ctermbg=17
    colorscheme neverland
endif
