local lsp = require('lsp-zero');
local cmp = require('cmp');

lsp.preset('recommended');

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	'rust_analyzer'
});

local cmp_mappings = lsp.defaults.cmp_mappings({
	['<S-Tab>'] = cmp.mapping.select_prev_item(),
	['<Tab>'] = cmp.mapping.select_next_item(),
	['<CR>'] = cmp.mapping.confirm({ select = true })
});

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
});


lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false };

	-- code, go to definitions
	vim.keymap.set('n', '<leader>cgd', function() vim.lsp.buf.definition() end, opts);
	vim.keymap.set('n', '<leader>cgt', function() vim.lsp.buf.type_definition() end, opts);
	vim.keymap.set('n', '<leader>cgr', function() vim.lsp.buf.references() end, opts);
	vim.keymap.set('n', '<leader>cga', function() vim.lsp.buf.code_action() end, opts);

    -- go to errors
	vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts);
	vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts);

	-- code rename symbol
    vim.keymap.set('n', '<leadern>crn', '<cmd> lua vim.lsp.buf.rename()<cr>', opts);

    -- code show errors
    vim.keymap.set('n', 'cse', '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>', opts)

    -- function signature help
	vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts);

end);



lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
