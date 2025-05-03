--------------------------------------------------------------------------------
--- Telescode bindings
vim.keymap.set('n', ';f',
    require('telescope.builtin').find_files, { desc = 'Search [F]iles' })
vim.keymap.set('n', ';b',
    require('telescope.builtin').buffers, { desc = 'Search [B]uffers' })
vim.keymap.set('n', ';h',
    require('telescope.builtin').help_tags, { desc = 'Search [H]elp tags' })
vim.keymap.set('n', ';g',
    require('telescope.builtin').live_grep, { desc = 'Search by [G]rep' })
vim.keymap.set('n', ';d',
    require('telescope.builtin').diagnostics, { desc = 'Search [D]iagnostics' })
vim.keymap.set('n', ';c',
    require('telescope.builtin').colorscheme, { desc = 'Search [C]olorscheme' })
vim.keymap.set('n', ';z',
    '<cmd>TSToggle highlight<CR>', { desc = 'Search [Z]en' })
--------------------------------------------------------------------------------
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '[w', "<Plug>(coc-diagnostic-prev)", opts)
vim.keymap.set('n', ']w', "<Plug>(coc-diagnostic-next)", opts)
vim.keymap.set('n', '[d', "<Plug>(coc-definition)", opts)
vim.keymap.set('n', ']d', "<Plug>(coc-declaration)", opts)
vim.keymap.set('n', '[i', "<Plug>(coc-implementation)", opts)
vim.keymap.set('n', ']t', "<Plug>(coc-type-definition)", opts)
vim.keymap.set('n', '[u', "<Plug>(coc-references-used)", opts)
vim.keymap.set('n', '[r', "<Plug>(coc-references)", opts)
vim.keymap.set('n', ']r', "<Plug>(coc-rename)", opts)
vim.keymap.set('n', '[a', "<Plug>(coc-codeaction)", opts)
vim.keymap.set('n', '[f', "<Plug>(coc-fix-current)", opts)
vim.keymap.set('n', ']f', ":<C-u>CocList diagnostics<CR>", opts)
vim.keymap.set('n', '[q', ":<C-u>CocRestart<CR>", opts)
vim.keymap.set('n', ']s', ":call CocAction('doHover')<CR>", opts)
--------------------------------------------------------------------------------
-- vim.keymap.set('n', '', ":STextobjectGotoNextStart @function.inner<CR>", opts)
--------------------------------------------------------------------------------
vim.keymap.set('x', 'if', ":TSTextobjectSelect @function.inner<CR>", opts)
vim.keymap.set('o', 'if', ":TSTextobjectSelect @function.inner<CR>", opts)
vim.keymap.set('x', 'af', ":TSTextobjectSelect @function.outer<CR>", opts)
vim.keymap.set('o', 'af', ":TSTextobjectSelect @function.outer<CR>", opts)
vim.keymap.set('x', 'ic', ":TSTextobjectSelect @class.inner<CR>", opts)
vim.keymap.set('o', 'ic', ":TSTextobjectSelect @class.inner<CR>", opts)
vim.keymap.set('x', 'ac', ":TSTextobjectSelect @class.outer<CR>", opts)
vim.keymap.set('o', 'ac', ":TSTextobjectSelect @class.outer<CR>", opts)
--------------------------------------------------------------------------------
vim.keymap.set('n', '<A-t>', ":split term://bash<CR>", opts)
vim.keymap.set('n', '<A-v>', ":vsplit term://bash<CR>", opts)
-- vim.keymap.set('n', '<leader>q', ":lua require('nvim-window').pick()<CR>", opt)
--------------------------------------------------------------------------------
