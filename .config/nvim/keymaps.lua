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
