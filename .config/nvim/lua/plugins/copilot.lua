local ok, helpers = pcall(require, "core.helpers")

if not ok then
    return
end

-- Use to enable/disable filetypes
vim.g.copilot_filetypes = { ["*"] = true, xml = false }
vim.g.copilot_assume_mapped = true

vim.g.copilot_no_tab_map = true
helpers.imap(
    "<expr> <Plug>(vmrc:copilot-dummy-map)",
    [[copilot#Accept("\<Tab>")]]
)

vim.cmd([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])
