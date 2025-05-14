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

vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: start or continue debug session" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: toggle breakpoint" })
