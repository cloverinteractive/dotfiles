return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "linrongbin16/lsp-progress.nvim" },
        { "nvim-tree/nvim-web-devicons", opt = true },
    },
    event = { "VimEnter" },
    opts = function()
        local lazy_status = require("lazy.status")

        --- From: https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets
        --- @param trunc_width number trunctates component when screen width is less then trunc_width
        --- @param trunc_len number truncates component to trunc_len number of chars
        --- @param hide_width number hides component when window width is smaller then hide_width
        --- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
        --- return function that can format the component accordingly
        local function truncate(trunc_width, trunc_len, hide_width, no_ellipsis)
            return function(str)
                local win_width = vim.fn.winwidth(0)
                if hide_width and win_width < hide_width then
                    return ""
                elseif
                    trunc_width
                    and trunc_len
                    and win_width < trunc_width
                    and #str > trunc_len
                then
                    return str:sub(1, trunc_len)
                        .. (no_ellipsis and "" or "…")
                end
                return str
            end
        end

        return {
            options = {
                component_separators = { left = "╲", right = "╱" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = truncate(130, 3, 0, true),
                    },
                },
                lualine_b = {
                    {
                        "branch",
                        fmt = truncate(70, 15, 65, true),
                        separator = "",
                    },

                    {
                        "diff",
                        symbols = {
                            added = " ",
                            modified = " ",
                            removed = " ",
                        },
                        fmt = truncate(0, 0, 60, true),
                    },
                    {
                        "diagnostics",
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = " ",
                        },
                    },
                },
                lualine_c = {
                    "filename",
                    function()
                        return require("lsp-progress").progress()
                    end,
                },
                lualine_x = {
                    {
                        function()
                            return "recording @" .. vim.fn.reg_recording()
                        end,
                        cond = function()
                            return vim.fn.reg_recording() ~= ""
                        end,
                        color = { fg = "Search" },
                        separator = "",
                    },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        fmt = truncate(0, 0, 160, true),
                        separator = "",
                    },
                    {
                        "encoding",
                        fmt = truncate(0, 0, 140, true),
                    },
                    {
                        "fileformat",
                        fmt = truncate(0, 0, 140, true),
                    },
                    { "filetype" },
                },
                lualine_y = {
                    { "progress", fmt = truncate(0, 0, 40, true) },
                },
                lualine_z = {
                    { "location", fmt = truncate(0, 0, 80, true) },
                },
            },
            inactive_sections = {
                lualine_c = {
                    {
                        "pretty_path",
                        -- 'filename',
                        symbols = {
                            modified = "+", -- Text to show when the file is modified.
                            readonly = "", -- Text to show when the file is non-modifiable or readonly.
                        },
                    },
                },
            },
        }
    end,
    config = function(_, opts)
        require("lualine").setup(opts)

        vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            group = "lualine_augroup",
            pattern = "LspProgressStatusUpdated",
            callback = require("lualine").refresh,
        })
    end,
}
