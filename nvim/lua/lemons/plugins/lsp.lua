return {
    -- {
    --     "folke/lazydev.nvim",
    --     ft = "lua",
    --     opts = {},
    -- },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Mason
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            -- Schema info
            "b0o/SchemaStore.nvim",
        },

        config = function()
            -- require("neodev").setup()

            local lsp = require("lspconfig")

            -- merge native LSP capabilities with the ones provided by nvim_cmp
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )

            local Lemonade = vim.api.nvim_create_augroup("Lemonade", { clear = true })

            -- create an autocommand that sets keymaps whenever an LSP is attached to the buffer
            -- instead of passing an on_attach() function to server setup
            vim.api.nvim_create_autocmd("LspAttach", {
                group = Lemonade,
                desc = "LSP keymaps",
                callback = function(event)
                    -- helper function to set LSP keymaps
                    local lsp_key = function(keymap, func, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keymap, func, { buffer = event.buf })
                    end

                    local builtin = require("telescope.builtin")

                    lsp_key("K", vim.lsp.buf.hover)
                    lsp_key("gd", builtin.lsp_definitions)
                    lsp_key("gD", vim.lsp.buf.declaration)
                    lsp_key("gi", builtin.lsp_implementations)
                    lsp_key("<leader>D", builtin.lsp_type_definitions)
                    lsp_key("<leader>ds", builtin.lsp_document_symbols)
                    lsp_key("<leader>ws", builtin.lsp_dynamic_workspace_symbols)
                    lsp_key("<leader>ca", vim.lsp.buf.code_action)
                    lsp_key("<leader>br", builtin.lsp_references)
                    lsp_key("<leader>rn", vim.lsp.buf.rename)
                    lsp_key("<C-h>", vim.lsp.buf.signature_help, "i")
                end,
            })

            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "◍",
                    },
                },
            })

            -- {} --> use the default config
            local servers = {
                rust_analyzer = {},
                gopls = {},
                ocamllsp = {
                    manual_install = true,
                    filetypes = {
                        "ocaml",
                        "ocaml.interface",
                        "ocaml.menhir",
                        "ocaml.cram",
                    },
                },
                zls = {},
                tsserver = {
                    settings = {
                        implicitProjectConfiguration = {
                            -- checkJs = true, -- for jsdoc
                        },
                        completions = {
                            completeFunctionCalls = true,
                        },
                    },
                },
                clangd = {
                    capabilities = {
                        offsetEncoding = { "utf-16" },
                    },
                },
                bashls = {},
                -- basedpyright = {
                --     settings = {
                --         basedpyright = {
                --             typeCheckingMode = "standard",
                --         },
                --     },
                -- },
                ruff = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = {
                                version = "LuaJIT",
                            },
                            workspace = {
                                library = {
                                    vim.env.VIMRUNTIME,
                                    "${3rd}/luv/library",
                                },
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                            diagnostics = {
                                globals = { "vim", "it", "describe", "before_each", "after_each", "silent" },
                                disable = { "missing-fields" },
                            },
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                },
                emmet_language_server = {},
                templ = {},
                html = {},
                tailwindcss = {
                    root_dir = lsp.util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
                },
                yamlls = {
                    settings = {
                        yaml = {
                            schemaStore = {
                                enable = false,
                                url = "",
                            },
                            schemas = require("schemastore").yaml.schemas(),
                        },
                    },
                },
                jsonls = {
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                            validate = { enable = true },
                            format = { enable = true },
                        },
                    },
                },
                eslint = {
                    settings = {
                        format = false,
                    },
                },
            }

            local servers_to_install = vim.tbl_filter(function(key)
                return not servers[key].manual_install
            end, vim.tbl_keys(servers))

            local formatters = {
                "prettier",
                "black",
            }

            require("mason-tool-installer").setup({
                ensure_installed = vim.list_extend(servers_to_install, formatters),
            })

            for server, config in pairs(servers) do
                config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
                lsp[server].setup(config)
            end

            vim.diagnostic.config({
                virtual_text = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "if_many",
                    header = "",
                    prefix = "",
                },
            })

            vim.keymap.set("n", "<leader>vd", function()
                vim.diagnostic.open_float()
            end)
            vim.keymap.set("n", "[d", function()
                vim.diagnostic.goto_next()
            end)
            vim.keymap.set("n", "]d", function()
                vim.diagnostic.goto_prev()
            end)
        end,
    },
}
