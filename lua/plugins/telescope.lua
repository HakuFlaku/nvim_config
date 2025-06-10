return {
	'nvim-telescope/telescope.nvim',
	lazy = true,
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-ui-select.nvim"
	},
	config = function()
		require("telescope").setup {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_cursor {
						-- even more opts
					}

				}
			}
		}
		require("telescope").load_extension("ui-select")
	end,
}
