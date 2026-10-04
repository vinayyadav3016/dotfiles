local map = vim.keymap.set
--------------------------------------------------------------------------------
-- ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
-- ["<C-e>"] = { "hide", "fallback" },
-- ["<CR>"] = { "accept", "fallback" }, -- coc: <CR> confirms
-- ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
-- ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
-- ["<C-n>"] = { "select_next", "fallback" },
-- ["<C-p>"] = { "select_prev", "fallback" },
-- ["<C-b>"] = { "scroll_documentation_up", "fallback" },
-- ["<C-f>"] = { "scroll_documentation_down", "fallback" },
-- ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
-- ["\\f"] for formatting in n & v
-- { "\\g", "<cmd>Git<cr>", desc = "Git status" },
-- { "\\d", "<cmd>Gvdiffsplit<cr>", desc = "Git diff (vertical)" },
-- { ";f", "<cmd>Telescope find_files<cr>", desc = "Files" },
-- { ";g", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
-- { ";b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
-- { ";s", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Doc symbols" },
-- { ";S", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace symbols" },
-- { ";d", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
-- { ";R", "<cmd>Telescope lsp_references<cr>", desc = "References" },
-- { ";D", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
-- { ";I", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
-- { "\\z", "Toggle zoom" }
-- { "\\Z", "Toggle zen" }
-- { "zR", "Open all foldes" }
-- { "zM", "Clode all folds" }
-- { "[d", "Definitions" }
-- { "]d", "Declaration" }
-- { "[r", "References" }
-- { "]r", "Rename" }
-- { "[q", "Source/header switch" }
-- { "]q", "Hover" }
-- { "[a", "Code Action" }
-- { "[v", "Inlay hints" }
-- { "]v", "Codelens" }

--------------------------------------------------------------------------------
-- -- Diagnostics navigation (coc used [g and ]g)
map("n", "[w", function()
    vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev diagnostic" })
map("n", "]w", function()
    vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
map("n", "\\d", vim.diagnostic.open_float, { desc = "Line diagnostics" })

-- Misc quality of life
map("n", "<Esc>", "<cmd>nohlsearch<cr>")
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Fix current line (coc-fix-current equivalent)
map("n", "[f", function()
    vim.lsp.buf.code_action({
        context = {
            only = { "quickfix" },
            diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 }),
        },
        apply = true,
    })
end, { desc = "Quickfix current line" })
map("n", "]f", function()
    vim.diagnostic.setloclist()
end, { desc = "Diagnostics to loclist" })
local opts = { noremap = true, silent = true }
map("n", "<A-t>", ":split term://bash<CR>", opts)
map("n", "<A-v>", ":vsplit term://bash<CR>", opts)

map("n", ";;", ";", { desc = "Repeat Last Move" })
map("n", ",,", ",", { desc = "Repeat Last Move Reverseed" })
