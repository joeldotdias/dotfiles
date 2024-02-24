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

        end
    },

    -- Specific language adapters
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
	},
}
