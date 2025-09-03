return {
	{
		"rcasia/neotest-java",
		ft = "java",
	},
	{
		"marilari88/neotest-vitest",
		ft = { "javascript", "javascriptreact" }
	},
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
					require("neotest-java") {
					},
					require("neotest-vitest") {
						filter_dir = function(name, _rel_path, _root)
							return name ~= "node_modules"
						end,
					}
				}
			})
		end,
	}
}
