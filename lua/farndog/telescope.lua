local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function()
	builtin.find_files({
		hidden = true,
		layout_config = {
			width = 200
		}
	})
end)

vim.keymap.set('n', '<C-p>', builtin.git_files, {});

vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({
		hidden = true,
		layout_config = {
			width = 200
		},
		search = vim.fn.input("Grep for > ")
	});
end);
