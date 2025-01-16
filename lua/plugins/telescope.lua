-- Telescope: Find files quickly
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    cmd = "Telescope",
    config = function(_, opts)
      local telescope = require "telescope"
      telescope.setup(opts)
    end,
  },
}
