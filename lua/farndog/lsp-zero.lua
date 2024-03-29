local lsp = require('lsp-zero');
local cmp = require('cmp');

lsp.preset('recommended');

lsp.ensure_installed({
	-- 'tsserver',
	-- 'eslint',
	'lua_ls',
	'rust_analyzer',
    'emmet_ls'
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
	local opts = { buffer = bufnr };

	-- code, go to definitions
	vim.keymap.set('n', '<leader>cgd', function() vim.lsp.buf.definition() end, opts);
	vim.keymap.set('n', '<leader>cgt', function() vim.lsp.buf.type_definition() end, opts);
	vim.keymap.set('n', '<leader>cgr', function() vim.lsp.buf.references() end, opts);
	vim.keymap.set('n', '<leader>cga', function() vim.lsp.buf.code_action() end, opts);

    -- go to errors
	vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts);
	vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts);

	-- code rename symbol
    vim.keymap.set('n', '<leader>crn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

    -- code show errors
    vim.keymap.set('n', '<leader>cse', '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>', opts)

    -- Code action
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

    -- function signature help
	vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts);



end);



lsp.nvim_workspace()
lsp.setup();

lsp.setup({
    ["emmet_ls"] = {
        filetypes = {
             "css",
             "eruby",
             "html",
             "javascript",
             "javascriptreact",
             "less",
             "sass",
             "scss",
             "svelte",
             "pug",
             "typescriptreact",
             "vue",
             "hbs"
         }
    }
})

-- lsp.emmet_ls.setup({
--     filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "hbs" },
--     init_options = {
--       html = {
--         options = {
--           -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--           ["bem.enabled"] = true,
--         },
--       },
--     }
-- })

vim.diagnostic.config({
    virtual_text = true
})
