local icons = require("config.icons")

return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		'nvim-lualine/lualine.nvim',
		version = "*",
		lazy = false,
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				theme = "auto"
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress", "location" },
				lualine_z = { "lsp_status" }
			},
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
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
		event = "BufRead",
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
	},
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			local dashboard_options = require("config.dashboard_options")
			math.randomseed(os.time())
			local choice = math.random(#dashboard_options)

			-- Set header
			dashboard.section.header.val = dashboard_options[choice]

			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button( "e", icons.dashboard.explorer .. " > Open tree ", ":NvimTreeOpen<CR>"),
				dashboard.button( "f", icons.dashboard.find_file .. " > Find file", ":Telescope find_files<CR>"),
				dashboard.button( "s", icons.dashboard.settings .. " > Settings" , ":e $MYVIMRC | :cd %:p:h | NvimTreeOpen | wincmd k | pwd<CR>"),
				dashboard.button( "q", icons.dashboard.quit .. " > Quit NVIM", ":qa<CR>"),
			}
			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[
			autocmd FileType alpha setlocal nofoldenable
			]])
		end,
	}
}
