-- Set of small versions of plugins. Used for statusline
return {
    {
        "echasnovski/mini.nvim",
        config = function()
            local statusline = require("mini.statusline")
            statusline.setup { use_icons = true }
        end
    },
}
