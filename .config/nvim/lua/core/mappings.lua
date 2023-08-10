local has_helpers, helpers = pcall(require, "core.helpers")

if not has_helpers then
    return
end

-- Terminal
helpers.tmap("<Esc>", "<C-\\><C-n>", "Exit terminal mode")
