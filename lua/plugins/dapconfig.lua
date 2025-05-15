return {
	"mfussenegger/nvim-dap",
	config = function()
		local icons = require("config.icons").dap

		vim.fn.sign_define("DapBreakpoint", {text=icons.breakpoint, texthl="DevIconExe"})

		local dap = require("dap")

		dap.configurations.java = {
			{
				name = "Launch Local",
				type = "java",
				request = "launch",
				vmArgs = "-Dspring.profiles.active=local"
			}
		}

		dap.adapters.codelldb = {
			type = 'server',
			port = "${port}",
			executable = {
				command = vim.fn.expand'$MASON/packages/codelldb/extension/adapter/codelldb',
				args = {"--port", "${port}"},
			}
		}

		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false
			},
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
