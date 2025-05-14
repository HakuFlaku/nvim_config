return {
	'nvim-java/nvim-java',
	version = "2.1.1",
	dependencies = {
		"nvim-java/nvim-java-core",
		"nvim-java/nvim-java-test",
		"nvim-java/nvim-java-dap",
		"nvim-java/lua-async-await",
		-- {
		-- 	"mason-org/mason.nvim",
		-- 	opts = {
		-- 		registries = {
		-- 			"github:nvim-java/mason-registry",
		-- 			"github:mason-org/mason-registry",
		-- 		}
		-- 	}
		-- },
		config = function()
			require("java").setup()
		end,
	},
}
