return {
	{
		"rcasia/neotest-java",
		ft = "java",
		dependencies = {
			"rcarriga/nvim-dap-ui", -- recommended
		},
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-java")({
						-- config here
					}),
				}
			})
		end,
	}
}
