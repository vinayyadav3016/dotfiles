" Type :so % to refresh .vimrc after making changes

" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
scriptencoding utf-8
set encoding=utf-8
set nocompatible
set ts=4
set sw=4
let mapleader=","
"autocmd BufEnter * set mouse=
set mouse-=a
set colorcolumn=80
highlight ColorColumn ctermbg=red
set backspace=2
set cursorline
highlight CursorLine ctermbg=black
set laststatus=2
set path+=**
" Leader - ( Spacebar )
" let mapleader = " "

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
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

"Set default font in mac vim and gvim
"set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set cursorline    " highlight the current line
set visualbell    " stop that ANNOYING beeping
set wildmenu
set wildmode=list:longest,full

"Allow usage of mouse in iTerm
"set ttyfast
"set mouse=a
" set ttymouse=xterm2

" Make searching better
set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching
set incsearch
set showmatch

" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
"set shiftround
set softtabstop=0
set noexpandtab
set autoindent

" Set foldmethod
set foldmethod=indent
set nofoldenable

" Display extra whitespace
set list
" set listchars=tab:»·,trail:·,nbsp:·
set listchars=tab:»·,trail:⋅,extends:❯,precedes:❮,nbsp:·
" set listchars=tab:→·,eol:¬,trail:⋅,extends:❯,precedes:❮,nbsp:·
let &showbreak="\u21aa "

" Make it obvious where 80 characters is
set textwidth=80
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Auto resize Vim splits to active split
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

"HTML Editing
set matchpairs+=<:>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Quicker window movement
let g:C_Ctrl_j = 'off'
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

"Use enter to create new lines w/o entering insert mode
"nnoremap <CR> o<Esc>
"Below is to fix issues with the ABOVE mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>
" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical


" Disable session plugin
" let g:loaded_session = 1

" Load up all of our plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on
autocmd Filetype python setlocal expandtab


" <c-h> is interpreted as <bs> in neovim
" This is a bandaid fix until the team decides how
" they want to handle fixing it...(https://github.com/neovim/neovim/issues/2048)
nnoremap <silent> <bs> :TmuxNavigateLeft<cr>
" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk
" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %
vnoremap > >gv
vnoremap < <gv
""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
" set pastetoggle=<F2> "F2 before pasting to preserve indentation
set pastetoggle=<leader>v

"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
" Run the q macro
nnoremap <leader>q @q
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
"Map Ctrl + S to save in any mode
noremap  <silent>  <C-S>          :update<CR>
vnoremap <silent>  <C-S>         <C-C>:update<CR>
inoremap <silent>  <C-S>         <C-O>:update<CR>
map      <leader>s <C-S>
" Quickly close windows
nnoremap <leader>x :x<cr>
nnoremap <leader>X :q!<cr>
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>
" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>
" Switch between the last two files
nnoremap <leader><leader> <c-^>
hi TabLineFill ctermfg=DarkGreen ctermbg=DarkGreen
" hi TabLine ctermfg=Blue ctermbg=Yellow
hi TabLineSel ctermfg=LightGreen ctermbg=Yellow
" AUTOCOMMANDS - Do stuff
" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
"update dir to current file
"autocmd BufEnter * silent! cd %:p:h
augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " autocmd BufRead *.jsx set ft=jsx.html
  " autocmd BufNewFile *.jsx set ft=jsx.html

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass,less setlocal iskeyword+=-
augroup END

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
"highlight ColorColumn ctermbg=lightgrey
highlight CursorLine ctermbg=black
" For per project configuration
set exrc
set secure
