return {
	{
		"rcasia/neotest-java",
		ft = "java",
		dependencies = {
			"rcarriga/nvim-dap-ui", -- recommended
			"theHamsta/nvim-dap-virtual-text", -- recommended
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
