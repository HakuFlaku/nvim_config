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
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"nvim-java/nvim-java",
	},
	lazy = false,
	config = function(_, opts)
		require("mason").setup()
		require("mason-lspconfig").setup {
			automatic_enable = true,
			ensure_installed = {"rust_analyzer", "lua_ls", "elixirls"}
		}

		vim.diagnostic.config(diagnostic_opts())

		local on_attach = function(_, bufnr)
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

		vim.lsp.config("jdtls", {
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
	end,
}
