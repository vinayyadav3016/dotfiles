--------------------------------------------------------------------------------
-- Setup nvim-cmp.
local cmp = require'cmp'
--------------------------------------------------------------------------------
cmp.setup(
    {
        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- For `vsnip` users.
                vim.fn["vsnip#anonymous"](args.body)
                -- For `luasnip` users.
                -- require('luasnip').lsp_expand(args.body)
                -- For `snippy` users.
                -- require('snippy').expand_snippet(args.body)
                -- For `ultisnips` users.
                -- vim.fn["UltiSnips#Anon"](args.body)
            end,
        },
        mapping = {
            ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            -- Specify `cmp.config.disable` if you want to remove the default
            -- `<C-y>` mapping.
            ['<C-y>'] = cmp.config.disable,
            ['<C-e>'] = cmp.mapping(
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }
            ),
            -- Accept currently selected item. Set `select` to `false` to only
            -- confirm explicitly selected items.
            ['<CR>'] = cmp.mapping.confirm({ select = false }),
        },
        sources = cmp.config.sources(
            {
                -- { name = 'nvim_lsp' },
                -- { name = 'vsnip' }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
            }, {
                -- { name = 'buffer' },
                -- { name = 'nvim_lsp_signature_help' }, -- for signature help
            }
        )
    }
)
--------------------------------------------------------------------------------
-- Use buffer source for `/`
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })
--------------------------------------------------------------------------------
-- Use cmdline & path source for ':'
-- (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':',
    {
        sources = cmp.config.sources(
            { { name = 'path' } },
            { { name = 'cmdline' } }
        )
    }
)
--------------------------------------------------------------------------------
