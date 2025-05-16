return {
	-- {
	-- 	"vim-scripts/java_getset.vim",
	-- },
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
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		}
	},
	-- {
	-- 	"stevearc/overseer.nvim",
	-- 	opts = {}
	-- }
}
