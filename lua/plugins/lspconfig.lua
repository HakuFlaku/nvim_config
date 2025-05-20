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
		{
			"mason-org/mason.nvim",
			opts = {
				registries = {
					"github:nvim-java/mason-registry",
					"github:mason-org/mason-registry"
				}
			}
		},
		"mason-org/mason-lspconfig.nvim",
		"mfussenegger/nvim-jdtls",
	},
	lazy = false,
	config = function(_, opts)
		require("mason").setup()
		require("mason-lspconfig").setup {
			automatic_enable = true,
			ensure_installed = {"rust_analyzer", "lua_ls", "elixirls", "volar"}
		}

		vim.diagnostic.config(diagnostic_opts())

		local on_attach = function(_, bufnr)
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
			vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
		end

		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		vim.lsp.config("rust_analyzer", {
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

		vim.lsp.config("elixirls", {
			cmd = { vim.fn.expand("$MASON/packages/elixir-ls/language_server.sh") },
			on_attach = on_attach,
			capabilities = capabilities,
		})

		vim.lsp.config("tailwindcss", {
			on_attach = on_attach,
			capabilities = capabilities,
		})

		vim.lsp.config("lua_ls", {
			on_attach = on_attach,
			capabilities = capabilities,
		})

		require('spring_boot').init_lsp_commands()
		vim.lsp.config("jdtls", {
			on_attach = on_attach,
			capabilities = capabilities,
			init_options = {
				-- bundles = {
				-- 	require("spring_boot").java_extensions()
				-- }
				bundles = require("spring_boot").java_extensions()
			}
		})
		require("spring_boot").init_lsp_commands()

		vim.lsp.config("volar", {
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
			init_options = {
				vue = {
					hybridMode = false,
				},
			},
		})
	end,
}
