local has_helpers, helpers = pcall(require, "core.helpers")

if not has_helpers then
    return
end

helpers.nmap("<leader>ee", ":NvimTreeToggle<CR>", "Toggle NvimTr[e][e]")
