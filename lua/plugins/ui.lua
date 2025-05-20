local icons = require("config.icons")

return {
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			presets = {
				long_message_to_split = true,
			},
			cmdline = {
				enabled = true, -- Disabling this aspect of noice essentially removes the entire command line which isn't great. However I prefer the stock cmdline.
				view = "cmdline" -- This get's _close_ to the original form, but it's still modified which isn't ideal for me.
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
		}
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
		lazy = true,
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
	},
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			local dashboard_options = require("config.dashboard_options")
			math.randomseed(os.time())
			local choice = math.random(#dashboard_options)
			print("Loading dashboard choice: " .. choice)

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
