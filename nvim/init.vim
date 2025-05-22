""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" external config files (in lua)
luafile ~/.config/nvim/notify.lua
luafile ~/.config/nvim/telescope.lua
luafile ~/.config/nvim/plugins.lua
" luafile ~/.config/nvim/nvim-tree.lua
" luafile ~/.config/nvim/nvim-cmp.lua
luafile ~/.config/nvim/treesitter.lua
luafile ~/.config/nvim/maple.lua
" luafile ~/.config/nvim/mason.lua
" luafile ~/.config/nvim/lspsaga.lua
" luafile ~/.config/nvim/nvim-ide.lua
" luafile ~/.config/nvim/lsp.lua
luafile ~/.config/nvim/hardtime.lua
luafile ~/.config/nvim/leap.lua
" luafile ~/.config/nvim/flash.lua
luafile ~/.config/nvim/keymaps.lua
" luafile ~/.config/nvim/solarized.lua
" 66d910665d7fef9e441293bab0fa08f77d6c004e
" -  [=[\s*\%(\d\+\|\$\)\%[,\%(\d\+\|\$\)]\s*]=],
" +  [=[\s*\%(\d\+\|\$\)\s*]=],
" +  -- [=[\s*\%[,\%(\d\+\|\$\)]\s*]=],
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
