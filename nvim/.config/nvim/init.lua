require("mister.options")
require("mister.keymaps")
require("mister.autocmd")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ import = "mister.plugins" })

-- plugins
require("mister.configs.catppuccin")
require("mister.configs.gruvbox")
-- require("mister.configs.oil")
require("mister.configs.conform")

vim.cmd([[colorscheme gruber-darker]])
