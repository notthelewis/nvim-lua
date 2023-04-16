require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "rust" },

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
  },
}

-- Sticky headers
require'treesitter-context'.setup {
    enable = true,
    max_lines = 2,
    min_windows_height = 0,
    line_numbers = true,
    multiline_threshold = 5,
    trim_scope = 'outer',
    mode = 'topline',
    separator = nil,
    zindex = 20
}

-- Make the sticky headers purrty
vim.cmd([[hi TreesitterContext guibg=#4F4946]])
vim.cmd([[hi TreesitterContextLineNumber guifg=#AEF494 guibg=#272727]])
