""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" external config files (in lua)
luafile ~/.config/nvim/telescope.lua
luafile ~/.config/nvim/plugins.lua
luafile ~/.config/nvim/nvim-cmp.lua
luafile ~/.config/nvim/treesitter.lua
luafile ~/.config/nvim/maple.lua
" luafile ~/.config/nvim/mason.lua
" luafile ~/.config/nvim/nvim-ide.lua
" luafile ~/.config/nvim/lsp.lua
luafile ~/.config/nvim/keymaps.lua
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
