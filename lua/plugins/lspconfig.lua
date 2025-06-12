local function diagnostic_opts()
	local icons = require("config.icons")
	return {
		underline = true,
		update_in_insert = false,
		virtual_text = {
			spacing = 4,
			source = "if_many",
			prefix = icons.diagnostics.virtual_prefix,
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
	}
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		{
			"mfussenegger/nvim-jdtls",
			dependencies = {
				"mfussenegger/nvim-dap"
			}
		},
	},
	lazy = false,
	config = function(_, opts)
		require("mason").setup()
		require("mason-lspconfig").setup {
			automatic_enable = true,
			ensure_installed = { "lua_ls", "elixirls", "ts_ls", "jdtls", "cssls" }
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
	end,
}
