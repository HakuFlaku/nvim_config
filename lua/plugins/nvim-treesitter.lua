return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"markdown",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = false },
			auto_install = true,
			ignore_install = {}, -- Add any languages that are not wanted to be installed, ever...
			modules = {}, -- Add any custom modules here.
		})
	end
}
