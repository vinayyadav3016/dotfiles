" Type :so % to refresh .vimrc after making changes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
scriptencoding utf-8
set encoding=utf-8
set nocompatible
set ts=4
set sw=4
set tabstop=4
set shiftwidth=4
set mouse-=a
set colorcolumn=80
set backspace=2
set laststatus=2
set path+=**
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete command
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" set cursorline    " highlight the current line
set visualbell    " stop that ANNOYING beeping
set wildmenu
set wildmode=list:longest,full
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make searching better
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
set incsearch
set showmatch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set softtabstop=0
set expandtab
set autoindent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set foldmethod
set foldmethod=indent
set nofoldenable
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display extra whitespace
set list
" set listchars=tab:»·,trail:·,nbsp:·
set listchars=tab:»·,trail:⋅,extends:❯,precedes:❮,nbsp:·
" set listchars=tab:→·,eol:¬,trail:⋅,extends:❯,precedes:❮,nbsp:·
set showbreak=↪
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make it obvious where 80 characters is
set textwidth=80
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Numbers
set number
set numberwidth=5
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto resize Vim splits to active split
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"HTML Editing
set matchpairs+=<:>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always use vertical diffs
set diffopt+=vertical
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load up all of our plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load up all of our auto cmd
if filereadable(expand("~/.vimrc.auto_cmd"))
  source ~/.vimrc.auto_cmd
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load up all of our colors
if filereadable(expand("~/.vimrc.colors"))
  source ~/.vimrc.colors
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load up all of our mappings
if filereadable(expand("~/.vimrc.mappings"))
  source ~/.vimrc.mappings
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set exrc
set secure
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For per project configuration
