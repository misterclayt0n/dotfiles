return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- Temporarily set an empty statusline until lualine loads
			vim.o.statusline = " "
		else
			-- Hide the statusline on the start screen
			vim.o.laststatus = 0
		end
	end,
	opts = function()
		-- Naysayer palette colors
		local colors = {
			back          = "#062329", -- Background (bg)
			default       = "#d1b897", -- Default text (text)
			margin_active = "#126367", -- Active margin (line-fg)
			cursor        = "#a1efe4", -- Cursor (cyan)
			highlight     = "#0b3335", -- Highlight (highlight-line)
			at_highlight  = "#e6db74", -- Alternative highlight (yellow)
			keyword       = "#ffffff", -- Keywords (keywords)
			constant      = "#7ad0c6", -- Constants (constants)
			preproc       = "#fd971f", -- Preprocessor / accent (orange)
			special       = "#f92672", -- Special/error (red)
			bar           = "#aaaaaa", -- Inactive bar (indent)
			bar_active    = "#c1d1e3", -- Active bar (variables)
		}

		-- Define the custom lualine theme using the Naysayer colors
		local custom_theme = {
			normal = {
				a = { bg = colors.margin_active, fg = colors.default, gui = "bold" },
				b = { bg = colors.back,          fg = colors.default },
				c = { bg = colors.back,          fg = colors.default },
			},
			insert = {
				a = { bg = colors.cursor,        fg = colors.back,    gui = "bold" },
				b = { bg = colors.back,          fg = colors.default },
				c = { bg = colors.back,          fg = colors.default },
			},
			visual = {
				a = { bg = colors.highlight,     fg = colors.at_highlight, gui = "bold" },
				b = { bg = colors.back,          fg = colors.default },
				c = { bg = colors.back,          fg = colors.default },
			},
			replace = {
				a = { bg = colors.special,       fg = colors.back,    gui = "bold" },
				b = { bg = colors.back,          fg = colors.default },
				c = { bg = colors.back,          fg = colors.default },
			},
			command = {
				a = { bg = colors.keyword,       fg = colors.back,    gui = "bold" },
				b = { bg = colors.back,          fg = colors.default },
				c = { bg = colors.back,          fg = colors.default },
			},
			inactive = {
				a = { bg = colors.bar,           fg = colors.default, gui = "bold" },
				b = { bg = colors.back,          fg = colors.default },
				c = { bg = colors.back,          fg = colors.default },
			},
		}

		return {
			options = {
				theme = custom_theme,
				globalstatus = vim.o.laststatus == 3,
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" },
				},
			},
		}
	end,
}

