return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "blazkowolf/gruber-darker.nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "NLKNguyen/papercolor-theme", name = "papercolor" },
	{ "sindresorhus/focus" },
	{ "AlessandroYorba/Despacio" },
	{ "huyvohcmc/atlas.vim" },
	{ "plan9-for-vimspace/acme-colors" },
	{ "aditya-azad/candle-grey" },
	{ "sainnhe/gruvbox-material" },
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
	{ "kdheepak/monochrome.nvim" },
	{ "olivercederborg/poimandres.nvim" },
	{ "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },
	{ "sainnhe/gruvbox-material" },
	{ "CreaturePhil/vim-handmade-hero" },
	-- { "alljokecake/naysayer-theme.nvim" },
	{ "whizikxd/naysayer-colors.nvim" },
	{
		name = "hello",
		dir = vim.fn.stdpath("config") .. "/colors",
		lazy = false,
		priority = 1000, -- Garante que seja carregado antes de outros plugins
		config = function()
			vim.cmd("colorscheme naysayer")
		end,
	},
}
