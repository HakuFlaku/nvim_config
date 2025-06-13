return {
	'nvim-telescope/telescope.nvim',
	lazy = true,
	dependencies = {
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-ui-select.nvim"
	},
	config = function()
		local ts = require'telescope'
		local ts_actions = require'telescope.actions'
		ts.setup {
			defaults = {
				mappings = {
					n = {
						["q"] = ts_actions.close
					}
				}
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_cursor {
						-- even more opts
					}

				}
			}
		}
		ts.load_extension("ui-select")
	end,
}
