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

		-- ** Enables vuels which uses vetur.
		--	Features enabled:
		--		picks up bootstrap components
		--		lifecycle methods (no docs)
		--		props
		--		Requires vetur config:
		--			shows custom components
		--			goto component type definition
		--	Features missing:
		--		show slot sections
		
		-- lspconfig.vuels.setup{}
		
		-- Some notes on vuels with vetur. It does a lot of things pretty nicely, but is missing some key aspects (like slots) and is two years dead in the water at this point. That said, this was built with vue 2 in mind, and thus does work with vue 2 better than Volar does out of the box. However, if possible, Volar should be what we look to use as it's actually maintained and is supported by the Vue team directly.

		-- ** Enables ts and volar.
		--	Enabled features:
		--		goto definition of custom components
		--		picks up custom components so long as they define a name and you import it once yourself.
		--		Seems to pickup global components, format isn't in kebab case though
		--	Missing features:
		--		pickup bootstrap components (there are possibly ways to fix this)
		--		available props.
		-- lspconfig.ts_ls.setup {
		-- 	init_options = {
		-- 		plugins = {
		-- 			{
		-- 				name = '@vue/typescript-plugin',
		-- 				location = require("mason-registry").get_package("vue-language-server"):get_install_path()
		-- 					.. "/node_modules/@vue/language-server",
		-- 				languages = { 'vue' },
		-- 			},
		-- 		},
		-- 	},
		-- 	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
		-- 	settings = {
		-- 		typescript = {
		-- 			inlayHints = {
		-- 				includeInlayParameterNameHints = 'all',
		-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
		-- 				includeInlayFunctionParameterTypeHints = true,
		-- 				includeInlayVariableTypeHints = true,
		-- 				includeInlayVariableTypeHintsWhenTypeMatchesName = true,
		-- 				includeInlayPropertyDeclarationTypeHints = true,
		-- 				includeInlayFunctionLikeReturnTypeHints = true,
		-- 				includeInlayEnumMemberValueHints = true,
		-- 			},
		-- 		},
		-- 	},
		-- }
		--
		-- lspconfig.volar.setup {
		-- 	init_options = {
		-- 		vue = {
		-- 			hybridMode = false,
		-- 		},
		-- 		typescript = {
		-- 			tsdk = require("mason-registry").get_package("vue-language-server"):get_install_path()
		--
		-- 		}
		-- 	},
		-- 	settings = {
		-- 		vue = {
		-- 			complete = {
		-- 				casing = {
		-- 					tags = "kebabCase",
		-- 				}
		-- 			}
		-- 		}
		-- 	}
		-- }
		
		-- lspconfig.volar.setup{
		-- 	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
		-- 	init_options = {
		-- 		vue = {
		-- 			-- disable hybrid mode
		-- 			hybridMode = false,
		-- 		},
		-- 	},
		-- 	settings = {
		-- 		vue = {
		-- 			complete = {
		-- 				casing = {
		-- 					props = "kebab",
		-- 					tags = "kebab",
		-- 				}
		-- 			}
		-- 		}
		-- 	}
		-- }
		

		lspconfig.ts_ls.setup {
			init_options = {
				plugins = {
					{
						name = '@vue/typescript-plugin',
						location = require("mason-registry").get_package("vue-language-server"):get_install_path()
							.. "/node_modules/@vue/language-server",
						languages = { 'vue' },
					},
				},
			},
			filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
		}

		-- No need to set `hybridMode` to `true` as it's the default value
		lspconfig.volar.setup {}
	end,
}
