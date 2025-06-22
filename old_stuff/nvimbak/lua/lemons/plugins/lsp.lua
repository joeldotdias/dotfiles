return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- Mason
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",

            -- Schema info
            "b0o/SchemaStore.nvim",

            -- completions
            "saghen/blink.cmp",
        },

        config = function()
            local lsp = require("lspconfig")
            local blink_cmp = require("blink.cmp")

            local LspLemon = vim.api.nvim_create_augroup("LspLemon", { clear = true })

            -- create an autocommand that sets keymaps whenever an LSP is attached to the buffer
            -- instead of passing an on_attach() function to server setup
            vim.api.nvim_create_autocmd("LspAttach", {
                group = LspLemon,
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

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client == nil then
                        return
                    end
                    if client.name == "ruff" then
                        -- Disable hover in favor of basedpyright
                        client.server_capabilities.hoverProvider = false
                    end
                end,
                desc = "LSP: Disable hover capability from Ruff",
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

            local jsts_settings = {
                suggest = { completeFunctionCalls = true },
                inlayHints = {
                    functionLikeReturnTypes = { enabled = true },
                    parameterNames = { enabled = "literals" },
                    variableTypes = { enabled = true },
                },
            }

            -- {} --> use the default config
            local servers = {
                rust_analyzer = {
                    procMacro = {
                        ignored = {
                            leptos_macro = {
                                "server",
                                "component",
                            },
                        },
                    },
                },
                gopls = {},
                ocamllsp = {
                    manual_install = true,
                    filetypes = {
                        "ocaml",
                    },
                },
                zls = {},
                --[[ ts_ls = {
                    settings = {
                        implicitProjectConfiguration = {
                            checkJs = true, -- for jsdoc
                        },
                        completions = {
                            completeFunctionCalls = true,
                        },
                    },
                }, ]]
                vtsls = {
                    settings = {
                        typescript = jsts_settings,
                        javascript = jsts_settings,
                        vtsls = {
                            autoUseWorkspaceTsdk = true,
                            experimental = {
                                -- Inlay hint truncation.
                                maxInlayHintLength = 30,
                                -- For completion performance.
                                completion = {
                                    enableServerSideFuzzyMatch = true,
                                },
                            },
                        },
                    },
                },

                clangd = {
                    cmd = {
                        "clangd",
                        "--clang-tidy",
                        "--header-insertion=never",
                        "--fallback-style=none",
                        "--function-arg-placeholders=false",
                    },
                    capabilities = {
                        offsetEncoding = { "utf-16" },
                    },
                },

                bashls = {},

                basedpyright = {
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "standard",
                                autoImportCompletions = true,
                                useLibraryCodeForTypes = true, -- Analyze library code for type information
                                autoSearchPaths = true,
                                diagnosticMode = "workspace",
                                reportExplicitAny = false,
                            },
                        },
                    },
                },

                ruff = {
                    init_options = {
                        LogLevel = "error",
                    },
                },

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
                emmet_language_server = {
                    filetypes = { "html", "javascriptreact", "typescriptreact", "templ" },
                },
                templ = {},
                html = {},
                -- htmx = {},
                cssls = {},
                tailwindcss = {
                    root_dir = lsp.util.root_pattern("tailwind.config.js", "tailwind.config.ts", "postcss*"),
                    settings = {
                        tailwindCSS = {
                            experimental = {
                                classRegex = {
                                    { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                                    { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                                },
                            },
                        },
                    },
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
                "shfmt",
                "prettier",
                "stylua",
            }

            require("mason-tool-installer").setup({
                ensure_installed = vim.list_extend(servers_to_install, formatters),
            })

            for server, config in pairs(servers) do
                config.capabilities = blink_cmp.get_lsp_capabilities(config.capabilities)
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
