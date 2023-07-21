local ok, lspsaga = pcall(require, "lspsaga")

if not ok then
    return
end

-- Additional options and tweaks at: https://dev.neovim.pro/lspsaga/

lspsaga.setup({
    -- Disabled because it messed with insert mode make `a` and `i` not insert one character off
    lightbulb = {
        enable = false,
        enable_in_insert = false,
        sign = false,
        virtual_text = false,
    },
})

require("plugins.lspsaga.mappings")
