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
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
		}
	},
}
