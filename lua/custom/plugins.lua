local plugins = {
    {
        "nickjvandyke/opencode.nvim",
        version = "*", -- Latest stable release
        lazy = false,
        dependencies = {
        {
          -- `snacks.nvim` integration is recommended, but optional
          ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
          "folke/snacks.nvim",
          optional = true,
          opts = {
            input = {}, -- Enhances `ask()`
            picker = { -- Enhances `select()`
              actions = {
                opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
              },
              win = {
                input = {
                  keys = {
                    ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                  },
                },
              },
            },
          },
        },
        },
        config = function()
        ---@type opencode.Opts
        vim.g.opencode_opts = {
          -- Your configuration, if any; goto definition on the type or field for details
        }

        vim.o.autoread = true -- Required for `opts.events.reload`

        -- Recommended/example keymaps
        vim.keymap.set({ "n", "x" }, "<leader>aa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
        vim.keymap.set({ "n", "x" }, "<leader>ae", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
        vim.keymap.set({ "n", "t" }, "<leader>at", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

        vim.keymap.set({ "n", "x" }, "<leader>ar",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
        vim.keymap.set("n",          "<leader>al", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

        vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll opencode up" })
        vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })

        end,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy=false,
    },
    {
        "tpope/vim-obsession",
        lazy=false,
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio"
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {}
        },
    },
    {
        "mfussenegger/nvim-dap",
        config = function(_, _)
            require("core.utils").load_mappings("dap")
        end,
        opts = {
            autoformat = false
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "codelldb",
                "zls",
                "glsl_analyzer",
            }
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                -- defaults 
                "vim",
                "lua",
                "vimdoc",

                -- dev
                "cpp",
                "zig",
                "glsl",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy=false,
        requires = {
            "nvim-treesitter/nvim-treesitter"
        },
    }
}
return plugins
