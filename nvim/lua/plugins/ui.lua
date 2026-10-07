return {
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        enabled = false,
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "vinayyadav3016/NeoSolarized.nvim",
        lazy = false,
        priority = 10000,
        config = function()
            vim.cmd.colorscheme("NeoSolarized")
        end,
    },

    -- Diagnostics/references/quickfix panel (CocList diagnostics)
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        opts = {},
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (all)" },
            { "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Diagnostics (buffer)" },
            { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols outline" },
            { "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP defs/refs" },
        },
    },

    -- Keymap discovery popup
    { "folke/which-key.nvim", event = "VeryLazy", opts = {} },

    -- Statusline with LSP client info + diagnostics
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "onedark", -- change this name
                globalstatus = false,
                component_separators = { left = "│", right = "│" },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_c = { "filename", { "diagnostics" } },
                lualine_x = {
                    {
                        function()
                            local names = {}
                            for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
                                table.insert(names, c.name)
                            end
                            return #names > 0 and (" " .. table.concat(names, ",")) or ""
                        end,
                    },
                    "filetype",
                },
            },
        },
    },

    -- Nice folding (coc doesn't have this, but you'll want it)
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufReadPost",
        enable = false,
        opts = {
            provider_selector = function()
                return { "lsp", "indent" }
            end,
        },
        keys = {
            {
                "zR",
                function()
                    require("ufo").openAllFolds()
                end,
                desc = "Open all folds",
            },
            {
                "zM",
                function()
                    require("ufo").closeAllFolds()
                end,
                desc = "Close all folds",
            },
        },
    },

    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
    { "lewis6991/gitsigns.nvim", enabled = false, opts = {} }, -- coc-git
    {
        "stevearc/aerial.nvim",
        opts = {}, -- outline, like coc-outline
        keys = { { "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Outline" } },
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = {}, -- coc-explorer
        keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" } },
    },
    {
        "folke/snacks.nvim",
        opts = { zen = {} },
        keys = {
            {
                "<\\z",
                function()
                    Snacks.zen.zoom()
                end,
                desc = "Toggle zoom",
            },
            {
                "<\\Z",
                function()
                    Snacks.zen()
                end,
                desc = "Toggle zen mode",
            },
        },
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
        opts = {
            input = {
                enabled = true,
                default_prompt = "Rename",
                border = "rounded",
                relative = "cursor", -- float appears at the cursor, like coc
                prefer_width = 40,
                win_options = { winblend = 0 },
            },
            select = { enabled = true }, -- also prettifies code action menus
        },
    },
}
