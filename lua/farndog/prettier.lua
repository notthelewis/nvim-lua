local prettier = require("prettier")

prettier.setup({
    bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
    filetypes = {
        "css",
        "graphql",
        "html",
        "lua",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
    cli_options = {
        arrowParens = "avoid",
        bracketSpacing = true,
        printWidth = 100,
        semi = true,
        singleQuote = true,
        tabWidth = 4,
        trailingComma = "none",
    }
})
