local dap = require('dap');
local dap_vscode_js = require('dap-vscode-js');
local dapui = require('dapui');


dap_vscode_js.setup({
    node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    debugger_path = "/Users/lewisfarnworth/.local/share/nvim/mason/packages/js-debug-adapter",
    -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
    -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})


dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = '/Users/lewisfarnworth/dev/debugger/vscode-node-debug2/out/src/nodeDebug.js'
}

local function attach()
    dap.run({
        type = 'node2',
        request = 'attach',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        skipFiles = {'<node_internals>/**/*.js'},
    })
end

--for _, language in ipairs({ "typescript", "javascript" }) do
--    dap.configurations[language] = {
--        {
--            {
--                type = "node2",
--                request = "launch",
--                name = "Launch file",
--                program = "${file}",
--                cwd = "${workspaceFolder}",
--            },
--            {
--                type = "node2",
--                request = "attach",
--                name = "Attach",
--                processId = require'dap.utils'.pick_process,
--                cwd = "${workspaceFolder}",
--            }
--        },
--        {
--            {
--                type = "node2",
--                request = "launch",
--                name = "Debug Jest Tests",
--                -- trace = true, -- include debugger info
--                runtimeExecutable = "node",
--                runtimeArgs = {
--                    "./node_modules/jest/bin/jest.js",
--                    "--runInBand",
--                },
--                rootPath = "${workspaceFolder}",
--                cwd = "${workspaceFolder}",
--                console = "integratedTerminal",
--                internalConsoleOptions = "neverOpen",
--            }
--        }
--    }
--end

dapui.setup();
vim.keymap.set('n', '<leader>D', function() dapui.toggle() end)
vim.keymap.set('n', '<leader>da', attach);
