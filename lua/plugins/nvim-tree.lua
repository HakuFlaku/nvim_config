return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		hijack_cursor = true,
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			float = {
				enable = true,
				open_win_config = function()
					local screen_w = vim.opt.columns:get()
					local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
					local w_h = 70
					local s_h = 24
					local center_x = (screen_w - w_h) / 2
					local center_y = ((vim.opt.lines:get() - s_h) / 5) - vim.opt.cmdheight:get()
					return {
						border = "rounded",
						relative = "editor",
						row = center_y,
						col = center_x,
						width = w_h,
						height = s_h,
					}
				end,
			},
			width = {
				min = 30,
				padding = 2,
			},
			number = true,
			relativenumber = true,
		},
		renderer = {
			group_empty = true,
			hidden_display = "simple",
			indent_markers = {
				enable = true,
			},
		},
		filters = {
			git_ignored = false,
		},

	}
}
