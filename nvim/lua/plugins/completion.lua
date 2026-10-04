return {
    {
        "saghen/blink.cmp",
        -- "git@git.forgejo.dc00.stonecurve.lan:/cto/blink.cmp",
        version = "1.*", -- prebuilt fuzzy-matching binary
        dependencies = {
            "rafamadriz/friendly-snippets",
            -- "git@git.forgejo.dc00.stonecurve.lan:/cto/friendly-snippets",
        },
        opts = {
            keymap = {
                preset = "none",
                ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
                ["<C-e>"] = { "hide", "fallback" },
                ["<CR>"] = { "accept", "fallback" }, -- coc: <CR> confirms
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
                ["<C-n>"] = { "select_next", "fallback" },
                ["<C-p>"] = { "select_prev", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },
            appearance = { nerd_font_variant = "mono" },
            completion = {
                accept = { auto_brackets = { enabled = true } },
                documentation = { auto_show = true, auto_show_delay_ms = 200 },
                ghost_text = { enabled = false },
                menu = {
                    border = "rounded",
                    draw = { columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } } },
                },
                list = { selection = { preselect = true, auto_insert = false } },
            },
            signature = { enabled = true, window = { border = "rounded" } },
            snippets = { preset = "default" }, -- uses vim.snippet, no LuaSnip required
            sources = {
                default = { "lsp", "path", "snippets", "buffer", "lazydev" },
                providers = {
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
                },
            },
            cmdline = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },
}
