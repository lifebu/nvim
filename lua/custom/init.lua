local opt = vim.opt

-------------------------------------- options ------------------------------------------

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4

-- Numbers
vim.wo.relativenumber = true

-- Disable zig auto safe.
vim.g.zig_fmt_autosave = 0
