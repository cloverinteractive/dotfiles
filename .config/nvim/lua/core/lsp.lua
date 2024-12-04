local ok, helpers = pcall(require, "core.helpers")

if not ok then
    return
end

--- @module "vim"
--- @type vim.diagnostic.Opts.Signs
local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(
        sign.name,
        { texthl = sign.name, text = sign.text, numhl = "" }
    )
end

--- @module "vim"
--- @type vim.diagnostic.Opts
local config = {
    virtual_text = {
        source = "if_many",
    },
    -- show signs
    signs = {
        active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        source = true,
        header = "",
        prefix = "",
    },
}

vim.diagnostic.config(config)

vim.diagnostic.get(0, { severity = { min = vim.diagnostic.severity.WARN } })

-- Turn inlay hints on by default
vim.lsp.inlay_hint.enable(true)

-- Global Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
helpers.nmap(
    "<space>e",
    vim.diagnostic.open_float,
    "LSP - Open diagnostics float"
)

helpers.nmap("[d", vim.diagnostic.goto_prev, "LSP - Go to previous diagnostic")
helpers.nmap("]d", vim.diagnostic.goto_next, "LSP - Go to next diagnostic")

helpers.nmap(
    "<space>q",
    vim.diagnostic.setloclist,
    "LSP - Add buffer diagnostics to location list"
)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions

        helpers.nmap(
            "gD",
            vim.lsp.buf.declaration,
            { buffer = ev.buf, desc = "Jump to code declaration" }
        )

        helpers.nmap(
            "gd",
            vim.lsp.buf.definition,
            { buffer = ev.buf, desc = "Jump to code definition" }
        )

        helpers.nmap("K", vim.lsp.buf.hover, {
            buffer = ev.buf,
            desc = "Display hover information in floating window",
        })

        helpers.nmap("gi", vim.lsp.buf.implementation, {
            buffer = ev.buf,
            desc = "List implementations in quickfix window",
        })

        helpers.nmap("<C-k>", vim.lsp.buf.signature_help, {
            buffer = ev.buf,
            desc = "Display signature information in floating window",
        })

        helpers.nmap("<space>wa", vim.lsp.buf.add_workspace_folder, {
            buffer = ev.buf,
            desc = "Add the folder at path to the workspace folders",
        })

        helpers.nmap("<space>wr", vim.lsp.buf.remove_workspace_folder, {
            buffer = ev.buf,
            desc = "Remove the folder at path from the workspace folders",
        })

        helpers.nmap("<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, { buffer = ev.buf, desc = "List workspace folders" })

        helpers.nmap(
            "<space>D",
            vim.lsp.buf.type_definition,
            { buffer = ev.buf, desc = "Jumps to the definition of the type" }
        )

        helpers.nmap(
            "<space>rn",
            vim.lsp.buf.rename,
            { buffer = ev.buf, desc = "Renames all refereces to the symbol" }
        )

        helpers.nmap("<space>ca", vim.lsp.buf.code_action, {
            buffer = ev.buf,
            desc = "Selects code action available at current cursor position",
        })

        helpers.nmap("gr", vim.lsp.buf.references, {
            buffer = ev.buf,
            desc = "List all the references in the quickfix window",
        })

        helpers.nmap("<leader>i", function()
            vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ 0 }),
                { 0 }
            )
        end, "Toggle inlay hints")
    end,
})
