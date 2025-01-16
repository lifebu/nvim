-- which-key: Preview of keyboard shortcuts
return {
  {
      "folke/which-key.nvim",
      keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
      opts = {
      },
      cmd = "WhichKey",
      config = function(_, opts)
          require("which-key").setup(opts)
      end,
  }
}
