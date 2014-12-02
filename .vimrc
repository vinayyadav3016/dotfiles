" Vim configuration
set exrc
set secure
set colorcolumn=110
set number
"autocmd BufEnter * set mouse=
highlight ColorColumn ctermbg=lightgray
set backspace=2
set cursorline
highlight CursorLine ctermbg=lightgray
set laststatus=2
set statusline=
set statusline+=%m
set statusline+=\ -- 
set statusline+=\  
set statusline+=%f
set statusline+=%=
set statusline+=%2n
set statusline+=\ --  
set statusline+=\ %{&ff}
set statusline+=\ --
set statusline+=\ (
set statusline+=%l
set statusline+=,
set statusline+=%v
set statusline+=)
set statusline+=/%4L
set statusline+=\ --
set statusline+=\%3p%%
"set statusline+=\ -\ 	
"set statusline+=%{&ff}
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"
"let g:netrw_list_hide='.+'

"""
let g:pathogen_disabled = []

""""  nerdtree  Configuration
"call add(g:pathogen_disabled, 'nerdtree')
"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""""  vim-latex  Configuration
call add(g:pathogen_disabled,'vim-latex')

""""  vim-neatstatus  Configuration
call add(g:pathogen_disabled, 'vim-neatstatus')

""""  Vim-R-plugin  Configuration 
"call add(g:pathogen_disabled, 'Vim-R-plugin') 
""""  sqlcomplete  Configuration
"call add(g:pathogen_disabled, 'sqlcomplete')

""""  pymode  Configuration
call add(g:pathogen_disabled, 'python-mode')

""""  bash-support  Configuration
"call add(g:pathogen_disabled, 'bash-support')

""""  cvim  Configuration
"call add(g:pathogen_disabled, 'cvim')

""""  tagbar  Configuration
"call add(g:pathogen_disabled, 'tagbar')

""""  ultisnips  Configuration
"call add(g:pathogen_disabled, 'ultisnips')

""""  vim-fugitive  Configuration
"call add(g:pathogen_disabled, 'vim-fugitive')

""""  vim-ros  Configuration
"call add(g:pathogen_disabled, 'vim-ros')


""" syntastic configuration
let g:syntastic_python_checkers = ['pylint']
call add(g:pathogen_disabled, 'syntastic')

"""" YouCompleteMe Configuration
"call add(g:pathogen_disabled, 'YouCompleteMe')
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen configuration
call pathogen#infect()
call pathogen#helptags()
filetype on
filetype plugin on
filetype plugin indent on
syntax on


