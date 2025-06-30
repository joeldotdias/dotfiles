return {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    cmd = "FzfLua",
    keys = function()
        local fzf = require("fzf-lua")
        return {
            { "<leader>pf", fzf.files },
            { "<leader>of", fzf.oldfiles },
            { "<leader>pb", fzf.buffers },
            { "<leader>tj", fzf.help_tags },
            { "<leader>gw", fzf.grep_cword },
            { "<leader>lg", fzf.live_grep },

            {
                "<leader>fb",
                function()
                    fzf.blines({
                        winopts = {
                            height = 0.6,
                            width = 0.5,
                            preview = { vertical = "up:70%" },
                            -- Disable Treesitter highlighting for the matches.
                            treesitter = {
                                enabled = false,
                                fzf_colors = { ["fg"] = { "fg", "CursorLine" }, ["bg"] = { "bg", "Normal" } },
                            },
                        },
                        fzf_opts = {
                            ["--layout"] = "reverse",
                        },
                    })
                end,
                desc = "Buffer lines",
                mode = { "n", "x" },
            },
            {
                "<leader>cf",
                function()
                    fzf.files({
                        cwd = "$HOME/.dotfiles",
                    })
                end,
                mode = { "n" },
            },
        }
    end,
    opts = {
        { "border-fused", "hide" },
        defaults = { git_icons = false },
        winopts = {
            preview = {
                scrollbar = false,
            },
        },
        fzf_opts = {
            ["--info"] = "default",
            ["--layout"] = "reverse-list",
        },
        keymap = {
            builtin = {
                ["<C-i>"] = "toggle-preview",
            },
        },
        lsp = {
            code_actions = {
                winopts = {
                    height = 0.7,
                    width = 0.6,
                    -- relative = "cursor", -- not sure how i feel about this
                    preview = {
                        hidden = true,
                        vertical = "down:50%",
                    },
                },
            },
        },
        oldfiles = {
            include_current_session = true,
        },
    },

    init = function()
        ---@diagnostic disable-next-line: duplicate-set-field
        vim.ui.select = function(items, opts, on_choice)
            local fzf_ui_select = require("fzf-lua.providers.ui_select")

            if not fzf_ui_select.is_registered() then
                fzf_ui_select.register()
            end

            if #items > 0 then
                return vim.ui.select(items, opts, on_choice)
            end
        end
    end,
}
