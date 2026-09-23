-- nvim-treesitter's `main` branch is an incompatible rewrite that dropped
-- require("nvim-treesitter.configs").setup{}; parsers are now installed
-- explicitly and highlighting is enabled per-filetype via Neovim's native
-- vim.treesitter API.
local parsers = {
  "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "tsx",
  "rust", "go", "gotmpl", "python", "html", "css", "bash", "fish",
}

require('nvim-treesitter').install(parsers)

-- .tmpl / .gotmpl files aren't recognised as a filetype by default.
vim.filetype.add({
  extension = {
    tmpl = "gotmpl",
    gotmpl = "gotmpl",
  },
})

local fold_filetypes = {
  "c", "lua", "vim", "help", "query", "javascript", "typescript",
  "typescriptreact", "javascriptreact", "rust", "go", "gotmpl", "python",
  "html", "css", "bash", "fish",
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = fold_filetypes,
  callback = function()
    vim.treesitter.start()
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
})

-- Sticky headers
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
}


-- Make the sticky headers purrty
vim.cmd([[hi TreesitterContext guibg=#4F4946]])
vim.cmd([[hi TreesitterContextLineNumber guifg=#AEF494 guibg=#272727]])
