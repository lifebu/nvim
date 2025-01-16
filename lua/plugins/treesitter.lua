-- Treesitter: syntax highlighting.
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    -- defaults
                    "lua", "vim", "vimdoc", "markdown", "markdown_inline",
                    -- dev
                    "cpp", "zig",
                },
                auto_install = false,
                highlight = {
                    enable = true,
                    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = true,
                },
            }
        end
    },
}
