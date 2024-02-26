return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim",
        },

        config = function()
            require("telescope").load_extension("dap")
            require("nvim-dap-virtual-text").setup()
            
            vim.fn.sign_define('DapBreakpoint', {
                text='🔴',
                texthl='DapBreakpoint',
                linehl='DapBreakpoint',
                numhl='DapBreakpoint'
            })
            
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            vim.keymap.set("n", "<leader>dc", ":lua require'dap'.continue()<CR>")
            vim.keymap.set("n", "<F10>", ":lua require'dap'.step_over()<CR>")
            vim.keymap.set("n", "<F11>", ":lua require'dap'.step_into()<CR>")
            vim.keymap.set("n", "<F12>", ":lua require'dap'.step_out()<CR>")
            vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
            vim.keymap.set("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
            vim.keymap.set("n", "<leader>bl", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
            vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl_open()<CR>")
            vim.keymap.set("n", "<leader>dg", ":lua require'dap-go'.debug_test()<CR>")

        end
    },

    -- Individual language adapters
    {
        "leoluz/nvim-dap-go",
        config = function()
            require("dap-go").setup()
        end
    },

    {
        "mrcjkb/rustaceanvim",
        version = "^4",
        ft = { "rust" }
    }
}
