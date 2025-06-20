--------------------------------------------------------------------------------
-- telescope links
local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close,
                ["<C-d>"] = actions.delete_buffer,
            },
        },
    },
    pickers = {
        buffers = {
            initial_mode = "normal"
        },
        marks = {
            initial_mode = "normal"
        }
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    },
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('vim_bookmarks')
--------------------------------------------------------------------------------
