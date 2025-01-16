-- Basics
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Changing config
vim.keymap.set("n", "<space>s", "<cmd>source %<CR>") -- source config file
vim.keymap.set("n", "<space>x", ":.lua<CR>") -- run current line
vim.keymap.set("v", "<space>x", ":lua<CR>") -- run visual selection

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "(f)ind (f)iles" })
vim.keymap.set("n", "<leader>fc", function() require("telescope.builtin").find_files { cwd = vim.fn.stdpath("config") } end, { desc = "(f)ind (c)onfig" })

-- Which-key
vim.keymap.set("n", "<leader>wk", function() vim.cmd("WhichKey") end, { desc = "(w)hich (k)ey" })

