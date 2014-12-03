" Vim configuration
set exrc
set secure
set colorcolumn=110
set number
set ts=2
set sw=2
let mapleader=","
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
autocmd vimenter * NERDTree
let g:NERDTreeWinSize=21
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""""  vim-indent-guides  Configuration
let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_color_change_percent = 10
let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
	  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"call add(g:pathogen_disabled,'vim-indent-guides')

""""  tagbar  Configuration
"call add(g:pathogen_disabled,'tagbar')
autocmd vimenter * Tagbar
let g:tagbar_width = 25

""""  minibufexpl  Configuration
"call add(g:pathogen_disabled,'minibufexpl')
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1 
noremap <C-TAB>   :MBEbn<CR>
noremap <C-S-TAB> :MBEbp<CR>

""""  vim-windowswap  Configuration
"call add(g:pathogen_disabled,'vim-windowswap')

""""  project-1.4.1  Configuration
"call add(g:pathogen_disabled,'project-1.4.1')

""""  vim-cmake-project  Configuration
let g:cmake_project_bar_width=40
"call add(g:pathogen_disabled,'vim-cmake-project')

""""  vim-latex  Configuration
call add(g:pathogen_disabled,'vim-latex')

""""  vim-neatstatus  Configuration
call add(g:pathogen_disabled, 'vim-neatstatus')

""""  Vim-R-plugin  Configuration 
call add(g:pathogen_disabled, 'Vim-R-plugin') 

""""  sqlcomplete  Configuration
call add(g:pathogen_disabled, 'sqlcomplete')

""""  pymode  Configuration
call add(g:pathogen_disabled, 'python-mode')

""""  bash-support  Configuration
"call add(g:pathogen_disabled, 'bash-support')

""""  cvim  Configuration
let  g:C_UseTool_cmake='yes' 
let  g:C_UseTool_doxygen='yes' 
"call add(g:pathogen_disabled, 'cvim')

""""  vim-fswitch  Configuration
"call add(g:pathogen_disabled,'vim-fswitch')

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
autocmd VimEnter * wincmd l

