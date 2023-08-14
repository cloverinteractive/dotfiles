return {
    cmd = { "haskell-language-server-wrapper", "--lsp" },
    filetypes = { "haskell", "lhaskell" },
    -- Server specific settings...
    settings = {
        ["haskell"] = {
            formattingProvider = "hfmt",
        },
    },
}
