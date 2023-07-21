local ok, helpers = pcall(require, "core.helpers")

if not ok then
  return
end

-- Floating Terminal
helpers.nmap("<space>ft", "<cmd>Lspsaga term_toggle<cr>", "Floating Terminal")

-- Diagnostics
helpers.nmap(
    "[e",
    "<cmd>Lspsaga diagnostic_jump_next<cr>",
    "Lspsaga Next Diagnostic"
)

helpers.nmap(
    "]e",
    "<cmd>Lspsaga diagnostic_jump_prev<cr>",
    "Lspsaga Prev Diagnostic"
)

-- Hover
helpers.nmap("K", "<cmd>Lspsaga hover_doc<cr>", "Lspsaga Hover Doc")

-- Finder
helpers.nmap("<space>lf", "<cmd>Lspsaga finder<cr>", "Lspsaga Lsp Finder")

-- Rename
helpers.nmap("<space>lr", "<cmd>Lspsaga rename<cr>", "Lspsaga Rename")

-- Code Outline
helpers.nmap("<space>lo", "<cmd>Lspsaga outline<cr>", "Lspsaga Outline")
