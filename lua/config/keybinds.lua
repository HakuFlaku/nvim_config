-- telescope
local telescope = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope: find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope: live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope: buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope: help tags' })

-- diagnostic information
vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { desc = "Toggles snip of diagnostic information" })

-- NvimTree
local nvim_tree = require("nvim-tree.api")

vim.keymap.set("n", "<leader>tt", nvim_tree.tree.toggle, { desc = "Nvim Tree: toggle tree", noremap = true, silent = true, nowait = true })

-- DAP
local dap = require("dap")

vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: start or continue debug session" })
vim.keymap.set("n", "<F2>", dap.step_over, { desc = "DAP: step over" })
vim.keymap.set("n", "<F3>", dap.step_into, { desc = "DAP: step into" })
vim.keymap.set("n", "<F4>", dap.step_out, { desc = "DAP: step out" })
vim.keymap.set("n", "<F6>", dap.run_to_cursor, { desc = "DAP: run to cursor" })
vim.keymap.set("n", "<localleader>bc", dap.clear_breakpoints, { desc = "DAP: clear all breakpoints" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: toggle breakpoint" })

-- Neotest
local neotest = require'neotest'

vim.keymap.set('n', '<leader>trr', neotest.run.run, { desc = "Neotest: run the nearest test" })
vim.keymap.set('n', '<leader>trs', function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Neotest: run the opened test suite" })
vim.keymap.set('n', '<leader>trl', neotest.run.run_last, { desc = "Neotest: run the last ran test" })
vim.keymap.set('n', '<leader>st', neotest.run.stop, { desc = "Neotest: stop a running test" })
vim.keymap.set('n', '<leader>tst', neotest.summary.toggle, { desc = "Neotest: toggle summary panel" })
vim.keymap.set('n', '<C-[><C-n>', function() neotest.jump.prev({ status = "failed" }) end, { desc = "Neotest: jump to previous failed test" })
vim.keymap.set('n', '<C-]><C-n>', function() neotest.jump.next({ status = "failed" }) end, { desc = "Neotest: jump to next failed test" })
vim.keymap.set('n', '[n', neotest.jump.prev, { desc = "Neotest: jump to previous test" })
vim.keymap.set('n', ']n', neotest.jump.next, { desc = "Neotest: jump to next test" })
