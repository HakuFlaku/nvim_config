return {
	{
		"nvim-neotest/neotest",
		lazy = true,
		dependencies = {
			"nvim-neotest/nvim-nio",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require"neotest".setup({
				adapters = {
				}
			})
		end,
	}
}
