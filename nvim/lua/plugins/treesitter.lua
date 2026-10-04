return {
    {
        "vinayyadav3016/nvim-treesitter",
        -- "nvim-treesitter/nvim-treesitter",
        -- "git@git.forgejo.dc00.stonecurve.lan:/cto/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local parsers = {
                "c",
                "cpp",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "bash",
                "json",
                "yaml",
                "markdown",
                "markdown_inline",
                "javascript",
                "typescript",
                "tsx",
                "python",
                "go",
                "rust",
                "html",
                "css",
                "c",
                "toml",
            }
            require("nvim-treesitter").install(parsers)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(ev)
                    if pcall(vim.treesitter.start, ev.buf) then
                        vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects", -- separate entry
        -- "git@git.forgejo.dc00.stonecurve.lan:/cto/nvim-treesitter-textobjects", -- separate entry
        branch = "main",
        dependencies = { "vinayyadav3016/nvim-treesitter" },
        -- dependencies = { "git@git.forgejo.dc00.stonecurve.lan:/cto/nvim-treesitter" },
        event = "VeryLazy",
        config = function()
            local map = vim.keymap.set

            -- Select
            local sel = require("nvim-treesitter-textobjects.select").select_textobject
            map({ "x", "o" }, "af", function()
                sel("@function.outer", "textobjects")
            end, { desc = "Around function" })
            map({ "x", "o" }, "if", function()
                sel("@function.inner", "textobjects")
            end, { desc = "Inside function" })
            map({ "x", "o" }, "ac", function()
                sel("@class.outer", "textobjects")
            end, { desc = "Around class" })
            map({ "x", "o" }, "ic", function()
                sel("@class.inner", "textobjects")
            end, { desc = "Inside class" })
            map({ "x", "o" }, "aa", function()
                sel("@parameter.outer", "textobjects")
            end, { desc = "Around argument" })
            map({ "x", "o" }, "ia", function()
                sel("@parameter.inner", "textobjects")
            end, { desc = "Inside argument" })
            map({ "x", "o" }, "ai", function()
                sel("@conditional.outer", "textobjects")
            end, { desc = "Around if" })
            map({ "x", "o" }, "ii", function()
                sel("@conditional.inner", "textobjects")
            end, { desc = "Inside if" })
            map({ "x", "o" }, "al", function()
                sel("@loop.outer", "textobjects")
            end, { desc = "Around loop" })
            map({ "x", "o" }, "il", function()
                sel("@loop.inner", "textobjects")
            end, { desc = "Inside loop" })
        end,
    },
    { "nvim-treesitter/nvim-treesitter-context", enabled = false, opts = { max_lines = 3 } }, -- sticky function header
    -- { "git@git.forgejo.dc00.stonecurve.lan:/cto/nvim-treesitter-context", enabled = false, opts = { max_lines = 3 } }, -- sticky function header
}
