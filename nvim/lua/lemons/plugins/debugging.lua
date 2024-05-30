-- sticking to printf debugging for now

return {
    -- {
    --     "mfussenegger/nvim-dap",
    --     dependencies = {
    --         "rcarriga/nvim-dap-ui",
    --         "theHamsta/nvim-dap-virtual-text",
    --         "nvim-telescope/telescope-dap.nvim"
    --     },

    --     config = function()
    --         require("telescope").load_extension("dap")
    --         require("nvim-dap-virtual-text").setup()

    --         vim.fn.sign_define('DapBreakpoint', {
    --             text='🔴',
    --             texthl='DapBreakpoint',
    --             linehl='DapBreakpoint',
    --             numhl='DapBreakpoint'
    --         })

    --         local dap, dapui = require("dap"), require("dapui")
    --         dapui.setup()

    --         dap.listeners.after.event_initialized["dapui_config"] = function()
    --             dapui.open()
    --         end
    --         dap.listeners.before.event_terminated["dapui_config"] = function()
    --             dapui.close()
    --         end
    --         dap.listeners.before.event_exited["dapui_config"] = function()
    --             dapui.close()
    --         end

    --         vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
    --         vim.keymap.set("n", "<F10>", function() dao.step_over() end)
    --         vim.keymap.set("n", "<F11>", function() dap.step_into() end)
    --         vim.keymap.set("n", "<F12>", function() dap.step_out() end)
    --         vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end)
    --         vim.keymap.set("n", "<leader>bc", function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end)
    --         vim.keymap.set("n", "<leader>bl", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end)
    --         vim.keymap.set("n", "<leader>dr", function() dap.repl_open() end)
    --         vim.keymap.set("n", "<leader>dg", function() require("dap-go").debug_test() end)
    --     end
    -- },

    -- {
    --     "leoluz/nvim-dap-go",
    --     config = function()
    --         require("dap-go").setup()
    --     end
    -- },

    -- {
    --     "mrcjkb/rustaceanvim",
    --     version = "^4",
    --     ft = { "rust" }
    -- }
}
