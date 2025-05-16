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
	{
		"vim-scripts/java_getset.vim",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}
	},
	{
		"jeffkreeftmeijer/vim-numbertoggle",
		version = "*",
		lazy = false,
	},
	{
		'simaxme/java.nvim',
		opts = {
			rename = {
				enable = true,
				nvimtree = true,
				write_and_close = false,
			},
			snippets = {
				enable = true,
			},
			root_markers = {
				"main/java/",
				"test/java/"
			}
		}
	},
	{
		"JavaHello/spring-boot.nvim",
		lazy = true,
		opts = {
			ls_path = "~/Downloads/vscode-spring-boot-1.62.0/"
		}
	}
	-- {
	-- 	"elmcgill/springboot-nvim",
	-- 	opts = {}
	-- }
}
