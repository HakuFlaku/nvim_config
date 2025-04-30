return {
	"lukas-reineke/indent-blankline.nvim",
	-- main = "ibl",
	-- ---@module "ibl"
	-- ---@type ibl.config
	-- opts = {},
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
	end,
}
