--------------------------------------------------------------------------------
local opts = { noremap = true, silent = true }
--------------------------------------------------------------------------------
--------------------------- telescope.nvim -------------------------------------
--- Telescode bindings
vim.keymap.set("n", ";f", require("telescope.builtin").find_files, { desc = "Search [F]iles" })
vim.keymap.set("n", ";b", require("telescope.builtin").buffers, { desc = "Search [B]uffers" })
vim.keymap.set("n", ";h", require("telescope.builtin").help_tags, { desc = "Search [H]elp tags" })
vim.keymap.set("n", ";g", require("telescope.builtin").live_grep, { desc = "Search by [G]rep" })
vim.keymap.set("n", ";d", require("telescope.builtin").diagnostics, { desc = "Search [D]iagnostics" })
vim.keymap.set("n", ";c", require("telescope.builtin").colorscheme, { desc = "Search [C]olorscheme" })
vim.keymap.set("n", ";z", "<cmd>TSToggle highlight<CR>", { desc = "Search [Z]en" })
--------------------------------------------------------------------------------
------------------------------ coc.nvim ----------------------------------------
vim.keymap.set("n", "[w", "<Plug>(coc-diagnostic-prev)", opts)
vim.keymap.set("n", "]w", "<Plug>(coc-diagnostic-next)", opts)
vim.keymap.set("n", "[d", "<Plug>(coc-definition)", opts)
vim.keymap.set("n", "]d", "<Plug>(coc-declaration)", opts)
vim.keymap.set("n", "[i", "<Plug>(coc-implementation)", opts)
vim.keymap.set("n", "]t", "<Plug>(coc-type-definition)", opts)
vim.keymap.set("n", "[u", "<Plug>(coc-references-used)", opts)
vim.keymap.set("n", "[r", "<Plug>(coc-references)", opts)
vim.keymap.set("n", "]r", "<Plug>(coc-rename)", opts)
vim.keymap.set("n", "[a", "<Plug>(coc-codeaction)", opts)
vim.keymap.set("n", "[f", "<Plug>(coc-fix-current)", opts)
vim.keymap.set("n", "]f", ":<C-u>CocList diagnostics<CR>", opts)
vim.keymap.set("n", "[q", ":<C-u>CocRestart<CR>", opts)
vim.keymap.set("n", "]q", ":call CocAction('doHover')<CR>", opts)
-- vim.keymap.set("n", "[w", vim.diagnostic.get_prev, opts)
-- vim.keymap.set("n", "]w", vim.diagnostic.get_next, opts)
--------------------------------------------------------------------------------
-- vim.keymap.set('n', '', ":STextobjectGotoNextStart @function.inner<CR>", opts)
--------------------------------------------------------------------------------
---------------------- treesitter.textobject.nvim ------------------------------
vim.keymap.set("x", "if", ":TSTextobjectSelect @function.inner<CR>", opts)
vim.keymap.set("o", "if", ":TSTextobjectSelect @function.inner<CR>", opts)
vim.keymap.set("x", "af", ":TSTextobjectSelect @function.outer<CR>", opts)
vim.keymap.set("o", "af", ":TSTextobjectSelect @function.outer<CR>", opts)
vim.keymap.set("x", "ic", ":TSTextobjectSelect @class.inner<CR>", opts)
vim.keymap.set("o", "ic", ":TSTextobjectSelect @class.inner<CR>", opts)
vim.keymap.set("x", "ac", ":TSTextobjectSelect @class.outer<CR>", opts)
vim.keymap.set("o", "ac", ":TSTextobjectSelect @class.outer<CR>", opts)
--------------------------------------------------------------------------------
--------------------------- terminal.nvim --------------------------------------
vim.keymap.set("n", "<A-t>", ":split term://bash<CR>", opts)
vim.keymap.set("n", "<A-v>", ":vsplit term://bash<CR>", opts)
-- vim.keymap.set('n', '<leader>q', ":lua require('nvim-window').pick()<CR>", opt)
--------------------------------------------------------------------------------
--------------------------- Neotree.nvim ---------------------------------------
vim.keymap.set("n", "<C-n>", ":Neotree toggle=true<CR>", opts)
--------------------------------------------------------------------------------
--------------------------- hardtime.nvim --------------------------------------
-- vim.keymap.set('n', '<A-h>', ":Hardtime toggle<CR>", opts)
--------------------------------------------------------------------------------
----------------------------- leap.nvim ----------------------------------------
-- vim.keymap.set('n',        's', '<Plug>(leap-anywhere)')
-- vim.keymap.set({'x', 'o'}, 's', '<Plug>(leap)')
-- vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
vim.keymap.set({ "n", "x", "o" }, "gS", function()
    require("leap.remote").action()
end)
vim.keymap.set({ "x", "o" }, "aa", function()
    -- Force linewise selection.
    local V = vim.fn.mode(true):match("V") and "" or "V"
    -- In any case, move horizontally, to trigger operations.
    local input = vim.v.count > 1 and (vim.v.count - 1 .. "j") or "hl"
    -- With `count=false` you can skip feeding count to the command
    -- automatically (we need -1 here, see above).
    require("leap.remote").action({ input = V .. input, count = false })
end)
-- Create remote versions of all a/i text objects by inserting `r`
-- into the middle (`iw` becomes `irw`, etc.).
-- A trick to avoid having to create separate hardcoded mappings for
-- each text object: when entering `ar`/`ir`, consume the next
-- character, and create the input from that character concatenated to
-- `a`/`i`.
-- do
    -- local remote_text_object = function(prefix)
        -- local ok, ch = pcall(vim.fn.getcharstr) -- pcall for handling <C-c>
        -- if not ok or (ch == vim.keycode("<esc>")) then
            -- return
        -- end
        -- require("leap.remote").action({ input = prefix .. ch })
    -- end
    -- vim.keymap.set({ "x", "o" }, "ar", function()
        -- remote_text_object("a")
    -- end)
    -- vim.keymap.set({ "x", "o" }, "ir", function()
        -- remote_text_object("i")
    -- end)
-- end
--------------------------------------------------------------------------------
----------------------------- flash.nvim ---------------------------------------
-- vim.keymap.set({'n', 'x', 'o'}, 's',  require('flash').jump(), opts)
-- vim.keymap.set({ "n", "x", "o" }, "s", ":lua require('flash').jump()<CR>", opts)
-- vim.keymap.set({ "o" }, "R", ":lua require('flash').remote()<CR>", opts)
-- vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
-- vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')
--------------------------------------------------------------------------------
----------------------------- Yazi.nvim ---------------------------------------
vim.keymap.set("n", "<A-/>", ":Yazi<CR>", opts)
--------------------------------------------------------------------------------
