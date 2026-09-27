-- Toggle fold under cursor (treesitter-based folding is set up per-filetype in treesitter.lua)
vim.keymap.set("n", "<leader>cf", "za", { desc = "Toggle fold" })
