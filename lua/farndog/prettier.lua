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
  ['null-ls'] = {
      condition = function() 
          return prettier.config_exists({
              -- If 'false', skips checking config.json
              check_package_json = true
          })
      end,
      timeout = 5000
  },
  config_precedence = 'prefer-file',
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
