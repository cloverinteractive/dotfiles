return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = { char = "│", tab_char = "│", highlight = "IblIndent" },
        scope = {
            char = "│",
            enabled = true,
            show_start = false,
            show_end = false,
            highlight = "IblScope",
        },
    },
    config = function(_, opts)
        local hooks = require("ibl.hooks")

        ---@param color number
        ---@param shift number
        ---@return number
        local function get_color_component(color, shift)
            return bit.band(bit.rshift(color, shift), 0xFF)
        end

        ---@param fg number
        ---@param bg number
        ---@param alpha number
        ---@return number?
        local function blend_color(fg, bg, alpha)
            if not fg or not bg then
                return
            end

            local function blend(fg_comp, bg_comp)
                return math.floor(fg_comp * alpha + bg_comp * (1 - alpha))
            end

            local r =
                blend(get_color_component(fg, 16), get_color_component(bg, 16))
            local g =
                blend(get_color_component(fg, 8), get_color_component(bg, 8))
            local b =
                blend(get_color_component(fg, 0), get_color_component(bg, 0))

            return bit.bor(bit.lshift(r, 16), bit.lshift(g, 8), b)
        end

        hooks.register(hooks.type.ACTIVE, function()
            return not vim.tbl_contains({ "markdown", "org" }, vim.bo.filetype)
        end)

        -- Setup highlights based on background/foreground colors
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
            local bg = normal_hl.bg or 0
            local fg = normal_hl.fg or 0xFFFFFF

            -- Set indent and scope highlights with different intensities
            local highlights = {
                { name = "IblIndent", alpha = 0.25 },
                { name = "IblScope", alpha = 0.45 },
            }

            for _, hl in ipairs(highlights) do
                vim.api.nvim_set_hl(0, hl.name, {
                    fg = blend_color(fg, bg, hl.alpha),
                    nocombine = true,
                })
            end
        end)

        require("ibl").setup(opts)
    end,
}
