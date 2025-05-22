--------------------------------------------------------------------------------
require("leap").set_default_mappings()
--------------------------------------------------------------------------------
-- require('leap').opts.preview_filter =
-- function (ch0, ch1, ch2)
-- return not (
-- ch1:match('%s') or
-- ch0:match('%a') and ch1:match('%a') and ch2:match('%a')
-- )
-- end
--------------------------------------------------------------------------------
require("leap").opts.equivalence_classes = { " \t\r\n", "([{", ")]}", "'\"`" }
require("leap").opts.case_senstive = true
require("leap.user").set_repeat_keys("<enter>", "<backspace>")
--------------------------------------------------------------------------------
vim.api.nvim_create_augroup("LeapHighlights", { clear = true })
vim.api.nvim_create_autocmd({ "Colorscheme" }, {
    group = "LeapHighlights",
    pattern = { "*" },
    callback = function()
        vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey

        vim.api.nvim_set_hl(0, "LeapMatch", {
            fg = "white",
            bold = true,
            nocombine = true,
        })

        vim.api.nvim_set_hl(0, "LeapLabelPrimary", {
            fg = "orange",
            bold = true,
            nocombine = true,
        })

        vim.api.nvim_set_hl(0, "LeapLabelSecondary", {
            fg = "blue",
            bold = true,
            nocombine = true,
        })
    end,
})
vim.api.nvim_exec_autocmds("Colorscheme", { group = "LeapHighlights" })
--------------------------------------------------------------------------------
