return {
    "luukvbaal/statuscol.nvim",
    config = function()
        local builtin = require("statuscol.builtin")

        -- Configure fold appearance
        vim.api.nvim_set_hl(0, "FoldSeparator", { fg = "NONE", bg = "NONE" })
        vim.api.nvim_set_hl(0, "Folded", {})
        vim.api.nvim_set_hl(0, "FoldColumn", { link = "FoldSeparator" })

        vim.opt.fillchars:append({
            foldopen = "",
            foldclose = "",
            foldsep = " ",
            diff = "│",
            eob = " ",
        })

        -- Common sign column settings
        local sign_config = {
            maxwidth = 1,
            colwidth = 2,
            auto = true,
            fillcharhl = "LineNr",
        }

        require("statuscol").setup({
            relculright = true,
            foldfunc = "builtin",
            setopt = true,
            segments = {
                -- Diagnostic signs
                {
                    sign = vim.tbl_extend("force", sign_config, {
                        namespace = { "diagnostic" },
                        fillchar = " ",
                    }),
                    click = "v:lua.ScSa",
                },

                -- Git signs
                {
                    sign = vim.tbl_extend("force", sign_config, {
                        namespace = { "gitsigns" },
                    }),
                    click = "v:lua.ScSa",
                },

                -- Fold column
                {
                    text = { builtin.foldfunc },
                    click = "v:lua.ScFa",
                    condition = { builtin.not_empty },
                },

                -- Line numbers
                {
                    text = {
                        function(args)
                            return string.format(
                                " %s  ",
                                builtin.lnumfunc(args)
                            )
                        end,
                    },
                    click = "v:lua.ScLa",
                    hl = "LineNr",
                },
            },
        })
    end,
}
