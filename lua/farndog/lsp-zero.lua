local lsp = require('lsp-zero').preset({
  -- name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

local lspconfig = require('lspconfig');
local cmp = require('cmp');

-- Completion engine setup
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)

            -- potential replacement in future
            -- Thinking of adding support to switch into the window with <C-w> and do searching/filtering in 
            -- completions/documentation.. Big project but could be fun 
            --
            -- vim.snippet.expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered();
        -- documentation = cmp.config.window.bordered();
        documentation = {
            max_height = 15,
            max_width = 60,
            border = 'rounded',
            col_offset = 0,
            side_padding = 1,
            winhighlight = 'Normal:Normal,FloatBorder:Normal,CursorLine:Visual,Search:None',
            zindex = 1001
        },
    },
    -- view = {
    --     entries = "native"
    -- },
    mapping = cmp.mapping.preset.insert({
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-u>'] = cmp.mapping.scroll_docs(4) ,
        ['<C-d>'] = cmp.mapping.scroll_docs(-4) ,
        ['<CR>'] = cmp.mapping.confirm({ select = true })
    }),
    sources = cmp.config.sources({
        {name = 'nvim_lsp'},
        {name = 'nvim_lua'},
        {name = 'buffer'},
        {name = 'luasnip'},
        {name = 'path'},
    }),
});

-- Specific LSP setup 
local capabilities = require('cmp_nvim_lsp').default_capabilities();
require('mason').setup({});
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'lua_ls',
        'emmet_ls',
        'gopls',
    },
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                capabilities = capabilities,
            })
        end,

        lua_ls = function()
            lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        end,

        gopls = function()
            lspconfig.gopls.setup({
                capabilities = capabilities,

                root_dir = function(fname)
                    return lspconfig.util.root_pattern 'go.work'(fname) or lspconfig.util.root_pattern('go.mod', '.git')(fname)
                end,
            })
        end,

        emmet_ls = function()
            lspconfig.emmet_ls.setup({
                filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "hbs" },
                init_options = {
                    html = {
                        options = {
                            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                            ["bem.enabled"] = true,
                        },
                    },
                }
            })
        end
    }
});

-- Keybindings
lsp.on_attach(function (_, bufnr)
   local opts = { buffer = bufnr };

	-- code, go to definitions
	vim.keymap.set('n', '<leader>cgd', function() vim.lsp.buf.definition() end, opts);
	vim.keymap.set('n', '<leader>cgt', function() vim.lsp.buf.type_definition() end, opts);
	vim.keymap.set('n', '<leader>cgr', function() vim.lsp.buf.references() end, opts);

	-- code action
	vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)

	-- code rename symbol
	vim.keymap.set('n', '<leader>crn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)

	-- code show errors
	vim.keymap.set('n', '<leader>cse', '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>', opts)

	-- go to errors
	vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts);
	vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts);

	-- function signature help
	vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts);
end)
