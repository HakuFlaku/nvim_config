-- Disable providers that I don't need
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.listchars = { tab = '⇥ ', space = '·', trail = '~'}
vim.opt.list = true

-- Default turn on hybrid number in the left gutter
vim.opt.number = true
vim.opt.relativenumber = true

-- reduce the default tab sizes, 8 is a bit large for me
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

require("config.lazy")
require("nvim-tree.api").tree.open()

-- Set your color scheme/theme here, make sure you have a valid matching plugin
vim.cmd'colorscheme catppuccin-macchiato'

-- Set a custom theme for the command line section
require('lualine').setup {
	options = {
		theme = 'seoul256',
	}
}

require("config.keybinds")
