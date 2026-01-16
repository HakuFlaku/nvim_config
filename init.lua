vim.loader.enable(true)
local icons = require("config.icons")

-- Disable providers that I don't need
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.listchars = { tab = icons.misc.tab, space = icons.misc.space, trail = icons.misc.trail}
vim.opt.list = true

-- Default turn on hybrid number in the left gutter
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 3

-- reduce the default tab sizes, 8 is a bit large for me
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.linebreak = true

require("config.lazy")

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Set your color scheme/theme here, make sure you have a valid matching plugin
vim.cmd'colorscheme catppuccin-macchiato'

require("config.keybinds")
