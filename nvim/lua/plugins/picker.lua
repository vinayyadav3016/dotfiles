return {
    -- CocList replacement for references, symbols, diagnostics, files, grep
    {
        "nvim-telescope/telescope.nvim",
        -- "git@git.forgejo.dc00.stonecurve.lan:/cto/telescope.nvim",
        branch = "master",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            -- "git@git.forgejo.dc00.stonecurve.lan:/cto/plenary.nvim",
            -- { "git@git.forgejo.dc00.stonecurve.lan:/cto/telescope-fzf-native.nvim", build = "make" },
        },
        keys = {
            { ";f", "<cmd>Telescope find_files<cr>", desc = "Files" },
            { ";g", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
            { ";b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { ";s", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Doc symbols" },
            { ";S", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace symbols" },
            { ";d", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
            { ";R", "<cmd>Telescope lsp_references<cr>", desc = "References" },
            { ";D", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
            { ";I", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
        },
        config = function()
            require("telescope").setup({})
            pcall(require("telescope").load_extension, "fzf")
        end,
    },
}
