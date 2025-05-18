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
		update_focused_file = {
			enable = true,
		},
		view = {
			float = {
				enable = true,
				open_win_config = function()
					local gheight = vim.api.nvim_list_uis()[1].height
					local gwidth = vim.api.nvim_list_uis()[1].width
					local width = 30
					local height = 30
					return {
						border = "rounded",
						relative = "editor",
						row = (gheight - height)/8,
						col = (gwidth - width)/2,
						width = width,
						height = height,
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
			highlight_git = "all",
		},
		filters = {
			git_ignored = false,
		},
	}
}
