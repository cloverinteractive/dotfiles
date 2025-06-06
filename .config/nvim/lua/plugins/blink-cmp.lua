return {
    "saghen/blink.cmp",
    dependencies = {
        { "L3MON4D3/LuaSnip", version = "v2.*" },
    },
    event = "LspAttach",

    -- use a release tag to download pre-built binaries
    version = "1.*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- see the "default configuration" section below for full documentation on how to define
        -- your own keymap.
        keymap = {
            preset = "default",
            -- ["<CR>"] = { "accept", "fallback" },
            ["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
            ["<Up>"] = {},
            ["<Down>"] = {},
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",

            kind_icons = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
            },
        },

        completion = {
            accept = { auto_brackets = { enabled = false } },

            menu = {
                -- auto_show = function(ctx)
                --     return ctx.mode ~= "cmdline"
                --         or not vim.tbl_contains(
                --             { "/", "?" },
                --             vim.fn.getcmdtype()
                --         )
                -- end,

                draw = {
                    columns = {
                        { "kind_icon" },
                        {
                            "label",
                            "label_description",
                            "source_name",
                            gap = 1,
                        },
                    },
                },
            },

            -- Display a preview of the selected item on the current line
            ghost_text = { enabled = false },
        },

        -- Add LuaSnip to completion suggestions
        snippets = { preset = "luasnip" },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
            -- optionally disable cmdline completions
            -- cmdline = {},
        },

        -- experimental signature help support
        -- signature = { enabled = true }

        enabled = function()
            return not vim.tbl_contains({
                "Avante",
                "AvanteInput",
                "DressingInput",
                "Telescope",
                "TelescopePrompt",
                "markdown",
                "oil",
                "org",
            }, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
        end,
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" },

    sigature = { enabled = true },
}
