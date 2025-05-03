--------------------------------------------------------------------------------
-- telescope links
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close,
                ['<C-d>'] = actions.delete_buffer,
            },
       },
    }
}
--------------------------------------------------------------------------------
