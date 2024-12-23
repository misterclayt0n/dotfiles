return {
	{
		"stevearc/oil.nvim",
		opts = {
			columns = {
				"icon",
				"permissions",
				"size",
				"mtime",
			},
			view_options = {
				show_hidden = true,
			},
		},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "romainl/vim-cool" },
	{ "tpope/vim-surround" },
	{
		"numToStr/Comment.nvim",
		config = true,
		lazy = false,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	{
		{
			"gbprod/yanky.nvim",
			dependencies = not jit.os:find("Windows") and { "kkharji/sqlite.lua" } or {},
			opts = {
				highlight = { timer = 150 },
				ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
			},
		},
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},

	{
		"ej-shafran/compile-mode.nvim",
		-- you can just use the latest version:
		-- branch = "latest",
		-- or the most up-to-date updates:
		-- branch = "nightly",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- if you want to enable coloring of ANSI escape codes in
			-- compilation output, add:
			{ "m00qek/baleia.nvim", tag = "v1.3.0" },
		},
		config = function()
			---@type CompileModeOpts
			vim.g.compile_mode = {
				-- to add ANSI escape code support, add:
				baleia_setup = true,
			}
		end,
	},
}
