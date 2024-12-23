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
require("mister.configs.conform")

vim.cmd([[colorscheme gruvbox-material]])

-- workaround for rust analyzer being a piece of shit (or maybe neovim itself, don't know, don't care)
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_diagnostic_handler = vim.lsp.handlers[method]
    vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
            return
        end
        return default_diagnostic_handler(err, result, context, config)
    end
end
