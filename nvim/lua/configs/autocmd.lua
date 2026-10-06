vim.api.nvim_create_autocmd("CursorHold", {
    group = vim.api.nvim_create_augroup("AutoDiagFloat", { clear = true }),
    callback = function()
        -- skip if a float is already open
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_config(win).relative ~= "" then
                return
            end
        end
        vim.diagnostic.open_float(nil, {
            focus = false,
            scope = "cursor", -- only diagnostics under the cursor, not the whole line
            border = "rounded",
            source = true,
            close_events = { "CursorMoved", "InsertEnter", "BufLeave", "FocusLost" },
        })
    end,
})
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "*",
--     callback = function()
--         vim.bo.expandtab = true
--     end,
-- })
-- local augroup = vim.api.nvim_create_augroup("vimrcEx", { clear = true })
-- local autocmd = vim.api.nvim_create_autocmd

-- -- Jump to the last known cursor position, except for commit messages
-- -- or when the position is invalid.
-- autocmd("BufReadPost", {
--   group = augroup,
--   pattern = "*",
--   callback = function(args)
--     if vim.bo[args.buf].filetype == "gitcommit" then
--       return
--     end
--     local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
--     local line_count = vim.api.nvim_buf_line_count(args.buf)
--     if mark[1] > 0 and mark[1] <= line_count then
--       vim.api.nvim_win_set_cursor(0, mark)
--     end
--   end,
-- })

-- -- Filetype detection for specific files/extensions
-- autocmd({ "BufRead", "BufNewFile" }, {
--   group = augroup,
--   pattern = "Appraisals",
--   callback = function() vim.bo.filetype = "ruby" end,
-- })
-- autocmd({ "BufRead", "BufNewFile" }, {
--   group = augroup,
--   pattern = "*.md",
--   callback = function() vim.bo.filetype = "markdown" end,
-- })
-- autocmd({ "BufRead", "BufNewFile" }, {
--   group = augroup,
--   pattern = "*.tex",
--   callback = function() vim.bo.filetype = "tex" end,
-- })

-- -- Markdown: spellcheck + wrap width
-- autocmd("FileType", {
--   group = augroup,
--   pattern = "markdown",
--   callback = function()
--     vim.wo.spell = true
--     vim.bo.textwidth = 80
--   end,
-- })

-- -- Git commit messages: wrap + spellcheck
-- autocmd("FileType", {
--   group = augroup,
--   pattern = "gitcommit",
--   callback = function()
--     vim.bo.textwidth = 72
--     vim.wo.spell = true
--   end,
-- })

-- -- Expand tabs for these filetypes
-- autocmd("FileType", {
--   group = augroup,
--   pattern = { "python", "cpp", "c" },
--   callback = function() vim.bo.expandtab = true end,
-- })

-- -- No conceal in LaTeX
-- autocmd("FileType", {
--   group = augroup,
--   pattern = "tex",
--   callback = function() vim.wo.conceallevel = 0 end,
-- })

-- -- Allow hyphenated words in stylesheets
-- autocmd("FileType", {
--   group = augroup,
--   pattern = { "css", "scss", "sass", "less" },
--   callback = function()
--     vim.opt_local.iskeyword:append("-")
--   end,
-- })
