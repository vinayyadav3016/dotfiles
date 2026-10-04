return {
    {
        "stevearc/conform.nvim",
        -- "git@git.forgejo.dc00.stonecurve.lan:/cto/conform.nvim",
        event = "BufWritePre",
        cmd = "ConformInfo",
        keys = {
            {
                "\\f",
                function()
                    require("conform").format({ async = true, lsp_format = "fallback" }, function(err)
                        if not err then
                            vim.cmd("silent! retab")
                        end
                    end)
                end,
                mode = { "n", "v" },
                desc = "Format",
            },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                python = { "ruff_format", "ruff_organize_fix" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                json = { "prettierd", "prettier", stop_after_first = true },
                css = { "prettierd", "prettier", stop_after_first = true },
                html = { "prettierd", "prettier", stop_after_first = true },
                go = { "goimports", "gofmt" },
                rust = { "rustfmt" },
                sh = { "shfmt" },
                bash = { "shfmt" },
            },
            -- format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
        },
    },

    -- Auto-install formatters/linters through Mason
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "mason-org/mason.nvim" },
        -- "git@git.forgejo.dc00.stonecurve.lan:/cto/mason-tool-installer.nvim",
        -- dependencies = { "git@git.forgejo.dc00.stonecurve.lan:/cto/mason.nvim" },
        opts = {
            ensure_installed = { "stylua", "ruff", "clang-format", "shfmt" },
        },
    },

    -- {
    --   -- "mfussenegger/nvim-lint",
    --   "git@git.forgejo.dc00.stonecurve.lan:/cto/nvim-lint",
    --   event = { "BufReadPost", "BufWritePost" },
    --   config = function()
    --     require("lint").linters_by_ft = {
    --       sh = { "shellcheck" },
    --       markdown = { "markdownlint" },
    --     }
    --     vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
    --       callback = function() require("lint").try_lint() end,
    --     })
    --   end,
    -- },
}
