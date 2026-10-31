-- EJS baked in support
vim.filetype.add({ extension = { ejs = "ejs" } })
vim.treesitter.language.register("embedded_template", "ejs")

vim.o.foldlevelstart = 99

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        vim.wo.foldcolumn = "1"
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldlevel = 99

        -- Start Tree-sitter highlighting when a parser is available
        -- for this buffer's filetype.
        pcall(vim.treesitter.start, args.buf)
    end,
})
