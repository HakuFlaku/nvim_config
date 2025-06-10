return {
	"mfussenegger/nvim-dap",
	config = function()
		local icons = require("config.icons").dap

		vim.fn.sign_define("DapBreakpoint", {text=icons.breakpoint, texthl="DevIconExe"})

		local dap = require("dap")
		local dapui = require('dapui')

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
	end,
}
