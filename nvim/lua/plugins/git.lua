return {
    {
        "tpope/vim-fugitive",
        dependencies = { "tpope/vim-rhubarb" }, -- adds :GBrowse for GitHub
        cmd = {
            "Git",
            "G",
            "Gdiffsplit",
            "Gvdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "Gclog",
            "Gllog",
            "Gedit",
            "Gsplit",
            "Gvsplit",
            "Gtabedit",
        },
        keys = {
            { "\\g", "<cmd>Git<cr>", desc = "Git status" },
            -- { "<leader>gc", "<cmd>Git commit<cr>",       desc = "Git commit" },
            -- { "<leader>gC", "<cmd>Git commit --amend<cr>", desc = "Git commit amend" },
            -- { "<leader>gp", "<cmd>Git push<cr>",         desc = "Git push" },
            -- { "<leader>gP", "<cmd>Git pull<cr>",         desc = "Git pull" },
            { "\\d", "<cmd>Gvdiffsplit<cr>", desc = "Git diff (vertical)" },
            -- { "<leader>gD", "<cmd>Gdiffsplit<cr>",       desc = "Git diff (horizontal)" },
            -- { "<leader>gb", "<cmd>Git blame<cr>",        desc = "Git blame" },
            -- { "<leader>gl", "<cmd>Gclog<cr>",            desc = "Git log (quickfix)" },
            -- { "<leader>gL", "<cmd>Gclog!<cr>",           desc = "Git log (current file)" },
            -- { "<leader>go", "<cmd>GBrowse<cr>",          desc = "Open in browser", mode = { "n", "v" } },
            -- { "<leader>gS", "<cmd>Git stash<cr>",        desc = "Git stash" },
            -- { "<leader>gu", "<cmd>Gread<cr>",            desc = "Checkout (revert) current file" },
            -- { "<leader>gw", "<cmd>Gwrite<cr>",           desc = "Stage current file" },
        },
        init = function()
            -- Global fugitive settings (must be set before the plugin loads for some)
            vim.g.fugitive_summary_format = "%s"
        end,
        config = function()
            -- Close fugitive status/diff buffers with q instead of leaving them around
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("FugitiveSettings", { clear = true }),
                pattern = { "fugitive", "fugitiveblame" },
                callback = function(args)
                    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = args.buf, silent = true })
                end,
            })
        end,
    },
}
