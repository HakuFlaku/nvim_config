return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",

		-- For snipping
		"hrsh7th/cmp-vsnip",
		"hrsh7th/vim-vsnip",

		-- For css intellisense
		"luckasRanarison/tailwind-tools.nvim",
		"Jezda1337/nvim-html-css",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "vsnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "html-css" },
			}),
			formatting = {
				fields = { 'abbr', 'kind', 'menu' },
				format = function(entry, item)
					local utils = require("tailwind-tools.utils")
					local config = require("tailwind-tools.config")
					local icons = require("config.icons")
					local doc = entry.completion_item.documentation
					local label_details = entry.completion_item.labelDetails

					if item.kind == "Color" and doc then
						local content = type(doc) == "string" and doc or doc.value
						local r, g, b = utils.extract_color(content)
						local style = config.options.cmp.highlight

						if r then
							item.kind_hl_group = utils.set_hl_from(r, g, b, style)
						end
					end

					if label_details and label_details.description then
						item.menu = label_details.description
					else
						item.menu = icons.cmp_menu[entry.source.name]
					end

					item.kind = icons.cmp_kind[item.kind]

					return item
				end,
			},
		})

		vim.cmd([[
		set completeopt=menuone,noinsert,noselect
		highlight! default link CmpItemKind CmpItemMenuDefault
		]])
	end,
}

