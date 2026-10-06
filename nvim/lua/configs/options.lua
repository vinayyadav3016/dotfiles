local o = vim.opt
vim.highlight.priorities.semantic_tokens = 95  -- treesitter is 100
o.updatetime = 10
-- o.number = true
-- o.relativenumber = true
-- o.signcolumn = "yes" -- avoids layout shift when diagnostics appear
-- o.updatetime = 250 -- faster CursorHold (coc recommends this too)
-- o.timeoutlen = 300
-- o.termguicolors = true
-- o.mouse = ""
-- o.clipboard = "unnamedplus"
-- o.ignorecase = true
-- o.smartcase = true
-- o.tabstop = 4
-- o.shiftwidth = 4
-- o.softtabstop = 4
-- o.expandtab = true
-- o.smartindent = true
-- o.splitright = true
-- o.splitbelow = true
-- o.scrolloff = 8
-- o.undofile = true
-- o.completeopt = { "menu", "menuone", "noselect" }
-- o.foldlevel = 99 -- needed for nvim-ufo
-- o.foldlevelstart = 99
-- o.foldenable = true
-- o.cursorline = true
-- o.shada = "'1000,<50,s10,h"

-- vim.cmd("highlight CursorLine ctermbg=black guibg=black")

-- vim.diagnostic.config({
--     virtual_text = { spacing = 2, prefix = "●" },
--     severity_sort = true,
--     float = { border = "rounded", source = true },
--     signs = {
--         text = {
--             [vim.diagnostic.severity.ERROR] = " ",
--             [vim.diagnostic.severity.WARN] = " ",
--             [vim.diagnostic.severity.INFO] = " ",
--             [vim.diagnostic.severity.HINT] = "󰌵 ",
--         },
--     },
-- })

-- vim.api.nvim_create_autocmd("ColorScheme", {
--     group = vim.api.nvim_create_augroup("UserHighlights", { clear = true }),
--     callback = function()
--         -- vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = "black", bg = "black" })
--         vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#586e75", bold = true })
--     end,
-- })
