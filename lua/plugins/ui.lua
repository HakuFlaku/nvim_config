return {
	{
		"lewis6991/gitsigns.nvim"
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			local highlight = {
				"flagBlue",
				"flagPink",
				"flagWhite",
			}

			local hooks = require "ibl.hooks"
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "flagBlue", { fg = "#5BCFFB" })
				vim.api.nvim_set_hl(0, "flagPink", { fg = "#F5ABB9" })
				vim.api.nvim_set_hl(0, "flagWhite", { fg = "#FFFFFF" })
			end)

			require("ibl").setup {
				indent = { highlight = highlight },
			}
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		version = "*",
		lazy = false,
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		opts = {
			enabled = true,
			enabled_commands = true,
			highlight_changed_variables = true,
			only_first_definition = true,
			virt_text_pos = 'eol',
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio"
		},
		opts = {
			layouts = {
				{
					elements = {
						{
							id = "watches",
							size = 0.3
						},
						{
							id = "breakpoints",
							size = 0.3
						},
						{
							id = "scopes",
							size = 0.4
						},
					},
					position = "left",
					size = 40
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5
						},
						{
							id = "console",
							size = 0.5
						}
					},
					position = "bottom",
					size = 10
				}
			},
		}
	}
}
