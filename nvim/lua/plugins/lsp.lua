return {
    -- Installer (the ":CocInstall" replacement)
    {
        "mason-org/mason.nvim",
        -- "git@git.forgejo.dc00.stonecurve.lan:/cto/mason.nvim",
        opts = { ui = { border = "rounded" } },
    },

    {
        "neovim/nvim-lspconfig", -- supplies default server configs
        -- "git@git.forgejo.dc00.stonecurve.lan:/cto/nvim-lspconfig", -- supplies default server configs
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "saghen/blink.cmp",
            -- "git@git.forgejo.dc00.stonecurve.lan:/cto/mason.nvim",
            -- "git@git.forgejo.dc00.stonecurve.lan:/cto/mason-lspconfig.nvim",
            -- "git@git.forgejo.dc00.stonecurve.lan:/cto/blink.cmp",
        },
        config = function()
            -- 1. Capabilities for every server (adds completion, folding support)
            local caps = require("blink.cmp").get_lsp_capabilities()
            caps.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }
            vim.lsp.config("*", { capabilities = caps })

            -- 2. Per-server settings
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { checkThirdParty = false },
                        completion = { callSnippet = "Replace" },
                        hint = { enable = true },
                    },
                },
            })

            vim.lsp.config("ts_ls", {
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = "all",
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                        },
                    },
                },
            })

            vim.lsp.config("gopls", {
                settings = {
                    gopls = {
                        hints = { parameterNames = true, assignVariableTypes = true },
                        analyses = { unusedparams = true },
                        staticcheck = true,
                    },
                },
            })
            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--compile-commands-dir=.",
                    "--compile_args_from=filesystem",
                    "--all-scopes-completion",
                    "--background-index",
                    "--clang-tidy",
                    "--cross-file-rename",
                    "--completion-parse=always",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                    "--header-insertion=never",
                    "--limit-results=0",
                    "-j=2",
                    "--pch-storage=memory",
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
            })

            -- Python: basedpyright does types, ruff does lint/format/imports
            vim.lsp.config("basedpyright", {
                settings = {
                    basedpyright = {
                        disableOrganizeImports = true, -- let ruff handle it
                        analysis = {
                            typeCheckingMode = "standard", -- "basic" is quieter, "strict" is harsh
                            autoImportCompletions = true,
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "openFilesOnly",
                            inlayHints = {
                                callArgumentNames = true,
                                variableTypes = true,
                                functionReturnTypes = true,
                            },
                        },
                    },
                },
            })
            vim.lsp.config("ruff", {})
            -- Lua
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { checkThirdParty = false },
                        completion = { callSnippet = "Replace" },
                        hint = { enable = true },
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            -- Bash
            vim.lsp.config("bashls", {
                filetypes = { "sh", "bash" },
            })
            -- 3. Install + auto-enable servers
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ts_ls",
                    "pyright",
                    "clangd",
                    "basedpyright",
                    "ruff",
                    "jsonls",
                    "yamlls",
                    "bashls",
                },
                automatic_enable = true, -- calls vim.lsp.enable() for installed servers
            })
            local function jump_split(vertical, fn)
                return function()
                    vim.cmd(vertical and "vsplit" or "split")
                    fn()
                end
            end

            -- 4. Per-buffer setup when a server attaches
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
                callback = function(ev)
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    local buf = ev.buf
                    local map = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = "LSP: " .. desc })
                    end

                    -- coc-style navigation
                    map("n", "[d", jump_split(true, vim.lsp.buf.definition), "Definition")
                    map("n", "]d", jump_split(true, vim.lsp.buf.declaration), "Declaration")
                    map("n", "[i", jump_split(true, vim.lsp.buf.implementation), "Implementation")
                    map("n", "]t", jump_split(true, vim.lsp.buf.type_definition), "Type definition")
                    map("n", "[r", vim.lsp.buf.references, "References")
                    map("n", "]r", vim.lsp.buf.rename, "Rename")
                    map("n", "]q", vim.lsp.buf.hover, "Hover")
                    map({ "n", "v" }, "[a", vim.lsp.buf.code_action, "Code action")
                    map("n", "]v", vim.lsp.codelens.run, "Run codelens")
                    map("i", "<C-s>", vim.lsp.buf.signature_help, "Signature help")

                    -- Inlay hints (toggleable)
                    if client and client:supports_method("textDocument/inlayHint") then
                        vim.lsp.inlay_hint.enable(false, { bufnr = buf })
                        map("n", "[v", function()
                            vim.lsp.inlay_hint.enable(
                                not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }),
                                { bufnr = buf }
                            )
                        end, "Toggle inlay hints")
                    end

                    -- -- Codelens
                    -- if client and client:supports_method("textDocument/codeLens") then
                    --   vim.lsp.codelens.refresh({ bufnr = buf })
                    --   vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" },
                    --     { buffer = buf, callback = function() vim.lsp.codelens.refresh({ bufnr = buf }) end })
                    -- end

                    -- Folding via LSP
                    if client and client:supports_method("textDocument/foldingRange") then
                        vim.wo[0][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
                        vim.wo[0][0].foldmethod = "expr"
                    end
                    if client and client.name == "ruff" then
                        client.server_capabilities.hoverProvider = false
                    end
                    if client and client.name == "clangd" then
                        map("n", "[q", "<cmd>LspClangdSwitchSourceHeader<cr>", "Switch header/source")
                    end
                end,
            })
        end,
    },

    -- LSP progress spinner (coc's statusline progress)
    { "j-hui/fidget.nvim", opts = {} },
    -- { "git@git.forgejo.dc00.stonecurve.lan:/cto/fidget.nvim", opts = {} },

    -- Better Lua dev experience (vim API completions)
    {
        "folke/lazydev.nvim",
        -- "git@git.forgejo.dc00.stonecurve.lan:/cto/lazydev.nvim",
        ft = "lua",
        opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
    },
}
