" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
   filetype plugin indent on
endif

set nocompatible
   
" UI
set number
set relativenumber
set ruler
set showcmd
set showmode
set t_vb=
set scrolloff=3

" Search and match
set smartcase
set ignorecase
set incsearch
set hlsearch
set showmatch

" Tab and indent
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4
set softtabstop=4

set undolevels=1000
set backspace=indent,eol,start

set noerrorbells
set novisualbell
set lazyredraw

"" Colors and Fonts
syntax enable
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Command Tab complete
set wildmenu
set wildmode=longest:list,full

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
