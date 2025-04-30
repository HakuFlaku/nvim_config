local function diagnostic_opts()
	local icons = require("config.icons")
	return {
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = icons.diagnostics.virtual_prefix,
			},
		},
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
				[vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
				[vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
				[vim.diagnostic.severity.INFO] = icons.diagnostics.info,
			},
		},
		inlay_hints = {
			enabled = true,
		},
		codelens = {
			enabled = true,
		},
	}
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	lazy = false,
	config = function(_, opts)
		require("mason").setup()
		require("mason-lspconfig").setup()

		vim.diagnostic.config(diagnostic_opts())

		local lspconfig = require'lspconfig'

		local on_attach = function(client, bufnr)
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
			vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
			vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
			vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
			vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		end

		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		lspconfig.rust_analyzer.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					cargo = {
						buildScripts = {
							enable = true,
						},
					},
					procMacro = {
						enable = true
					},
				}
			}
		})

		lspconfig.elixirls.setup{
			-- cmd = { vim.fn.expand("~/.elixirls/language_server.sh") },
			on_attach = on_attach,
			capabilities = capabilities,
		}

		-- lspconfig.vuels.setup{
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- }
		--
		-- lspconfig.ts_ls.setup{
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- }

		-- lspconfig.volar.setup {
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
		-- 	init_options = {
		-- 		vue = {
		-- 			hybridMode = false,
		-- 		},
		-- 	},
		-- }
		-- lspconfig.volar.setup {
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	settings = {
		-- 		vue = {
		-- 			complete = {
		-- 				casing = {
		-- 					props = "kebab",
		-- 					tags = "kebab",
		-- 				}
		-- 			}
		-- 		}
		-- 	},
		-- 	init_options = {
		-- 		typescript = {
		-- 			tsdk = vim.fn.expand(
		-- 				"~/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
		-- 			),
		-- 		},
		-- 	}
		-- }
		--
		-- lspconfig.vtsls.setup {
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	filetypes = { "typescript", "javascript", "vue" },
		-- 	settings = {
		-- 		vtsls = {
		-- 			tsserver = {
		-- 				globalPlugins = {
		-- 					{
		-- 						name = "@vue/typescript-plugin",
		-- 						location = require("mason-registry").get_package("vue-language-server"):get_install_path()
		-- 							.. "/node_modules/@vue/language-server",
		-- 						languages = { "vue" },
		-- 						configNamespace = "typescript",
		-- 						enableForWorkspaceTypeScriptVersions = true,
		-- 					},
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- }
	end,
}
