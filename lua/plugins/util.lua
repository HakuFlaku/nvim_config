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
	}
}
