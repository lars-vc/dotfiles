--====DAP====--
local dap = require("dap")
local dapui = require("dapui")
local dapvirt = require("nvim-dap-virtual-text")

--==Keymaps==--
vim.keymap.set('n', '<leader>dd', dap.continue, { noremap = true })
vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, { noremap = true })
vim.keymap.set('n', '<leader>dbm', function()
    dap.set_breakpoint({ nil, nil, vim.fn.input('[Log msg] > ') })
end, { noremap = true })
vim.keymap.set('n', '<leader>dbc', function()
    dap.set_breakpoint(vim.fn.input '[Condition] > ')
end, { noremap = true })
vim.keymap.set('n', '<leader>dbx', dap.clear_breakpoints, { noremap = true })
vim.keymap.set('n', '<leader>dbl', dap.list_breakpoints, { noremap = true })
vim.keymap.set('n', '<leader>dx', dap.terminate, { noremap = true })
vim.keymap.set('n', '<leader>dr', dap.restart, { noremap = true })
vim.keymap.set('n', '<leader>dl', dap.run_last, { noremap = true })
vim.keymap.set('n', '<leader>dc', dap.run_to_cursor, { noremap = true })
vim.keymap.set('n', '<leader>dp', dap.pause, { noremap = true })
vim.keymap.set('n', '<S-j>', dap.step_into, { noremap = true })
vim.keymap.set('n', '<S-k>', dap.step_back, { noremap = true })
vim.keymap.set('n', '<S-l>', dap.step_over, { noremap = true })
vim.keymap.set('n', '<S-h>', dap.step_out, { noremap = true })

--==Styling==--
local sign = vim.fn.sign_define

sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })

--==Integration==--
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
    dapvirt.enable()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
    dapvirt.disable()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
    dapvirt.disable()
end

--==Language configs==--
-- Python -- (install debugpy)
dap.adapters.python = {
    type = 'executable';
    command = '/usr/bin/python';
    args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = 'launch';
        name = "Launch file";

        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}"; -- This configuration will launch the current file if used.
        pythonPath = function()
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end;
    },
}

-- C++ -- (install llvm)
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
    name = 'lldb'
}
dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- 💀
        -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
        --
        --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        --
        -- Otherwise you might get the following error:
        --
        --    Error on launch: Failed to attach to the target process
        --
        -- But you should be aware of the implications:
        -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
        -- runInTerminal = false,
    },
}

-- C --
dap.configurations.c = dap.configurations.cpp

-- Rust --
dap.configurations.rust = dap.configurations.cpp

-- Javascript -- (install node-debug2)
-- how to install node-debug2
-- mkdir -p ~/.dev/microsoft
-- git clone https://github.com/microsoft/vscode-node-debug2.git ~/.dev/microsoft/vscode-node-debug2
-- cd ~/.dev/microsoft/vscode-node-debug2
-- npm install
-- NODE_OPTIONS=--no-experimental-fetch npm run buil

dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}
dap.configurations.javascript = {
    {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
    },
    {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require 'dap.utils'.pick_process,
    },
}
