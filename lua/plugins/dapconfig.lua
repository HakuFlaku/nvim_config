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

		dap.configurations.java = {
			{
				name = "Launch Local",
				type = "java",
				request = "launch",
				vmArgs = "-Dspring.profiles.active=local"
			}
		}

		dap.adapters.mix_task = {
			type = 'executable',
			command = vim.fn.stdpath("data") .. '/mason/bin/elixir-ls-debugger';
			args = {}
		}
		dap.configurations.elixir = {
			{
				type = "mix_task",
				name = "mix test",
				task = 'test',
				taskArgs = {"--trace"},
				request = "launch",
				startApps = true, -- for Phoenix projects
				projectDir = "${workspaceFolder}",
				requireFiles = {
					"test/**/test_helper.exs",
					"test/**/*_test.exs"
				}
			},
		}
	end,
}
