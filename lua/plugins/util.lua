vim.g.spring_boot = {
	jdt_extendions_path = "~/Downloads/vscode-spring-boot-1.62.0/",
	jdt_extensions_jars = {
		"io.projectreactor.reactor-core.jar",
		"org.reactivestreams.reactive-streams.jar",
		"jdt-ls-commons.jar",
		"jdt-ls-extension.jar",
	},
}

return {
	-- {
	-- 	"vim-scripts/java_getset.vim",
	-- },
	{
		"windwp/nvim-autopairs",
		lazy = true,
		event = "InsertEnter",
		opts = {}
	},
	{
		"jeffkreeftmeijer/vim-numbertoggle",
		version = "*",
		lazy = false,
	},
	{
		"JavaHello/spring-boot.nvim",
		lazy = true,
		config = function()
			vim.g.spring_boot = {
				jdt_extensions_path = vim.fn.expand("$MASON/packages/spring-boot-tools/extension/language-server/"),
				jdt_extensions_jars = {
					"io.projectreactor.reactor-core.jar",
					"org.reactivestreams.reactive-streams.jar",
					"jdt-ls-commons.jar",
					"jdt-ls-extension.jar",
				},
			}
			require('spring_boot').setup({
				ls_path = vim.fn.expand("$MASON/packages/spring-boot-tools/extension/language-server/"), -- defaults to ~/.vscode/extensions/vmware.vscode-spring-boot-x.xx.x
				jdtls_name = "jdtls",
				log_file = vim.fn.expand("~/.local/state/nvim/spring_tools.txt"),
			})
		end,
	}
}
