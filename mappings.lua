local M = {}

M.general = {
  n = {
    -- Tmux Navigate
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },

    -- Find
    ["<leader>fs"] = { "<cmd> Telescope<CR>", "Find search" },
    ["<leader>fc"] = { "<cmd> Telescope grep_string<CR>", "Find under cursor" },
    ["<leader>fd"] = { "<cmd> Telescope lsp_definitions<CR>", "Find definition" },
    ["<leader>fi"] = { "<cmd> Telescope lsp_implementations<CR>", "Find implementation" },
    ["<leader>fr"] = { "<cmd> Telescope lsp_references<CR>", "Find references" },
    ["<leader>ft"] = { "<cmd> Telescope lsp_type_definitions<CR>", "Find type" },

    -- Registers 
    ["<leader>rr"] = { "<cmd> Telescope registers<CR>", "Register" },

    -- Symbols
    ["<leader>sd"] = { "<cmd> Telescope lsp_document_symbols<CR>", "Symbols document" },
    ["<leader>sa"] = { "<cmd> Telescope treesitter<CR>", "Symbols all" },
    ["<leader>sw"] = { "<cmd> Telescope lsp_workspace_symbols<CR>", "Symbols workspace" },

    -- ClangD
    ["<leader>sh"] = { "<cmd> ClangdSwitchSourceHeader<CR>", "Switch source header" },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    },
  }
}

return M
