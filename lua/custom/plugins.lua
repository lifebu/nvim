local plugins = {
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     config = function ()
    --         require("copilot").setup({
    --             suggestion = { enabled = false },
    --             panel = { enabled = false },
    --         })
    --     end,
    --     event="InsertEnter",
    -- },
    -- {
    --     "zbirenbaum/copilot-cmp",
    --     config = function ()
    --         require("copilot_cmp").setup()
    --     end,
    -- },
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
